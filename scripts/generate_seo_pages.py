#!/usr/bin/env python3
"""
SEO 프리렌더링 스크립트
=====================
Flutter Web은 CanvasKit/HTML 렌더러를 사용해 콘텐츠를 그리기 때문에
검색엔진 크롤러(Googlebot, AdsBot 등)가 본문 텍스트를 인식할 수 없습니다.

이 스크립트는 flutter build web 이후 실행하여:
1. 각 블로그 포스트 URL에 대해 '실제 콘텐츠 + Flutter bootstrap' HTML 생성
2. 카테고리 목록 페이지 HTML 생성
3. 홈페이지 index.html 개선 (SEO 콘텐츠 삽입)

크롤러 → HTML에서 콘텐츠를 읽음 (SEO 인덱싱)
브라우저 → HTML 로드 후 Flutter가 렌더링을 대체함
"""

import os
import re
import json
from pathlib import Path

# ── 경로 설정 ──
PROJECT_ROOT = Path(__file__).parent.parent
ASSETS_DIR = PROJECT_ROOT / 'assets'
BUILD_DIR = PROJECT_ROOT / 'build' / 'web'
BLOG_DATA_FILE = PROJECT_ROOT / 'lib' / 'models' / 'blog_data.dart'

SITE_URL = 'https://ambro.space'
ADSENSE_CLIENT = 'ca-pub-1444459980078427'

CATEGORY_NAMES = {
    'java': 'Java',
    'python': 'Python',
    'ai-basic': 'AI 개발 기초',
    'ai-insight': 'AI Insight',
}

# ── Dart 파일 파싱 ──

def parse_blog_data():
    """blog_data.dart를 파싱하여 포스트 메타데이터를 추출합니다."""
    content = BLOG_DATA_FILE.read_text(encoding='utf-8')
    posts = []
    pattern = r'BlogPost\(\s*(.*?)\s*\),'
    matches = re.finditer(pattern, content, re.DOTALL)

    for match in matches:
        block = match.group(1)
        post = {}

        for field in ['title', 'description', 'category', 'date', 'fileName', 'readTime', 'author']:
            m = re.search(rf"{field}:\s*'([^']*)'", block)
            if m:
                post[field] = m.group(1)

        tags_match = re.search(r"tags:\s*\[([^\]]*)\]", block)
        if tags_match:
            post['tags'] = [t.strip().strip("'") for t in tags_match.group(1).split(',') if t.strip()]
        else:
            post['tags'] = []

        thumb_match = re.search(r"thumbnailUrl:\s*'([^']*)'", block)
        if thumb_match:
            post['thumbnailUrl'] = thumb_match.group(1)

        if 'title' in post and 'category' in post:
            posts.append(post)

    return posts


# ── 마크다운 → HTML 변환 ──

def inline_format(text):
    """인라인 마크다운 서식 적용 (bold, italic, code, link)."""
    text = re.sub(r'`([^`]+)`', r'<code>\1</code>', text)
    text = re.sub(r'\*\*([^*]+)\*\*', r'<strong>\1</strong>', text)
    text = re.sub(r'(?<!\*)\*(?!\*)([^*]+)(?<!\*)\*(?!\*)', r'<em>\1</em>', text)
    text = re.sub(r'\[([^\]]+)\]\(([^)]+)\)', r'<a href="\2">\1</a>', text)
    return text


def md_to_html(md_content):
    """Markdown을 기본적인 HTML로 변환합니다 (SEO용)."""
    lines = md_content.split('\n')
    html_parts = []
    in_code = False
    in_list = False
    in_table = False

    for line in lines:
        stripped = line.strip()

        # 코드 블록
        if stripped.startswith('```'):
            if in_code:
                html_parts.append('</code></pre>')
                in_code = False
            else:
                lang = stripped[3:].strip()
                html_parts.append(f'<pre><code class="language-{lang}">')
                in_code = True
            continue
        if in_code:
            escaped = line.replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;')
            html_parts.append(escaped)
            continue

        if not stripped:
            if in_list:
                html_parts.append('</ul>')
                in_list = False
            if in_table:
                html_parts.append('</tbody></table>')
                in_table = False
            continue

        # 제목
        hm = re.match(r'^(#{1,6})\s+(.+)$', stripped)
        if hm:
            if in_list:
                html_parts.append('</ul>')
                in_list = False
            lvl = len(hm.group(1))
            html_parts.append(f'<h{lvl}>{inline_format(hm.group(2))}</h{lvl}>')
            continue

        # 테이블 구분선 건너뛰기
        if re.match(r'^\|[\s\-:|]+\|$', stripped):
            continue

        # 테이블 행
        if stripped.startswith('|') and stripped.endswith('|'):
            cells = [c.strip() for c in stripped.split('|')[1:-1]]
            if not in_table:
                html_parts.append('<table><thead><tr>')
                for c in cells:
                    html_parts.append(f'<th>{inline_format(c)}</th>')
                html_parts.append('</tr></thead><tbody>')
                in_table = True
            else:
                html_parts.append('<tr>')
                for c in cells:
                    html_parts.append(f'<td>{inline_format(c)}</td>')
                html_parts.append('</tr>')
            continue

        # 이미지
        im = re.match(r'^!\[([^\]]*)\]\(([^)]+)\)', stripped)
        if im:
            alt, src = im.group(1), im.group(2)
            if src.startswith('assets/'):
                src = f'/assets/{src}'
            html_parts.append(f'<img src="{src}" alt="{alt}" loading="lazy" style="max-width:100%;height:auto;border-radius:8px;margin:1em 0;">')
            continue

        # 인용
        if stripped.startswith('>'):
            html_parts.append(f'<blockquote><p>{inline_format(stripped[1:].strip())}</p></blockquote>')
            continue

        # 리스트
        lm = re.match(r'^[-*]\s+(.+)', stripped)
        if lm:
            if not in_list:
                html_parts.append('<ul>')
                in_list = True
            html_parts.append(f'<li>{inline_format(lm.group(1))}</li>')
            continue

        # 숫자 리스트
        ol = re.match(r'^\d+[).]\s+(.+)', stripped)
        if ol:
            if not in_list:
                html_parts.append('<ul>')
                in_list = True
            html_parts.append(f'<li>{inline_format(ol.group(1))}</li>')
            continue

        # 이탤릭 줄
        if stripped.startswith('_') and stripped.endswith('_') and len(stripped) > 2:
            html_parts.append(f'<p><em>{stripped[1:-1]}</em></p>')
            continue

        # 일반 문단
        html_parts.append(f'<p>{inline_format(stripped)}</p>')

    if in_list:
        html_parts.append('</ul>')
    if in_table:
        html_parts.append('</tbody></table>')
    if in_code:
        html_parts.append('</code></pre>')

    return '\n'.join(html_parts)


# ── HTML 페이지 생성 ──

FLUTTER_HIDE_SCRIPT = '''<script>
var _o=new MutationObserver(function(m){
  var f=document.querySelector('flt-glass-pane,flutter-view');
  if(f){
    var e=document.getElementById('seo-content');
    var n=document.querySelector('nav.breadcrumb');
    if(e)e.style.display='none';
    if(n)n.style.display='none';
    _o.disconnect();
  }
});
_o.observe(document.body,{childList:true,subtree:true});
</script>'''


def generate_post_html(post, md_content):
    """블로그 포스트에 대한 완전한 HTML 페이지를 생성합니다."""
    title = post.get('title', '')
    desc = post.get('description', '')
    cat = post.get('category', '')
    cat_name = CATEGORY_NAMES.get(cat, cat)
    date = post.get('date', '')
    tags = post.get('tags', [])
    fn = post.get('fileName', '')
    read_time = post.get('readTime', '5분')
    author = post.get('author', 'Ambro')
    thumb = post.get('thumbnailUrl', '')

    thumb_web = f'/assets/{thumb}' if thumb.startswith('assets/') else thumb
    canonical = f'{SITE_URL}/blog/{cat}/{fn}'
    content_html = md_to_html(md_content)
    tags_html = ' '.join(f'<span class="tag">{t}</span>' for t in tags)

    json_ld = json.dumps({
        "@context": "https://schema.org",
        "@type": "BlogPosting",
        "headline": title,
        "description": desc,
        "author": {"@type": "Person", "name": author},
        "datePublished": date,
        "dateModified": date,
        "image": f'{SITE_URL}{thumb_web}' if thumb_web.startswith('/') else thumb_web,
        "publisher": {"@type": "Organization", "name": "Ambro Tech", "url": SITE_URL},
        "mainEntityOfPage": {"@type": "WebPage", "@id": canonical},
        "keywords": ', '.join(tags),
    }, ensure_ascii=False, indent=2)

    return f'''<!DOCTYPE html>
<html lang="ko">
<head>
  <base href="/">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{title} - Ambro Tech Blog</title>
  <meta name="description" content="{desc}">
  <meta name="keywords" content="{', '.join(tags)}">
  <meta name="author" content="{author}">
  <meta name="naver-site-verification" content="3950b7e8fb9f37b138fdaee4034c393ed1c24bc8" />
  <meta property="og:type" content="article">
  <meta property="og:title" content="{title}">
  <meta property="og:description" content="{desc}">
  <meta property="og:url" content="{canonical}">
  <meta property="og:image" content="{SITE_URL}{thumb_web}">
  <meta property="og:site_name" content="Ambro Tech Blog">
  <meta property="article:published_time" content="{date}">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="{title}">
  <meta name="twitter:description" content="{desc}">
  <meta name="twitter:image" content="{SITE_URL}{thumb_web}">
  <link rel="canonical" href="{canonical}">
  <link rel="sitemap" type="application/xml" href="/sitemap.xml">
  <link rel="alternate" type="application/rss+xml" title="Ambro Tech Blog RSS" href="/rss.xml">
  <script type="application/ld+json">
{json_ld}
  </script>
  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client={ADSENSE_CLIENT}" crossorigin="anonymous"></script>
  <style>
    body{{margin:0;padding:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,'Noto Sans KR',sans-serif}}
    #seo-content{{max-width:800px;margin:0 auto;padding:24px 16px;color:#333;line-height:1.8}}
    #seo-content h1{{font-size:2em;line-height:1.3;margin-bottom:.5em;color:#1a1a1a}}
    #seo-content h2{{font-size:1.5em;margin-top:2em;color:#212529;border-bottom:1px solid #eee;padding-bottom:.3em}}
    #seo-content h3{{font-size:1.25em;margin-top:1.5em;color:#343a40}}
    #seo-content h4{{font-size:1.1em;margin-top:1.2em;color:#495057}}
    #seo-content p{{margin:1em 0;font-size:16px}}
    #seo-content code{{background:#f1f3f5;padding:2px 6px;border-radius:4px;font-family:'SFMono-Regular',Consolas,monospace;font-size:.9em;color:#e83e8c}}
    #seo-content pre{{background:#f8f9fa;padding:16px;border-radius:8px;overflow-x:auto;border:1px solid #e9ecef}}
    #seo-content pre code{{background:none;color:#333;padding:0}}
    #seo-content img{{max-width:100%;height:auto;border-radius:8px;margin:1em 0}}
    #seo-content table{{width:100%;border-collapse:collapse;margin:1em 0;font-size:14px}}
    #seo-content th,#seo-content td{{border:1px solid #dee2e6;padding:8px 12px;text-align:left}}
    #seo-content th{{background:#f8f9fa;font-weight:600}}
    #seo-content blockquote{{border-left:4px solid #dee2e6;margin:1em 0;padding:.5em 1em;background:#f8f9fa;border-radius:0 8px 8px 0}}
    #seo-content ul{{padding-left:1.5em}}
    #seo-content li{{margin:.4em 0}}
    .meta{{color:#6c757d;font-size:14px;margin-bottom:2em}}
    .tags{{margin-bottom:1em}}
    .tag{{display:inline-block;background:#e3f2fd;color:#1976d2;padding:4px 12px;border-radius:20px;font-size:13px;margin-right:8px;margin-bottom:4px}}
    .ad-slot{{text-align:center;margin:2em 0;min-height:100px}}
    nav.breadcrumb{{padding:16px;max-width:800px;margin:0 auto;font-size:14px;color:#6c757d}}
    nav.breadcrumb a{{color:#1976d2;text-decoration:none}}
  </style>
</head>
<body>
  <nav class="breadcrumb">
    <a href="/">Home</a> &gt;
    <a href="/blog/{cat}">{cat_name}</a> &gt;
    <span>{title}</span>
  </nav>
  <div id="seo-content">
    <div class="tags">{tags_html}</div>
    <h1>{title}</h1>
    <div class="meta">{date} &middot; {read_time} &middot; {author}</div>
    {f'<img src="{thumb_web}" alt="{title}" style="width:100%;border-radius:12px;margin-bottom:2em;">' if thumb_web else ''}
    <article>{content_html}</article>
    <div class="ad-slot">
      <ins class="adsbygoogle" style="display:block" data-ad-client="{ADSENSE_CLIENT}" data-ad-slot="auto" data-ad-format="auto" data-full-width-responsive="true"></ins>
      <script>(adsbygoogle=window.adsbygoogle||[]).push({{}});</script>
    </div>
    <footer style="margin-top:3em;padding:2em;background:#f8f9fa;border-radius:12px;">
      <p><strong>Ambro Tech Blog</strong></p>
      <p>AI, Java, Python 등 실무 개발 지식을 공유하는 기술 블로그입니다.</p>
      <p><a href="/">홈으로</a> | <a href="/blog/{cat}">더 많은 {cat_name} 글 보기</a></p>
    </footer>
  </div>
  <script src="/flutter_bootstrap.js" async></script>
  {FLUTTER_HIDE_SCRIPT}
</body>
</html>'''


def generate_category_html(cat_id, cat_name, posts):
    """카테고리 목록 페이지 HTML을 생성합니다."""
    canonical = f'{SITE_URL}/blog/{cat_id}'
    desc = f'{cat_name} 관련 기술 블로그 글 목록 - Ambro Tech Blog'

    items = ''
    for p in posts:
        t = p.get('thumbnailUrl', '')
        items += f'''<article style="margin-bottom:2em;padding:1em;border:1px solid #eee;border-radius:8px;">
      <h2><a href="/blog/{p["category"]}/{p["fileName"]}" style="color:#1976d2;text-decoration:none;">{p["title"]}</a></h2>
      <p style="color:#6c757d;font-size:14px;">{p.get("date","")} &middot; {p.get("readTime","5분")}</p>
      <p>{p["description"]}</p>
    </article>\n'''

    json_ld = json.dumps({
        "@context": "https://schema.org",
        "@type": "CollectionPage",
        "name": f'{cat_name} - Ambro Tech Blog',
        "description": desc,
        "url": canonical,
        "publisher": {"@type": "Organization", "name": "Ambro Tech", "url": SITE_URL},
    }, ensure_ascii=False, indent=2)

    return f'''<!DOCTYPE html>
<html lang="ko">
<head>
  <base href="/">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{cat_name} - Ambro Tech Blog</title>
  <meta name="description" content="{desc}">
  <meta name="naver-site-verification" content="3950b7e8fb9f37b138fdaee4034c393ed1c24bc8" />
  <meta property="og:type" content="website">
  <meta property="og:title" content="{cat_name} - Ambro Tech Blog">
  <meta property="og:description" content="{desc}">
  <meta property="og:url" content="{canonical}">
  <link rel="canonical" href="{canonical}">
  <link rel="sitemap" type="application/xml" href="/sitemap.xml">
  <link rel="alternate" type="application/rss+xml" title="Ambro Tech Blog RSS" href="/rss.xml">
  <script type="application/ld+json">
{json_ld}
  </script>
  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client={ADSENSE_CLIENT}" crossorigin="anonymous"></script>
  <style>
    body{{margin:0;padding:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,'Noto Sans KR',sans-serif}}
    #seo-content{{max-width:800px;margin:0 auto;padding:24px 16px}}
    #seo-content h1{{font-size:2em;color:#1a1a1a}}
    .ad-slot{{text-align:center;margin:2em 0;min-height:100px}}
  </style>
</head>
<body>
  <div id="seo-content">
    <nav style="margin-bottom:1em;font-size:14px;color:#6c757d;">
      <a href="/" style="color:#1976d2;">Home</a> &gt; <span>{cat_name}</span>
    </nav>
    <h1>{cat_name}</h1>
    <p>{desc}</p>
    {items}
    <div class="ad-slot">
      <ins class="adsbygoogle" style="display:block" data-ad-client="{ADSENSE_CLIENT}" data-ad-slot="auto" data-ad-format="auto" data-full-width-responsive="true"></ins>
      <script>(adsbygoogle=window.adsbygoogle||[]).push({{}});</script>
    </div>
  </div>
  <script src="/flutter_bootstrap.js" async></script>
  {FLUTTER_HIDE_SCRIPT}
</body>
</html>'''


def generate_homepage_html(all_posts):
    """SEO 콘텐츠가 포함된 홈페이지 HTML을 생성합니다."""
    cats_html = ''
    for cid, cname in CATEGORY_NAMES.items():
        cp = sorted([p for p in all_posts if p['category'] == cid],
                     key=lambda p: p.get('date', ''), reverse=True)[:3]
        if not cp:
            continue
        items = ''
        for p in cp:
            items += f'''<li>
            <a href="/blog/{p["category"]}/{p["fileName"]}">{p["title"]}</a>
            <span style="color:#6c757d;font-size:13px;"> &middot; {p.get("date","")}</span>
            <p style="font-size:14px;color:#555;">{p["description"]}</p>
          </li>\n'''
        cats_html += f'''<section>
        <h2><a href="/blog/{cid}" style="color:#1976d2;text-decoration:none;">{cname}</a></h2>
        <ul style="list-style:none;padding:0;">{items}</ul>
      </section>\n'''

    json_ld = json.dumps({
        "@context": "https://schema.org",
        "@type": "WebSite",
        "name": "Ambro Tech Blog",
        "url": SITE_URL,
        "description": "AI, Java, Python 등 실무 개발 지식을 공유하는 기술 블로그",
        "publisher": {"@type": "Organization", "name": "Ambro Tech", "url": SITE_URL},
    }, ensure_ascii=False, indent=2)

    return f'''<!DOCTYPE html>
<html lang="ko">
<head>
  <base href="/">
  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <title>Ambro Tech Blog - AI, Java, Python 기술 블로그</title>
  <meta name="description" content="AI 개발, Java, Python 등 실무 개발 지식과 최신 기술 트렌드를 공유하는 Ambro Tech Blog입니다.">
  <meta name="keywords" content="AI, Java, Python, Spring Boot, 바이브코딩, 기술블로그, 개발자">
  <meta name="naver-site-verification" content="3950b7e8fb9f37b138fdaee4034c393ed1c24bc8" />
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Ambro Tech Blog">
  <meta property="og:type" content="website">
  <meta property="og:title" content="Ambro Tech Blog - AI, Java, Python 기술 블로그">
  <meta property="og:description" content="AI 개발, Java, Python 등 실무 개발 지식과 최신 기술 트렌드를 공유합니다.">
  <meta property="og:url" content="{SITE_URL}">
  <meta property="og:site_name" content="Ambro Tech Blog">
  <link rel="canonical" href="{SITE_URL}/">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">
  <link rel="manifest" href="manifest.json">
  <link rel="sitemap" type="application/xml" href="sitemap.xml">
  <link rel="alternate" type="application/rss+xml" title="Ambro Tech Blog RSS" href="rss.xml">
  <script type="application/ld+json">
{json_ld}
  </script>
  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client={ADSENSE_CLIENT}" crossorigin="anonymous"></script>
  <style>
    body{{margin:0;padding:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,'Noto Sans KR',sans-serif}}
    #seo-content{{max-width:900px;margin:0 auto;padding:24px 16px;line-height:1.7}}
    #seo-content h1{{font-size:1.8em;color:#1a1a1a}}
    #seo-content h2{{font-size:1.4em;margin-top:2em;color:#212529}}
    #seo-content a{{color:#1976d2;text-decoration:none}}
    #seo-content li{{margin-bottom:1.5em;padding-bottom:1em;border-bottom:1px solid #f0f0f0}}
    .ad-slot{{text-align:center;margin:2em 0;min-height:100px}}
  </style>
</head>
<body>
  <div id="seo-content">
    <header>
      <h1>Ambro Tech Blog</h1>
      <p>AI 개발, Java, Python 등 실무 개발 지식과 최신 기술 트렌드를 공유하는 기술 블로그입니다.</p>
    </header>
    <main>{cats_html}</main>
    <div class="ad-slot">
      <ins class="adsbygoogle" style="display:block" data-ad-client="{ADSENSE_CLIENT}" data-ad-slot="auto" data-ad-format="auto" data-full-width-responsive="true"></ins>
      <script>(adsbygoogle=window.adsbygoogle||[]).push({{}});</script>
    </div>
    <footer style="margin-top:2em;padding-top:1em;border-top:1px solid #eee;font-size:13px;color:#6c757d;">
      <p>&copy; 2025 Ambro Tech. All rights reserved.</p>
      <p><a href="/privacy">개인정보처리방침</a> | <a href="/contact">문의하기</a></p>
    </footer>
  </div>
  <script src="flutter_bootstrap.js" async></script>
  {FLUTTER_HIDE_SCRIPT}
</body>
</html>'''


# ── 메인 실행 ──

def main():
    if not BUILD_DIR.exists():
        print(f'ERROR: {BUILD_DIR} not found. Run "flutter build web" first.')
        return

    print('=== SEO 프리렌더링 시작 ===')

    posts = parse_blog_data()
    print(f'[1/3] blog_data.dart 파싱 완료 - {len(posts)}개 포스트')

    # 블로그 포스트 HTML 생성
    ok = 0
    for post in posts:
        cat = post.get('category', '')
        fn = post.get('fileName', '')
        if not cat or not fn:
            continue
        mdx = ASSETS_DIR / 'content' / 'blog' / cat / fn
        if not mdx.exists():
            print(f'  SKIP: {mdx} 없음')
            continue
        md_content = mdx.read_text(encoding='utf-8')
        html = generate_post_html(post, md_content)
        out = BUILD_DIR / 'blog' / cat / fn
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(html, encoding='utf-8')
        ok += 1
    print(f'[2/3] 포스트 SEO 페이지 생성: {ok}개')

    # 카테고리 목록 HTML 생성
    for cid, cname in CATEGORY_NAMES.items():
        cp = sorted([p for p in posts if p['category'] == cid],
                     key=lambda p: p.get('date', ''), reverse=True)
        html = generate_category_html(cid, cname, cp)
        out = BUILD_DIR / 'blog' / f'{cid}.html'
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(html, encoding='utf-8')
    print(f'[3/3] 카테고리 SEO 페이지 생성: {len(CATEGORY_NAMES)}개')

    # 홈페이지 index.html 덮어쓰기
    hp = generate_homepage_html(posts)
    (BUILD_DIR / 'index.html').write_text(hp, encoding='utf-8')
    print('[OK] 홈페이지 index.html SEO 강화 완료')

    print(f'\n=== 완료: 포스트 {ok} + 카테고리 {len(CATEGORY_NAMES)} + 홈페이지 1 ===')


if __name__ == '__main__':
    main()
