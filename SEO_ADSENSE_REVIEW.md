# SEO·AdSense 설정 검토 요약

기존 Flutter(ambro_bak) 시절 설정을 기준으로, 현재 Nuxt 프로젝트에서 동일·유사하게 적용된 항목과 이번에 보완한 항목을 정리했습니다.

---

## 1. 적용된 항목 (nuxt.config + 페이지)

| 항목 | 상태 | 비고 |
|------|------|------|
| **사이트 제목·설명** | ✅ | `app.head.title`, `meta description` |
| **키워드** | ✅ | `meta keywords` |
| **언어** | ✅ | `htmlAttrs.lang="ko"` |
| **뷰포트** | ✅ | viewport meta (모바일 대응) |
| **네이버 사이트 소유 확인** | ✅ | `naver-site-verification` |
| **Apple PWA 메타** | ✅ | apple-mobile-web-app-* |
| **OG 기본값** | ✅ | og:type, og:title, og:description, og:site_name |
| **Canonical (기본)** | ✅ | `https://ambro.space/` (루트) |
| **페이지별 canonical·ogUrl** | ✅ | 레이아웃에서 `useRoute()` 기반으로 자동 설정, 블로그 상세는 페이지에서 override |
| **블로그 상세 SEO** | ✅ | 제목, 설명, og:image, og:url, twitter card, canonical |
| **AdSense** | ✅ | `ca-pub-1444459980078427` 스크립트 로드 |
| **siteUrl** | ✅ | `runtimeConfig.public.siteUrl` (https://ambro.space) |
| **sitemap·RSS 링크** | ✅ | head에 `/sitemap.xml`, `/rss.xml` 링크 |

---

## 2. 이번에 보완한 항목

- **페이지별 canonical·ogUrl**  
  - `src/layouts/default.vue`에서 `useRoute()`로 현재 path 계산 후 `useHead({ link: [{ rel: 'canonical', href }] })`, `useSeoMeta({ ogUrl })` 설정.  
  - 블로그 상세는 기존처럼 페이지에서 canonical·ogUrl 지정(썸네일·article 등).

- **robots.txt**  
  - `public/robots.txt` 추가: `User-agent: *`, `Allow: /`, `Sitemap: https://ambro.space/sitemap.xml`.

- **sitemap.xml**  
  - `server/routes/sitemap.xml.ts` 추가:  
    - 블로그 포스트 목록은 `src/data/blogData.ts`의 `posts` 사용.  
    - 고정 경로(/, /blog/java, /about, /utils, 앱 페이지 등) 포함.  
  - 배포 후 `https://ambro.space/sitemap.xml` 로 접근 가능.

- **rss.xml**  
  - `server/routes/rss.xml.ts` 추가:  
    - `posts` 기준 최신 50개 포스트로 RSS 2.0 생성.  
  - 배포 후 `https://ambro.space/rss.xml` 로 접근 가능.

---

## 3. 선택·확인 권장 사항

| 항목 | 설명 |
|------|------|
| **Google Search Console** | Flutter 때 사용한 `google-site-verification` 메타가 있다면, 동일한 값으로 `nuxt.config`의 `app.head.meta`에 추가하면 됩니다. |
| **Google Analytics (GA4)** | Flutter에 GA/gtag가 있었다면, Nuxt에서는 `useScriptGoogleAnalytics` 또는 `app.head.script`에 gtag 스크립트를 넣어 동일 측정 ID를 사용할 수 있습니다. |
| **기본 og:image** | 공유 시 사용할 기본 이미지가 있으면 `app.head.meta`에 `og:image` 한 개 추가(예: `https://ambro.space/assets/og-default.png`). 블로그 상세는 계속 각 포스트 썸네일을 사용합니다. |

---

## 4. 파일 위치 정리

- 전역 메타·스크립트: `nuxt.config.ts` → `app.head`
- 페이지별 SEO: 각 페이지의 `useSeoMeta`, 블로그 상세의 `useHead`/`useSeoMeta`
- canonical·ogUrl 기본값: `src/layouts/default.vue`
- AdSense: `nuxt.config.ts` → `app.head.script`
- robots: `public/robots.txt`
- sitemap·RSS: `server/routes/sitemap.xml.ts`, `server/routes/rss.xml.ts`

이 구성을 유지하면 Flutter 시절의 SEO·AdSense 설정이 Nuxt에서도 동일하게 동작합니다.
