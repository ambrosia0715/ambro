# Ambro Tech Blog

Ambro(엠브로) 기술 블로그 · Nuxt 3 기반 웹사이트

- **홈**: AI Dev, AI Insight, Java, Python 카테고리별 최신 글
- **블로그**: AI 개발, AI 인사이트, Java, Python 기술 글 목록 및 상세
- **About**: 소개, Tech Stack, 운영 철학, 프로젝트(앱) 링크
- **유틸**: Camel Case 변환, JSON 포맷터, 정규식 테스트, SQL 포맷터
- **앱 소개**: 온기, 눈치게임, 물주기 알림, PILL PING 등
- **개인정보처리방침 / 문의하기**

---

## 실행 방법

### 의존성 설치

```bash
npm install
```

### 개발 서버 실행

```bash
npm run dev
```

브라우저에서 http://localhost:3000 으로 접속합니다.

### 프로덕션 빌드

```bash
npm run build
```

빌드 결과는 `.output` 디렉터리에 생성됩니다. 로컬 프리뷰는 `npm run preview` 로 확인할 수 있습니다.

---

## 구조

```
├── src/
│   ├── app.vue                 # 앱 루트
│   ├── layouts/
│   │   └── default.vue         # 공통 레이아웃 (헤더, 네비게이션, 푸터)
│   ├── pages/                  # 파일 기반 라우팅
│   │   ├── index.vue           # 홈
│   │   ├── about.vue           # 소개
│   │   ├── about/apps.vue      # 앱 목록
│   │   ├── blog/
│   │   │   ├── [category].vue       # 카테고리별 글 목록
│   │   │   └── [category]-[slug].vue # 글 상세
│   │   ├── contact.vue         # 문의
│   │   ├── privacy.vue         # 개인정보처리방침
│   │   ├── utils/              # 유틸 페이지
│   │   └── apps/               # 앱 소개 페이지
│   └── data/
│       └── blogData.ts         # 블로그 포스트 메타데이터
├── content/
│   └── blog/                   # MDX 블로그 본문 (카테고리별)
├── public/                     # 정적 파일 (이미지, robots.txt 등)
├── server/
│   └── routes/                 # sitemap.xml, rss.xml API
├── nuxt.config.ts              # Nuxt 설정 (SEO, AdSense, siteUrl 등)
└── content.config.ts           # Content 컬렉션 설정
```

---

## 기술 스택

- **Nuxt 3** (Vue 3)
- **@nuxt/content** (MDX 블로그 콘텐츠)
- **TypeScript**

---

## 디자인

- **메인 컬러**: 네비게이션·강조 `#6200ee`, 링크·태그 `#1976d2`, About 섹션 `#007bff`
- **배경**: 흰색 / 밝은 회색(`#f5f5f5`, `#f8f9fa`)
- **폰트**: 시스템 UI / Noto Sans KR 계열
- **반응형 디자인** 지원

---

## 배포

Vercel 등에서 루트 디렉터리를 프로젝트 루트로 두고, 빌드 커맨드 `npm run build`, 출력 디렉터리는 프레임워크 기본값(Nuxt)을 사용하면 됩니다.

---

## 연락처

앱·블로그 관련 문의: ambrosia0715.ambro@gmail.com
