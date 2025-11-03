# 🎯 Ambro 홈페이지 체크리스트

## 📋 배포 전 체크리스트

### 🔴 필수 (배포 전 반드시 완료)

- [ ] **앱 로고 추가**
  - [ ] `game_guessing_logo.png` 파일을 `assets/images/` 폴더에 복사
  - [ ] 파일 크기 확인 (권장: 512x512px, < 500KB)

- [ ] **앱 스토어 링크 업데이트**
  - [ ] Google Play 링크 확인 (`lib/pages/nunchi_game_page.dart` 71번째 줄)
  - [ ] App Store 링크의 `[YOUR_APP_ID]` 교체 (75번째 줄)

- [ ] **테스트**
  - [ ] Chrome에서 개발 서버 실행 (`flutter run -d chrome`)
  - [ ] 모든 페이지 네비게이션 테스트
  - [ ] 이메일 복사 기능 테스트
  - [ ] 앱 스토어 링크 클릭 테스트
  - [ ] 모바일 반응형 테스트 (F12 → 디바이스 모드)

- [ ] **빌드**
  - [ ] Release 빌드 실행 (`flutter build web --release`)
  - [ ] 빌드 에러 없음 확인

### 🟡 권장 (더 나은 결과를 위해)

- [ ] **SEO 최적화**
  - [ ] `web/index.html` 메타 태그 커스터마이즈
  - [ ] description, keywords 추가
  - [ ] Open Graph 태그 추가

- [ ] **성능 최적화**
  - [ ] 이미지 WebP 포맷으로 변환
  - [ ] 이미지 압축 (TinyPNG 등 사용)

- [ ] **브랜딩**
  - [ ] Favicon 추가 (`web/favicon.png`)
  - [ ] 홈 페이지 로고를 실제 Ambro 로고로 교체

- [ ] **분석 도구**
  - [ ] Google Analytics 추가 (선택)
  - [ ] Search Console 등록 (선택)

### 🟢 선택 (추가 기능)

- [ ] **추가 앱**
  - [ ] AIcent 카테고리에 앱 추가
  - [ ] Mate 카테고리에 앱 추가

- [ ] **다국어 지원**
  - [ ] 영어 버전 추가
  - [ ] 언어 선택 버튼 추가

- [ ] **다크 모드**
  - [ ] 다크 테마 구현
  - [ ] 테마 전환 버튼 추가

## 🚀 배포 절차

### 방법 1: Firebase Hosting (권장)
```bash
# 1. Firebase CLI 설치
npm install -g firebase-tools

# 2. 로그인
firebase login

# 3. 프로젝트 초기화
firebase init hosting

# 4. 빌드
flutter build web --release

# 5. 배포
firebase deploy
```

### 방법 2: Netlify (가장 쉬움)
1. [Netlify](https://netlify.com) 로그인
2. "Add new site" → "Deploy manually"
3. `build/web` 폴더를 드래그 앤 드롭
4. 완료!

### 방법 3: Vercel
```bash
# 1. Vercel CLI 설치
npm i -g vercel

# 2. 배포
vercel --prod
```

### 방법 4: GitHub Pages
```bash
# 1. gh-pages 브랜치 생성
git checkout -b gh-pages

# 2. build/web 내용 복사
cp -r build/web/* .

# 3. 커밋 & 푸시
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages
```

## ✅ 배포 후 확인사항

- [ ] 모든 페이지가 정상적으로 로드됨
- [ ] 이미지가 올바르게 표시됨
- [ ] 링크가 작동함
- [ ] 모바일에서 정상 작동
- [ ] HTTPS 적용 확인

## 🐛 문제 해결

### 이미지가 안 보여요
```bash
# assets 폴더 확인
ls -la assets/images/

# pubspec.yaml에 assets 경로가 있는지 확인
# flutter clean 후 다시 빌드
flutter clean
flutter pub get
flutter build web --release
```

### 라우팅이 안 돼요 (새로고침 시 404)
- Firebase: `firebase.json`에 rewrite 규칙 추가
- Netlify: `_redirects` 파일 추가: `/* /index.html 200`
- Vercel: `vercel.json`에 rewrites 추가

### 빌드가 느려요
```bash
# 캐시 삭제
flutter clean

# 다시 빌드
flutter build web --release --web-renderer canvaskit
```

## 📞 도움이 필요하면
- Flutter 공식 문서: https://flutter.dev/docs
- Stack Overflow: https://stackoverflow.com/questions/tagged/flutter
- Discord: Flutter Community
- 이메일: ambro.studio@gmail.com

---

**화이팅! 🎉**
