# Ambro 홈페이지 프로젝트 설정 완료! 🎉

## ✅ 완료된 사항

1. **홈 페이지** - Ambro 브랜드 소개
2. **앱 페이지** - AIcent, Play, Mate 카테고리 표시
3. **눈치게임 상세 페이지** - 앱 소개 및 다운로드 링크
4. **개인정보처리방침** - 목록 및 눈치게임 상세 방침
5. **문의 페이지** - 이메일 연락처 및 복사 기능
6. **반응형 디자인** - 모바일/데스크톱 대응
7. **네비게이션 바** 및 푸터 포함

## 🎨 디자인 적용

- 메인 컬러: #2196F3 (파란색)
- 폰트: Noto Sans KR
- 카드 스타일: 둥근 모서리 + 그림자
- 버튼: 둥근 파란색 ElevatedButton

## 📱 다음 단계

### 1. 앱 로고 추가 (중요!)

`game_guessing_logo.png` 파일을 다음 위치에 복사하세요:
```
assets/images/game_guessing_logo.png
```

### 2. 앱 스토어 링크 업데이트

`lib/pages/nunchi_game_page.dart` 파일을 열고 실제 앱 스토어 링크로 수정하세요:
- Google Play: 현재 예시 링크 포함됨
- App Store: `[YOUR_APP_ID]` 부분을 실제 앱 ID로 변경

### 3. 프로젝트 실행

```bash
# 웹 개발 서버 실행
flutter run -d chrome

# 또는 웹 빌드
flutter build web
```

### 4. 배포

빌드된 파일은 `build/web` 디렉토리에 생성됩니다.
Firebase Hosting, Netlify, Vercel 등에 배포할 수 있습니다.

## 📂 프로젝트 구조

```
lib/
├── main.dart                    # 앱 진입점
├── router/
│   └── app_router.dart         # 라우팅 설정
├── pages/
│   ├── home_page.dart          # 홈
│   ├── apps_page.dart          # 앱 목록
│   ├── nunchi_game_page.dart   # 눈치게임 상세
│   ├── privacy_page.dart       # 개인정보처리방침 목록
│   ├── nunchi_privacy_page.dart # 눈치게임 개인정보처리방침
│   └── contact_page.dart       # 문의
└── widgets/
    └── main_layout.dart        # 공통 레이아웃
```

## 🔧 추가 기능 확장 방법

### 새로운 앱 추가하기

1. `lib/pages/apps_page.dart`의 해당 카테고리에 새 앱 카드 추가
2. 앱 상세 페이지 생성 (예: `new_app_page.dart`)
3. `lib/router/app_router.dart`에 라우트 추가
4. 필요시 개인정보처리방침 페이지 추가

### 로고 변경

- `lib/pages/home_page.dart`의 아이콘을 Image.asset으로 교체

## 💡 팁

- 반응형 확인: 브라우저 개발자 도구로 다양한 화면 크기 테스트
- 성능 최적화: `flutter build web --release` 사용
- SEO: `web/index.html`의 메타 태그 커스터마이즈

## 📧 문의

ambro.studio@gmail.com
