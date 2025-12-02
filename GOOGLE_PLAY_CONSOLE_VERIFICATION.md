# Google Play Console에서 app-ads.txt 확인 방법

## 📋 Google Play Console에서 확인 가능한 항목

Google Play Console에서는 `app-ads.txt` 파일을 **직접 확인**하는 기능은 제공하지 않습니다. 대신, 다음 항목들을 확인할 수 있습니다:

### 1. 개발자 웹사이트 URL 확인

#### 확인 경로 (단계별 상세 안내):

**1단계: Google Play Console 접속**
- [Google Play Console](https://play.google.com/console) 로그인

**2단계: 확인할 앱 선택**
- 왼쪽 상단에서 확인할 앱 선택
  - **눈치게임** (Android)
  - **물주기 알림_lite** (Android)
  - **PILL PING lite** (Android)

**3단계: 메뉴 네비게이션**
- 왼쪽 사이드바 메뉴에서 다음 경로로 이동:
  
  📍 **현재 위치**: "앱 콘텐츠" (App content) 페이지
  
  ✅ **다음 단계**:
  1. 왼쪽 사이드바에서 **"앱 콘텐츠"** (App content) 메뉴를 찾습니다
     - 현재 "정책 및 프로그램" (Policies and programs) 하위에 있을 수 있습니다
  2. **"앱 콘텐츠"** 메뉴를 클릭하거나 확장하면 하위 메뉴가 나타납니다
  3. 하위 메뉴에서 **"스토어 설정"** (Store settings) 찾기
     - 또는 "스토어 정보" (Store listing) 직접 찾기
  4. **"스토어 정보"** (Store listing) 클릭
  
  💡 **참고**: 
  - "앱 콘텐츠" 섹션에는 정책 선언 페이지와 스토어 설정이 모두 포함될 수 있습니다
  - 왼쪽 사이드바에서 "스토어 설정" 또는 "스토어 정보" 메뉴를 찾아 클릭하세요
  - 만약 보이지 않으면 "앱 콘텐츠"를 확장(화살표 클릭)하여 하위 메뉴를 확인하세요

**4단계: 개발자 웹사이트 필드 확인**
- 스토어 정보 페이지가 열리면 스크롤 다운
- **개발자 웹사이트** (Developer website) 또는 **웹사이트** (Website) 필드 찾기
- 이 필드에 입력된 URL이 지원 URL입니다
- 현재 설정된 URL 확인:
  - ✅ 올바른 설정: `https://ambro.space`
  - ❌ 잘못된 설정: 빈 필드 또는 다른 URL

#### 확인 사항:
- ✅ **개발자 웹사이트**: `https://ambro.space`로 설정되어 있어야 함
- ✅ **저장 및 업데이트**: 변경사항이 저장되고 배포되었는지 확인

#### 각 앱별 확인:
- **눈치게임 (Android)**: 패키지 이름 `com.ambro.nunchigame`
- **물주기 알림_lite (Android)**: 패키지 이름 `com.ambrosia.plantwaterbuddy`
- **PILL PING lite (Android)**: 패키지 이름 `com.ambro.pillpinglite`

---

## 🌐 app-ads.txt 파일은 웹사이트에서 직접 확인

Google Play Console에서는 `app-ads.txt` 파일을 확인할 수 없습니다. **반드시 웹사이트에서 직접 확인**해야 합니다.

### 확인 방법:

#### 방법 1: 브라우저에서 직접 접속
1. 브라우저를 열고 다음 URL로 접속:
   ```
   https://ambro.space/app-ads.txt
   ```
2. 파일 내용이 표시되어야 함:
   ```
   google.com, pub-1444459980078427, DIRECT, f08c47fec0942fa0
   ```

#### 방법 2: 터미널에서 확인
```bash
curl https://ambro.space/app-ads.txt
```

#### 방법 3: Google의 공식 검증 도구
Google은 `app-ads.txt` 파일을 검증하는 공식 도구를 제공하지 않지만, 파일이 정상적으로 접근 가능하면 자동으로 크롤링됩니다.

---

## 🔍 Google Play Console에서 확인하는 전체 프로세스

### 단계별 가이드:

#### 1단계: 개발자 웹사이트 URL 설정 확인
1. Google Play Console 로그인
2. 확인할 앱 선택
3. **앱 콘텐츠** → **스토어 설정** → **스토어 정보**
4. **개발자 웹사이트** 필드 확인:
   - ✅ 올바른 URL: `https://ambro.space`
   - ❌ 잘못된 URL: `https://ambro.space/#/apps` (하위 경로 포함)
   - ❌ 잘못된 URL: 빈 필드

#### 2단계: 웹사이트에서 app-ads.txt 파일 확인
1. 별도의 브라우저 탭에서 `https://ambro.space/app-ads.txt` 접속
2. 파일 내용 확인:
   - ✅ 올바른 형식: `google.com, pub-1444459980078427, DIRECT, f08c47fec0942fa0`
   - ❌ 잘못된 형식: 다른 내용이나 오류 메시지 표시

#### 3단계: Google이 파일을 찾을 수 있는지 확인
- Google은 개발자 웹사이트 URL의 **도메인**을 추출하여 루트 경로에서 `app-ads.txt`를 찾습니다
- 예: 개발자 웹사이트가 `https://ambro.space`이면 → `https://ambro.space/app-ads.txt`에서 찾음
- ✅ **현재 설정이 올바름**: `https://ambro.space` → `https://ambro.space/app-ads.txt`

---

## ⚠️ 주의사항

### Google Play Console에서 할 수 없는 것:
- ❌ `app-ads.txt` 파일 내용 직접 확인
- ❌ `app-ads.txt` 파일 검증 상태 확인
- ❌ Google 크롤링 상태 확인

### Google Play Console에서 할 수 있는 것:
- ✅ 개발자 웹사이트 URL 설정 및 확인
- ✅ 앱의 스토어 정보 전체 확인
- ✅ 앱 정책 상태 확인

---

## 🎯 요약: 확인 체크리스트

### Google Play Console에서:
- [ ] 각 앱의 개발자 웹사이트가 `https://ambro.space`로 설정되어 있음
- [ ] 변경사항이 저장되고 업데이트가 배포됨

### 웹사이트에서:
- [ ] `https://ambro.space/app-ads.txt` 파일이 접근 가능함
- [ ] 파일 내용이 정확함: `google.com, pub-1444459980078427, DIRECT, f08c47fec0942fa0`

### AdMob에서:
- [ ] 앱 인증 상태 확인 (별도 가이드 참고: `ADMOB_SETUP_GUIDE.md`)

---

## 📞 참고 자료

- [Google Play Console](https://play.google.com/console)
- [AdMob 공식 문서 - app-ads.txt](https://support.google.com/admob/answer/7532444)
- [IAB app-ads.txt 스펙](https://iabtechlab.com/ads-txt/)

