# AdMob 앱 인증 및 한도 해제 가이드

## 📋 AdMob 앱 인증을 위한 체크리스트

### 1. 개발자 웹사이트 설정

#### Google Play Console
1. [Google Play Console](https://play.google.com/console) 로그인
2. 인증이 필요한 앱 선택 (예: 눈치게임)
3. **앱 콘텐츠** → **스토어 설정** → **스토어 정보** 이동
4. **개발자 웹사이트** 필드에 다음 URL 입력:
   ```
   https://ambro.space
   ```
5. 변경사항 저장 및 업데이트 배포

#### App Store Connect
1. [App Store Connect](https://appstoreconnect.apple.com) 로그인
2. 인증이 필요한 앱 선택 (예: 눈치게임)
3. **앱 정보** → **일반 정보** 이동
4. **지원 URL** 필드에 다음 URL 입력:
   ```
   https://ambro.space
   ```
5. 변경사항 저장

### 2. app-ads.txt 파일 확인

#### 2-1. AdMob Publisher ID 확인 (중요!)

**"세부정보가 일치하지 않는다" 오류가 발생하는 경우:**

1. **AdMob 계정에서 실제 Publisher ID 확인:**
   - [AdMob 대시보드](https://apps.admob.com) 로그인
   - **설정** (⚙️ 아이콘) → **계정 정보** 클릭
   - **Publisher ID** 확인 (형식: `pub-XXXXXXXXXXXXXXX`)
   - 또는 **앱** → 앱 선택 → **앱 설정** → **앱 정보**에서 확인

2. **Publisher ID가 다른 경우:**
   - `app-ads.txt` 파일의 Publisher ID를 실제 계정의 ID로 변경
   - 파일 형식: `google.com, pub-[실제ID], DIRECT, f08c47fec0942fa0`

#### 2-2. app-ads.txt 파일 형식 확인

✅ **올바른 파일 형식:**
```
google.com, pub-1444459980078427, DIRECT, f08c47fec0942fa0
```

⚠️ **주의사항:**
- 각 필드는 **쉼표와 공백(`, `)으로 구분**
- 줄 끝에 **불필요한 공백 없음**
- 파일 끝에 **빈 줄 없음** (또는 하나만)
- **UTF-8 인코딩** 사용
- **대소문자 정확히 일치**

✅ **현재 상태:**
- 파일 위치: `https://ambro.space/app-ads.txt`
- 파일 내용:
  ```
  google.com, pub-1444459980078427, DIRECT, f08c47fec0942fa0
  ```
- 파일이 정상적으로 접근 가능한지 확인:
  - 브라우저에서 `https://ambro.space/app-ads.txt` 접속
  - 파일 내용이 표시되어야 함

### 3. AdMob 대시보드에서 확인

1. [AdMob 대시보드](https://admob.google.com) 로그인
2. **앱** 섹션으로 이동
3. 인증 대기 중인 앱 선택 (예: 눈치게임(Android), 눈치게임(iOS))
4. **인증 문제** 섹션 확인
5. **업데이트 확인** 버튼 클릭하여 최신 상태 확인

### 4. 한도 해제 프로세스

**일반적인 시간:**
- `app-ads.txt` 파일 배포 후: 즉시
- Google 크롤링 대기: 12-48시간
- AdMob 인증 완료: 크롤링 완료 후 자동

**확인 방법:**
- AdMob 대시보드에서 앱 인증 상태가 "인증됨"으로 변경됨
- 광고 한도가 자동으로 해제됨
- "인증 문제" 섹션이 사라짐

### 5. 문제 해결

#### app-ads.txt 파일을 찾을 수 없음 (404 오류)
- ✅ 해결됨: Vercel 설정 및 파일 배포 완료
- 브라우저에서 직접 접속하여 확인: `https://ambro.space/app-ads.txt`

#### 인증이 계속 안 됨
1. 개발자 웹사이트가 올바르게 설정되었는지 확인
2. `app-ads.txt` 파일 내용이 정확한지 확인
3. 최소 48시간 대기
4. AdMob 대시보드에서 "업데이트 확인" 버튼 클릭

#### 여러 앱이 있는 경우
- 모든 앱이 같은 도메인(`ambro.space`)을 사용하므로 한 번 설정하면 모든 앱에 적용됨
- 각 앱의 스토어 정보에서 개발자 웹사이트를 `ambro.space`로 설정

## 🎯 현재 앱 목록

### AIcent 카테고리
- **온기** (iOS: https://apps.apple.com/us/app/%EC%98%A8%EA%B8%B0-%EB%94%B0%EB%9C%BB%ED%95%9C-%EC%9D%BC%EA%B8%B0/id6755369005)

### Play 카테고리
- **눈치게임**
  - Android: https://play.google.com/store/apps/details?id=com.ambro.nunchigame
  - iOS: https://apps.apple.com/us/app/%EB%88%88%EC%B9%98%EA%B2%8C%EC%9E%84/id6755019137

### Mate 카테고리
- **물주기 알림_lite**
  - Android: https://play.google.com/store/apps/details?id=com.ambrosia.plantwaterbuddy
  - iOS: https://apps.apple.com/us/app/%EB%AC%BC%EC%A3%BC%EA%B8%B0-%EC%95%8C%EB%A6%BC-lite/id6755084030
- **PILL PING lite**
  - Android: https://play.google.com/store/apps/details?id=com.ambro.pillpinglite
  - iOS: https://apps.apple.com/us/app/pill-ping-lite/id6755383377

## ✅ 체크리스트

- [ ] Google Play Console에서 모든 Android 앱의 개발자 웹사이트를 `https://ambro.space`로 설정
- [ ] App Store Connect에서 모든 iOS 앱의 지원 URL을 `https://ambro.space`로 설정
- [ ] `https://ambro.space/app-ads.txt` 파일이 브라우저에서 정상적으로 접근 가능한지 확인
- [ ] AdMob 대시보드에서 각 앱의 인증 상태 확인
- [ ] 48시간 후 재확인

## 📱 AdMob에서 스토어 추가하기 (한도 해제)

### "스토어를 추가하여 한도 해제" 메시지가 보이는 경우

AdMob에서 앱의 스토어 정보를 연결해야 광고 한도가 해제됩니다.

### 단계별 가이드

#### 1. AdMob 대시보드에서 앱 선택
1. [AdMob 대시보드](https://admob.google.com) 로그인
2. **앱** 섹션으로 이동
3. "스토어를 추가하여 한도 해제" 메시지가 있는 앱 선택

#### 2. 스토어 정보 추가

**방법 A: App Store에서 앱 검색하여 추가 (iOS 앱)**

1. 앱 설정 페이지에서 **"스토어 추가"** 또는 **"스토어 연결"** 버튼 클릭
2. **"App Store에서 앱을 선택하세요"** 화면이 나타남
3. 검색창에 **앱의 스토어 ID** 또는 **앱 URL** 입력:
   
   **물주기 알림_lite (iOS):**
   - 스토어 ID: `6755084030`
   - 또는 앱 URL: `https://apps.apple.com/us/app/%EB%AC%BC%EC%A3%BC%EA%B8%B0-%EC%95%8C%EB%A6%BC-lite/id6755084030`
   
   **눈치게임 (iOS):**
   - 스토어 ID: `6755019137`
   - 또는 앱 URL: `https://apps.apple.com/us/app/%EB%88%88%EC%B9%98%EA%B2%8C%EC%9E%84/id6755019137`
   
   **온기 (iOS):**
   - 스토어 ID: `6755369005`
   - 또는 앱 URL: `https://apps.apple.com/us/app/%EC%98%A8%EA%B8%B0-%EB%94%B0%EB%9C%BB%ED%95%9C-%EC%9D%BC%EA%B8%B0/id6755369005`
   
   **PILL PING lite (iOS):**
   - 스토어 ID: `6755383377`
   - 또는 앱 URL: `https://apps.apple.com/us/app/pill-ping-lite/id6755383377`

4. **"검색"** 버튼 클릭
5. 검색 결과에서 해당 앱 선택
6. **"저장"** 버튼 클릭

**방법 B: Google Play Store에서 앱 추가 (Android 앱)**

1. 앱 설정 페이지에서 **"스토어 추가"** 또는 **"스토어 연결"** 버튼 클릭
2. **"Google Play에서 앱을 선택하세요"** 화면이 나타남
3. 검색창에 **패키지 이름** 또는 **앱 URL** 입력:
   
   **물주기 알림_lite (Android):**
   - 패키지 이름: `com.ambrosia.plantwaterbuddy`
   - 또는 앱 URL: `https://play.google.com/store/apps/details?id=com.ambrosia.plantwaterbuddy`
   
   **눈치게임 (Android):**
   - 패키지 이름: `com.ambro.nunchigame`
   - 또는 앱 URL: `https://play.google.com/store/apps/details?id=com.ambro.nunchigame&pcampaignid=web_share`
   
   **PILL PING lite (Android):**
   - 패키지 이름: `com.ambro.pillpinglite`
   - 또는 앱 URL: `https://play.google.com/store/apps/details?id=com.ambro.pillpinglite`

4. **"검색"** 버튼 클릭
5. 검색 결과에서 해당 앱 선택
6. **"저장"** 버튼 클릭

### 저장 버튼이 활성화되지 않는 경우

1. **앱이 이미 추가된 경우**
   - 화면에 "추가됨" 상태로 표시되면 이미 연결되어 있음
   - **해결**: "취소" 버튼 클릭 후, 앱 설정 페이지에서 다른 방법으로 스토어 정보 확인

2. **앱을 선택하지 않은 경우**
   - 검색 결과에서 앱을 클릭하여 선택해야 함
   - **해결**: 검색 결과 목록에서 해당 앱을 클릭하여 선택

3. **페이지 새로고침**
   - 브라우저 캐시 문제일 수 있음
   - **해결**: F5 또는 Cmd+R으로 새로고침

4. **다른 필수 정보 입력 필요**
   - 앱 이름, 플랫폼 등 추가 정보가 필요할 수 있음
   - **해결**: 모든 필수 필드 확인

### ⚠️ iOS 앱이 이미 "추가됨" 상태인데 한도가 해제되지 않는 경우

**증상:**
- App Store에서 앱을 검색하면 "추가됨" 상태로 표시됨
- 저장 버튼이 비활성화되어 있음
- 하지만 여전히 "스토어를 추가하여 한도 해제" 메시지가 나타남

**원인:**
1. 스토어는 추가되었지만, 앱 인증이 완료되지 않음
2. `app-ads.txt` 파일 인증이 완료되지 않음
3. App Store Connect에서 개발자 웹사이트 설정이 안 되어 있음

**해결 방법:**

#### 1단계: "취소" 버튼 클릭
- 현재 화면에서 "취소" 버튼을 클릭하여 앱 설정 페이지로 돌아가기

#### 2단계: App Store Connect에서 개발자 웹사이트 설정

**현재 상황:**
- 지원 URL: `https://ambro.space/#/apps/mate/water-buddy`
- 이 URL도 `ambro.space` 도메인을 포함하므로, Google은 자동으로 루트 도메인에서 `app-ads.txt` 파일을 찾습니다
- 즉, `https://ambro.space/app-ads.txt` 파일을 찾을 수 있어야 합니다

**지원 URL을 변경할 수 없는 경우:**

1. **필드가 비활성화되어 있는 경우**
   - 앱이 이미 출시되어 일부 필드는 수정이 제한될 수 있음
   - **중요**: 현재 지원 URL(`https://ambro.space/#/apps/mate/water-buddy`)도 `ambro.space` 도메인을 포함하므로 문제 없음
   - Google은 지원 URL의 도메인(`ambro.space`)을 추출하여 `https://ambro.space/app-ads.txt`를 자동으로 찾습니다

2. **지원 URL을 변경하고 싶은 경우**
   - 새로운 앱 버전을 생성하여 제출해야 함
   - **앱 정보** → **버전 또는 플랫폼 추가** 클릭
   - 새 버전의 **앱 정보**에서 지원 URL을 `https://ambro.space`로 변경
   - 새로운 버전을 심사에 제출

**중요 참고사항:**
- ✅ 현재 지원 URL(`https://ambro.space/#/apps/mate/water-buddy`)도 정상 작동합니다
- ✅ Google은 `ambro.space` 도메인을 인식하여 `https://ambro.space/app-ads.txt`를 자동으로 찾습니다
- ✅ 지원 URL을 루트 도메인(`https://ambro.space`)으로 변경하는 것은 선택사항입니다
- ✅ **핵심은 `app-ads.txt` 파일이 `https://ambro.space/app-ads.txt`에서 접근 가능해야 합니다** (이미 완료됨)

#### 3단계: app-ads.txt 파일 확인
1. 브라우저에서 `https://ambro.space/app-ads.txt` 접속
2. 파일 내용이 다음과 같이 표시되는지 확인:
   ```
   google.com, pub-1444459980078427, DIRECT, f08c47fec0942fa0
   ```
3. 파일이 정상적으로 접근되지 않으면 Vercel 재배포 확인

#### 4단계: AdMob에서 앱 인증 상태 확인
1. AdMob 대시보드 → **앱** 섹션
2. **물주기 알림_lite (iOS)** 앱 선택
3. **인증** 또는 **설정** 탭 확인
4. **업데이트 확인** 버튼 클릭
5. 상태 확인:
   - ✅ "앱이 인증되었습니다" 메시지 확인
   - ⚠️ "app-ads.txt 파일을 찾을 수 없습니다" 메시지가 있으면 2-3단계 재확인

#### 5단계: 시간 대기
- `app-ads.txt` 파일과 개발자 웹사이트 설정이 올바르면, Google 크롤링 후 자동으로 인증됨
- 일반적으로 **12-48시간** 소요
- 크롤링은 최대 **24시간** 간격으로 수행됨

#### 6단계: 문제가 계속되면
1. AdMob 고객 지원에 문의
2. 다음 정보 준비:
   - 앱 스토어 ID: `6755084030`
   - 개발자 웹사이트: `https://ambro.space`
   - `app-ads.txt` 파일 URL: `https://ambro.space/app-ads.txt`
   - 앱 이름: 물주기 알림_lite (iOS)

### 스토어 추가 후 확인 사항

1. ✅ 앱 설정 페이지에서 스토어 정보가 표시되는지 확인
2. ✅ "스토어를 추가하여 한도 해제" 메시지가 사라졌는지 확인
3. ✅ 광고 한도 상태가 업데이트되었는지 확인 (최대 24시간 소요 가능)
4. ✅ **App Store Connect에서 개발자 웹사이트가 `https://ambro.space`로 설정되어 있는지 확인**
5. ✅ **`https://ambro.space/app-ads.txt` 파일이 정상적으로 접근 가능한지 확인**

## 🔧 AdMob 저장 버튼이 활성화되지 않는 경우

### 문제: 저장 버튼이 비활성화되어 있음

**가능한 원인과 해결 방법:**

1. **앱이 이미 추가된 경우**
   - 화면에 "추가됨" 상태로 표시되면, 이미 연결된 앱입니다
   - 추가 설정이 필요 없을 수 있음
   - **해결**: "취소" 버튼을 클릭하고 다음 단계로 진행

2. **필수 입력 필드가 비어있는 경우**
   - 앱 이름, 플랫폼 등 필수 정보가 입력되지 않았을 수 있음
   - **해결**: 모든 필수 필드(빨간색 별표 표시)를 확인하고 입력

3. **앱 세부정보 입력 필요**
   - 앱을 선택한 후에도 추가 정보 입력이 필요할 수 있음
   - **해결**: 
     - 앱 이름이 올바르게 표시되는지 확인
     - 플랫폼 (iOS/Android)이 정확한지 확인
     - 패키지 이름/번들 ID가 정확한지 확인

4. **브라우저 캐시 문제**
   - 브라우저 캐시로 인해 상태가 업데이트되지 않을 수 있음
   - **해결**:
     - 페이지 새로고침 (F5 또는 Cmd+R)
     - 브라우저 캐시 삭제 후 다시 시도
     - 시크릿 모드/프라이빗 모드에서 시도

5. **변경사항이 없는 경우**
   - 이미 저장된 상태이고 변경사항이 없으면 저장 버튼이 비활성화될 수 있음
   - **해결**: "취소"를 클릭하고, 필요한 경우 앱 설정 페이지에서 다른 정보를 수정

### 추천 해결 순서

1. **페이지 새로고침** 후 다시 확인
2. 앱이 이미 "추가됨" 상태면 **"취소" 버튼 클릭**
3. AdMob 대시보드의 **"앱"** 섹션에서 해당 앱이 정상적으로 표시되는지 확인
4. 앱 상세 페이지에서 **"인증"** 또는 **"설정"** 탭으로 이동하여 필요한 정보 확인/수정
5. 그래도 안 되면 **다른 브라우저에서 시도** (Chrome, Firefox, Safari 등)

### 다음 단계

앱이 이미 추가되었다면:
1. AdMob 대시보드 → **앱** 섹션으로 이동
2. 해당 앱 (예: 물주기 알림_lite (iOS)) 선택
3. **인증** 또는 **설정** 탭에서 앱 정보 확인
4. **app-ads.txt** 인증 상태 확인
5. 필요한 경우 **업데이트 확인** 버튼 클릭

## 📞 참고 자료

- [AdMob 공식 문서 - app-ads.txt](https://support.google.com/admob/answer/7532444)
- [Google Play Console](https://play.google.com/console)
- [App Store Connect](https://appstoreconnect.apple.com)

---

**참고:** 이 가이드는 AdMob 앱 인증을 완료하기 위한 단계를 정리한 것입니다. 실제 작업은 각 스토어 콘솔과 AdMob 대시보드에서 직접 수행해야 합니다.

