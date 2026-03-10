<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: 'PILL PING lite 개인정보처리방침 - Ambro Apps',
  description:
    'PILL PING lite 앱의 개인정보 수집·이용, 제3자 제공, 보관 기간 등에 관한 내용을 안내합니다.',
  ogTitle: 'PILL PING lite 개인정보처리방침 - Ambro Apps',
  ogDescription:
    'PILL PING lite 앱의 개인정보 수집·이용, 제3자 제공, 보관 기간 등에 관한 내용을 안내합니다.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <NuxtLink to="/privacy" class="back">
      ← 개인정보처리방침 목록으로 돌아가기
    </NuxtLink>

    <h1>PILL PING lite 개인정보처리방침</h1>
    <p class="updated">최종 업데이트: 2025년 11월 3일</p>

    <section class="section">
      <h2>1. 수집하는 개인정보 항목</h2>
      <p>
        PILL PING lite 앱은 약 복용 알림 기능 제공을 위해 다음과 같은 정보를 처리할 수
        있습니다. 실제 서비스 정책에 맞게 항목을 보완해 주세요.
      </p>
      <ul>
        <li>약 이름, 복용 시간, 요일 등 사용자가 직접 입력한 정보</li>
        <li>알림 설정 정보(푸시 알림 허용 여부, 알림 시각 등)</li>
      </ul>
      <p>해당 정보는 단말기 내에 저장되며, 별도의 서버로 전송되지 않을 수 있습니다.</p>
    </section>

    <section class="section">
      <h2>2. 개인정보의 이용 목적</h2>
      <ul>
        <li>약 복용 알림 제공 및 일정 관리</li>
        <li>사용자가 등록한 복용 스케줄 표시</li>
        <li>서비스 안정성 확보 및 품질 개선을 위한 최소한의 통계 분석</li>
      </ul>
    </section>

    <section class="section">
      <h2>3. 보관 기간 및 파기</h2>
      <p>
        이용자가 앱을 삭제하거나, 앱 내에서 데이터를 초기화하는 경우 저장된 정보는 지체 없이
        삭제되며, 복구가 불가능한 방식으로 파기됩니다. 법령에서 별도의 보관 기간을 정한 경우
        해당 기간 동안은 예외적으로 보관될 수 있습니다.
      </p>
    </section>

    <section class="section">
      <h2>4. 광고 및 분석 도구</h2>
      <p>
        앱에서 광고 또는 분석 도구(예: Google AdMob, Firebase Analytics 등)를 사용하는 경우,
        해당 서비스 제공자가 광고 식별자 및 사용 통계를 수집할 수 있습니다. 구체적인 내용은
        각 서비스 제공자의 개인정보처리방침을 참고해 주세요.
      </p>
    </section>

    <section class="section">
      <h2>5. 이용자의 권리</h2>
      <p>
        이용자는 단말기 설정에서 알림, 광고 추적 제한 등을 직접 설정할 수 있으며, 앱 삭제를
        통해 더 이상 정보가 수집되지 않도록 할 수 있습니다. 필요 시 이메일을 통해 데이터
        삭제를 요청하실 수도 있습니다.
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

