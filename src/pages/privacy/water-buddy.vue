<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '물주기 알림_lite 개인정보처리방침 - Ambro Apps',
  description:
    '물주기 알림_lite 앱의 개인정보 수집·이용, 제3자 제공, 보관 기간 등에 관한 내용을 안내합니다.',
  ogTitle: '물주기 알림_lite 개인정보처리방침 - Ambro Apps',
  ogDescription:
    '물주기 알림_lite 앱의 개인정보 수집·이용, 제3자 제공, 보관 기간 등에 관한 내용을 안내합니다.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <NuxtLink to="/privacy" class="back">
      ← 개인정보처리방침 목록으로 돌아가기
    </NuxtLink>

    <h1>물주기 알림_lite 개인정보처리방침</h1>
    <p class="updated">최종 업데이트: 2025년 11월 3일</p>

    <section class="section">
      <h2>1. 수집하는 개인정보 항목</h2>
      <p>
        물주기 알림_lite 앱은 식물 관리 및 알림 기능 제공을 위해 다음과 같은 정보를 처리할 수
        있습니다. 실제 서비스 정책에 맞게 항목을 조정해 주세요.
      </p>
      <ul>
        <li>식물 이름, 사진, 메모 등 사용자가 직접 입력한 정보</li>
        <li>물주기 주기, 알림 시간 등 알림 설정 정보</li>
      </ul>
      <p>해당 정보는 사용자의 기기에 저장되며, 별도의 서버로 전송되지 않을 수 있습니다.</p>
    </section>

    <section class="section">
      <h2>2. 개인정보의 이용 목적</h2>
      <ul>
        <li>식물별 물주기 알림 제공</li>
        <li>사용자가 등록한 식물 관리 정보 표시</li>
        <li>서비스 품질 개선을 위한 최소한의 통계 분석(사용자 동의 범위 내)</li>
      </ul>
    </section>

    <section class="section">
      <h2>3. 보관 기간 및 파기</h2>
      <p>
        앱 삭제 또는 앱 내 데이터 초기화 기능을 사용하는 경우, 기기에 저장된 관련 정보는
        복구할 수 없도록 삭제됩니다. 별도의 서버에 저장된 정보가 있는 경우에는 관련 법령 및
        서비스 정책에 따라 보관 후 파기됩니다.
      </p>
    </section>

    <section class="section">
      <h2>4. 광고 및 분석 도구</h2>
      <p>
        앱에서 광고 또는 분석 도구를 사용하는 경우, 해당 사업자가 광고 식별자 및 사용
        통계를 수집할 수 있습니다. 실제 사용하는 SDK(예: Google AdMob, Firebase Analytics 등)
        에 따라 구체적인 내용은 각 사업자의 개인정보처리방침을 참고해 주세요.
      </p>
    </section>

    <section class="section">
      <h2>5. 이용자의 권리</h2>
      <p>
        이용자는 단말기 설정에서 광고 추적 제한, 알림 허용/거부 등을 직접 설정할 수 있으며,
        앱 삭제를 통해 더 이상 정보 수집이 이루어지지 않도록 할 수 있습니다.
      </p>
    </section>

    <section class="section">
      <h2>6. 문의처</h2>
      <ul>
        <li>이메일: ambrosia0715.ambro@gmail.com</li>
      </ul>
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

ul {
  padding-left: 20px;
}

li {
  margin-bottom: 4px;
}
</style>

