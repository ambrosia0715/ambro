<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '물주기 알림_lite 개인정보처리방침 - Ambro Apps',
  description:
    '물주기 알림_lite 개인정보 처리방침. 오프라인 저장, 광고(AdMob) 관련 수집 항목 등을 안내합니다.',
  ogTitle: '물주기 알림_lite 개인정보처리방침 - Ambro Apps',
  ogDescription:
    '물주기 알림_lite 개인정보 처리방침. 오프라인 저장, 광고(AdMob) 관련 수집 항목 등을 안내합니다.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <NuxtLink to="/apps/mate/water-buddy" class="back">
      ← 앱 정보로 돌아가기
    </NuxtLink>

    <h1>물주기 알림_lite 개인정보처리방침</h1>
    <p class="updated">최종 업데이트: 2025년 11월 9일</p>

    <section class="section">
      <h2>1. 수집하는 개인정보</h2>
      <ul>
        <li>개인 식별 정보 (이름, 이메일, 전화번호 등)</li>
        <li>위치 정보</li>
        <li>기기 고유 식별자</li>
      </ul>
      <div class="callout green">
        <p class="callout-title">오프라인 동작</p>
        <p class="callout-text">
          본 앱은 오프라인으로 작동하며, 모든 데이터는 사용자의 기기에만 저장됩니다.
        </p>
      </div>
    </section>

    <section class="section">
      <h2>2. 데이터 저장</h2>
      <h3>로컬 저장</h3>
      <ul>
        <li>식물 정보: 식물 이름, 사진, 물주기 주기, 마지막 물 준 날짜</li>
        <li>알림 설정: 알림 시간 및 활성화 상태</li>
        <li>앱 설정: 사용자 환경 설정</li>
      </ul>
      <p class="note">
        모든 데이터는 기기 내부 저장소에만 보관되며, 외부 서버로 전송되지 않습니다.
      </p>
      <hr class="divider" />
      <h3>데이터 백업</h3>
      <ul>
        <li>사용자가 직접 JSON 파일로 내보내기 가능</li>
        <li>백업 파일은 사용자가 선택한 위치에만 저장</li>
      </ul>
    </section>

    <section class="section">
      <h2>3. 제3자 서비스</h2>
      <h3>Google AdMob</h3>
      <p>
        본 앱은 광고 제공을 위해 Google AdMob을 사용합니다. AdMob은 광고 맞춤 설정을 위해 다음 정보를
        수집할 수 있습니다:
      </p>
      <ul>
        <li>광고 ID</li>
        <li>IP 주소</li>
        <li>기기 정보 (모델, OS 버전)</li>
        <li>앱 사용 통계</li>
      </ul>
      <div class="callout blue">
        <p class="callout-title">AdMob 개인정보 처리방침</p>
        <p class="callout-text">
          <a href="https://policies.google.com/privacy" target="_blank" rel="noopener noreferrer">
            https://policies.google.com/privacy
          </a>
        </p>
      </div>
      <p class="subhead">광고 맞춤 설정 해제 방법:</p>
      <ul>
        <li>Android: 설정 &gt; Google &gt; 광고 &gt; 광고 맞춤설정 선택 해제</li>
        <li>iOS: 설정 &gt; 개인정보 보호 &gt; 광고 &gt; 광고 추적 제한</li>
      </ul>
    </section>

    <section class="section">
      <h2>4. 권한 사용</h2>
      <h3>Android 권한</h3>
      <ul>
        <li><strong>알림 (POST_NOTIFICATIONS)</strong>: 식물 물주기 알림 전송</li>
        <li><strong>정확한 알람 (SCHEDULE_EXACT_ALARM)</strong>: 정확한 시간에 알림 전송</li>
        <li><strong>부팅 완료 수신 (RECEIVE_BOOT_COMPLETED)</strong>: 기기 재시작 후 알림 재설정</li>
        <li><strong>배터리 최적화 무시 (REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)</strong>: 알림 신뢰성 향상</li>
        <li><strong>인터넷 (INTERNET)</strong>: 광고 표시</li>
      </ul>
      <hr class="divider" />
      <h3>iOS 권한</h3>
      <ul>
        <li><strong>알림</strong>: 식물 물주기 알림 전송</li>
        <li><strong>사진 라이브러리</strong>: 식물 사진 선택 (선택사항)</li>
        <li><strong>카메라</strong>: 식물 사진 촬영 (선택사항)</li>
      </ul>
      <div class="callout amber">
        <p class="callout-text">모든 권한은 앱의 핵심 기능을 위해서만 사용됩니다.</p>
      </div>
    </section>

    <section class="section">
      <h2>5. 데이터 보안</h2>
      <ul>
        <li>모든 데이터는 기기 내부에만 저장</li>
        <li>외부 서버로 전송되지 않음</li>
        <li>네트워크 통신은 광고 표시에만 사용</li>
      </ul>
    </section>

    <section class="section">
      <h2>6. 어린이 보호</h2>
      <p>본 앱은 13세 미만 어린이를 대상으로 하지 않으며, 고의로 어린이의 개인정보를 수집하지 않습니다.</p>
    </section>

    <section class="section">
      <h2>7. 데이터 삭제</h2>
      <ul>
        <li>앱 삭제 시 모든 데이터가 함께 삭제됩니다</li>
        <li>설정 메뉴에서 &quot;전체 데이터 삭제&quot; 가능</li>
      </ul>
    </section>

    <section class="section">
      <h2>8. 개인정보 처리방침 변경</h2>
      <p>
        본 개인정보 처리방침은 필요에 따라 업데이트될 수 있습니다. 중요한 변경사항이 있을 경우 앱 내 공지사항으로 알려드립니다.
      </p>
    </section>

    <section class="section">
      <h2>9. 문의</h2>
      <p>개인정보 처리방침에 대한 문의사항이 있으시면 다음으로 연락해 주세요:</p>
      <ul>
        <li>
          GitHub:
          <a
            href="https://github.com/ambrosia0715/plant-water-buddy-lite"
            target="_blank"
            rel="noopener noreferrer"
          >
            https://github.com/ambrosia0715/plant-water-buddy-lite
          </a>
        </li>
      </ul>
    </section>

    <section class="footer">
      <p>개발자: Ambrosia</p>
      <p>앱 버전: 1.0.0</p>
      <p>최종 업데이트: 2025년 11월 9일</p>
    </section>
  </div>
</template>

<style scoped>
.page-root {
  max-width: 900px;
  margin: 0 auto;
  font-size: 15px;
  line-height: 1.8;
}

.back {
  display: inline-block;
  margin-bottom: 16px;
  font-size: 14px;
  color: #2563eb;
  text-decoration: none;
}

h1 {
  font-size: 28px;
  font-weight: 800;
  margin-bottom: 8px;
}

.updated {
  color: #6b7280;
  margin-bottom: 24px;
}

.section {
  margin-top: 24px;
}

.section h2 {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 8px;
}

.section h3 {
  margin-top: 12px;
  margin-bottom: 8px;
  font-size: 16px;
  font-weight: 800;
  color: #212529;
}

ul {
  padding-left: 20px;
}

li {
  margin-bottom: 4px;
}

.divider {
  border: 0;
  height: 1px;
  background: #e0e0e0;
  margin: 16px 0;
}

.note {
  margin-top: 8px;
  font-size: 13px;
  color: #6c757d;
  font-style: italic;
}

.subhead {
  margin-top: 12px;
  font-weight: 700;
}

.callout {
  margin-top: 12px;
  padding: 14px 14px;
  border-radius: 10px;
  border: 1px solid #e0e0e0;
  background: #f8f9fa;
}

.callout-title {
  margin: 0 0 6px;
  font-size: 14px;
  font-weight: 800;
}

.callout-text {
  margin: 0;
  font-size: 13px;
  line-height: 1.6;
}

.callout.green {
  background: #ecfdf3;
  border-color: #bbf7d0;
}

.callout.blue {
  background: #eff6ff;
  border-color: #bfdbfe;
}

.callout.amber {
  background: #fffbeb;
  border-color: #fde68a;
}

.callout a {
  color: #1976d2;
  text-decoration: none;
  font-weight: 700;
}

.callout a:hover {
  text-decoration: underline;
}

.footer {
  margin-top: 28px;
  padding: 16px;
  border-radius: 12px;
  background: #f8f9fa;
  border: 1px solid #e0e0e0;
  color: #6c757d;
  font-size: 14px;
}

.footer p {
  margin: 4px 0;
}
</style>

