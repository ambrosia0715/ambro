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
            # Single quotes or double quotes
            m = re.search(rf"{field}:\s*(?:'([^']*)'|\"([^\"]*)\")", block)
            if m:
                # Group 1 is single quoted, Group 2 is double quoted
                val = m.group(1) if m.group(1) is not None else m.group(2)
                post[field] = val

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


# ── 정적 페이지 생성 ──

def _static_page(title, desc, canonical_path, body_html):
    """정적 페이지(about, privacy, contact 등)의 HTML을 생성합니다."""
    canonical = f'{SITE_URL}{canonical_path}'
    return f'''<!DOCTYPE html>
<html lang="ko">
<head>
  <base href="/">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{title} - Ambro Tech Blog</title>
  <meta name="description" content="{desc}">
  <meta name="naver-site-verification" content="3950b7e8fb9f37b138fdaee4034c393ed1c24bc8" />
  <meta property="og:type" content="website">
  <meta property="og:title" content="{title} - Ambro Tech Blog">
  <meta property="og:description" content="{desc}">
  <meta property="og:url" content="{canonical}">
  <meta property="og:site_name" content="Ambro Tech Blog">
  <link rel="canonical" href="{canonical}">
  <link rel="sitemap" type="application/xml" href="/sitemap.xml">
  <link rel="alternate" type="application/rss+xml" title="Ambro Tech Blog RSS" href="/rss.xml">
  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client={ADSENSE_CLIENT}" crossorigin="anonymous"></script>
  <style>
    body{{margin:0;padding:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,'Noto Sans KR',sans-serif}}
    #seo-content{{max-width:800px;margin:0 auto;padding:24px 16px;color:#333;line-height:1.8}}
    #seo-content h1{{font-size:2em;margin-bottom:.5em;color:#1a1a1a}}
    #seo-content h2{{font-size:1.4em;margin-top:1.5em;color:#212529}}
    #seo-content p{{margin:.8em 0;font-size:16px}}
    #seo-content ul{{padding-left:1.5em}}
    #seo-content li{{margin:.3em 0}}
    #seo-content a{{color:#1976d2;text-decoration:none}}
  </style>
</head>
<body>
  <div id="seo-content">
    {body_html}
  </div>
  <script src="/flutter_bootstrap.js" async></script>
  {FLUTTER_HIDE_SCRIPT}
</body>
</html>'''


def generate_static_pages():
    """about, privacy, contact, about/apps 페이지의 프리렌더링 HTML을 생성합니다."""
    pages = []

    # ── /about ──
    pages.append(('about.html', _static_page(
        '소개 (About)',
        '15년 차 시니어 개발자 Ambro의 기술 블로그. Java/Spring 전문, AI 도구 활용.',
        '/about',
        '''<h1>견고한 웹 생태계를 만드는 개발자 Ambro입니다</h1>
    <p>강민석 &middot; 15년 차 시니어 개발자 (Java/Spring 전문)</p>
    <p>레거시의 견고함과 최신 AI 도구(Cursor, LLM)의 효율성을 결합하여 가치를 창출하는 1인 개발자 및 기업가입니다.</p>

    <h2>Tech Stack &amp; Expertise</h2>
    <h3>Backend</h3>
    <p>Java(Spring Boot) 기반 백엔드 및 API 설계 전문성</p>
    <ul><li>Java</li><li>Spring Boot</li><li>REST API</li><li>비즈니스 로직 설계</li></ul>
    <h3>AI &amp; Productivity</h3>
    <p>차세대 개발 워크플로우 숙련도</p>
    <ul><li>Cursor</li><li>Replit</li><li>Ollama</li><li>LLM 활용</li></ul>

    <h2>Why Ambro Blog?</h2>
    <p><strong>기초가 튼튼해야 무너지지 않는다</strong></p>
    <p>이 블로그는 Java/Python의 핵심 문법과 최신 AI 정보를 공유합니다. 개발자들이 실무에서 겪는 병목 현상을 해결해주는 가이드북 같은 블로그를 지향하며, 최신 IT 정보를 통해 함께 성장하는 공간이 되고자 합니다.</p>

    <h2>My Projects</h2>
    <ul>
      <li><a href="/apps/aicent/ongi">온기</a> - AI가 전해주는 위로의 일기 앱</li>
      <li><a href="/apps/play/nunchi-game">눈치게임</a> - 친구들과 함께하는 숫자 맞추기 게임</li>
      <li><a href="/apps/mate/water-buddy">물주기 알림_lite</a> - 식물 돌봄을 돕는 알림 앱</li>
      <li><a href="/apps/mate/pill-ping">PILL PING lite</a> - 약 복용 시간 알림 앱</li>
    </ul>
    <p><a href="/about/apps">전체 앱 보기</a></p>'''
    )))

    # ── /about/apps ──
    pages.append(('about/apps.html', _static_page(
        'Apps',
        'Ambro에서 제공하는 앱들을 만나보세요. AI 일기 앱 온기, 눈치게임, 물주기 알림, PILL PING 등.',
        '/about/apps',
        '''<h1>Apps</h1>
    <p>Ambro에서 제공하는 앱들을 만나보세요.</p>

    <h2>AIcent - AI를 사용하는 앱 모음</h2>
    <ul><li><a href="/apps/aicent/ongi"><strong>온기</strong></a> - 따뜻한 일기 앱. AI가 전해주는 위로의 한마디</li></ul>

    <h2>Play - 단순 게임형 앱 모음</h2>
    <ul><li><a href="/apps/play/nunchi-game"><strong>눈치게임</strong></a> - 친구들과 함께 즐기는 숫자 맞추기 게임</li></ul>

    <h2>Mate - 생활 보조 앱 모음</h2>
    <ul>
      <li><a href="/apps/mate/water-buddy"><strong>물주기 알림_lite</strong></a> - 식물마다 주기를 설정하면 날짜에 맞춰 알려드려요</li>
      <li><a href="/apps/mate/pill-ping"><strong>PILL PING lite</strong></a> - 약 복용 시간을 놓치지 않도록 도와주는 알림 앱</li>
    </ul>'''
    )))

    # ── /privacy ──
    pages.append(('privacy.html', _static_page(
        '개인정보처리방침',
        'Ambro 개인정보처리방침. 개인정보의 수집, 이용, 보유, 파기 등에 관한 사항을 안내합니다.',
        '/privacy',
        '''<h1>개인정보처리방침</h1>
    <p><em>최종 업데이트: 2025년 11월 3일</em></p>
    <p>Ambro(이하 "회사")는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등 관련 법령에 따라 이용자의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 다음과 같이 개인정보처리방침을 수립·공개합니다.</p>

    <h2>제1조 (개인정보의 수집 및 이용 목적)</h2>
    <p>회사는 다음의 목적을 위하여 개인정보를 처리합니다.</p>
    <ul><li>회원 가입 및 관리</li><li>서비스 제공 및 개선</li><li>고객 문의 및 불만 처리</li></ul>

    <h2>제2조 (수집하는 개인정보의 항목)</h2>
    <p>회사는 서비스 제공을 위해 필요한 최소한의 개인정보를 수집합니다.</p>
    <ul><li>필수항목: 닉네임, 기기 식별 정보</li><li>선택항목: 위치 정보(서비스 이용 시)</li><li>자동 수집 항목: 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보</li></ul>

    <h2>제3조 (개인정보의 보유 및 이용기간)</h2>
    <p>회사는 법령에 따른 개인정보 보유·이용기간 또는 이용자로부터 개인정보를 수집 시 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.</p>
    <ul><li>회원 탈퇴 시까지 (단, 관계 법령 위반에 따른 수사·조사 등이 진행 중인 경우에는 해당 수사·조사 종료 시까지)</li></ul>

    <h2>제4조 (개인정보의 제3자 제공)</h2>
    <p>회사는 이용자의 개인정보를 제1조에서 명시한 범위 내에서만 처리하며, 이용자의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>

    <h2>제5조 (이용자의 권리·의무 및 행사방법)</h2>
    <p>이용자는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.</p>
    <ul><li>개인정보 열람 요구</li><li>오류 등이 있을 경우 정정 요구</li><li>삭제 요구</li><li>처리정지 요구</li></ul>

    <h2>제6조 (개인정보의 파기)</h2>
    <p>회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</p>

    <h2>제7조 (개인정보 보호책임자)</h2>
    <p>이메일: ambrosia0715.ambro@gmail.com</p>

    <h2>제8조 (개인정보 처리방침 변경)</h2>
    <p>이 개인정보처리방침은 2025년 11월 3일부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>'''
    )))

    # ── /contact ──
    pages.append(('contact.html', _static_page(
        '문의하기',
        'Ambro 앱 관련 문의 안내. 이메일: ambrosia0715.ambro@gmail.com',
        '/contact',
        '''<h1>문의하기</h1>
    <p>앱 관련 문의는 이메일로 연락해주세요.</p>
    <p><strong>이메일:</strong> ambrosia0715.ambro@gmail.com</p>'''
    )))

    count = 0
    for filename, html in pages:
        out = BUILD_DIR / filename
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(html, encoding='utf-8')
        count += 1

    return count


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
    print(f'[2/4] 포스트 SEO 페이지 생성: {ok}개')

    # 카테고리 목록 HTML 생성
    for cid, cname in CATEGORY_NAMES.items():
        cp = sorted([p for p in posts if p['category'] == cid],
                     key=lambda p: p.get('date', ''), reverse=True)
        html = generate_category_html(cid, cname, cp)
        out = BUILD_DIR / 'blog' / f'{cid}.html'
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(html, encoding='utf-8')
    print(f'[3/4] 카테고리 SEO 페이지 생성: {len(CATEGORY_NAMES)}개')

    # 정적 페이지(about, privacy, contact 등) 생성
    static_count = generate_static_pages()
    print(f'[4/4] 정적 페이지 SEO 생성: {static_count}개 (about, apps, privacy, contact)')

    # 홈페이지 index.html 덮어쓰기
    hp = generate_homepage_html(posts)
    (BUILD_DIR / 'index.html').write_text(hp, encoding='utf-8')
    print('[OK] 홈페이지 index.html SEO 강화 완료')

    print(f'\n=== 완료: 포스트 {ok} + 카테고리 {len(CATEGORY_NAMES)} + 정적 {static_count} + 홈페이지 1 ===')


if __name__ == '__main__':
    main()
