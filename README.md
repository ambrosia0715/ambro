# Ambro Website

Ambro(엠브로) 공식 Flutter Web 홈페이지

## 기능

- **홈**: 브랜드 소개
- **앱**: AIcent, Play, Mate 카테고리별 앱 목록
  - Play: 눈치게임
- **개인정보처리방침**: 앱별 개인정보처리방침
- **문의**: 이메일 연락처

## 실행 방법

### 의존성 설치
```bash
flutter pub get
```

### 웹 개발 서버 실행
```bash
flutter run -d chrome
```

### 웹 빌드
```bash
flutter build web
```

빌드된 파일은 `build/web` 디렉토리에 생성됩니다.

## 구조

```
lib/
├── main.dart                    # 앱 진입점
├── router/
│   └── app_router.dart         # 라우팅 설정
├── pages/
│   ├── home_page.dart          # 홈 페이지
│   ├── apps_page.dart          # 앱 목록 페이지
│   ├── nunchi_game_page.dart   # 눈치게임 상세 페이지
│   ├── privacy_page.dart       # 개인정보처리방침 목록
│   ├── nunchi_privacy_page.dart # 눈치게임 개인정보처리방침
│   └── contact_page.dart       # 문의 페이지
└── widgets/
    └── main_layout.dart        # 공통 레이아웃 (네비게이션, 푸터)
```

## 디자인

- **메인 컬러**: #2196F3 (파란색)
- **배경**: 흰색 / 밝은 회색(#F5F5F5)
- **폰트**: Noto Sans KR
- **반응형 디자인** 지원

## 연락처

앱 관련 문의: ambro.studio@gmail.com
