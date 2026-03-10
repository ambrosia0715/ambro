<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '눈치게임 개인정보처리방침 - Ambro Apps',
  description:
    '눈치게임 앱의 개인정보 수집·이용, 제3자 제공, 보관 기간 등에 관한 내용을 안내합니다.',
  ogTitle: '눈치게임 개인정보처리방침 - Ambro Apps',
  ogDescription:
    '눈치게임 앱의 개인정보 수집·이용, 제3자 제공, 보관 기간 등에 관한 내용을 안내합니다.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <NuxtLink to="/privacy" class="back">
      ← 개인정보처리방침 목록으로 돌아가기
    </NuxtLink>

    <h1>눈치게임 개인정보처리방침</h1>
    <p class="updated">최종 업데이트: 2025년 11월 3일</p>

    <section class="section">
      <h2>1. 수집하는 개인정보 항목</h2>
      <p>
        눈치게임 앱은 가능한 한 개인정보를 최소한으로 처리하는 것을 원칙으로 하며, 다음과
        같은 정보가 수집·이용될 수 있습니다. 실제 서비스 정책에 따라 항목을 조정해 주세요.
      </p>
      <ul>
        <li>광고 식별자(ADID/IDFA) 및 기기 정보: 광고 노출 및 통계 분석을 위한 용도</li>
        <li>앱 이용 통계(충돌 정보, 사용 빈도 등): 서비스 품질 개선을 위한 용도</li>
      </ul>
      <p>이 외에 이름, 전화번호 등 직접 식별 가능한 정보는 앱에서 별도로 수집하지 않습니다.</p>
    </section>

    <section class="section">
      <h2>2. 개인정보의 이용 목적</h2>
      <p>수집된 정보는 아래 목적 범위 내에서만 이용되며, 그 외의 목적으로는 사용되지 않습니다.</p>
      <ul>
        <li>앱 안정성 확보 및 오류 분석</li>
        <li>게임 밸런스 조정 등 서비스 개선</li>
        <li>광고 노출 및 광고 성과 측정(AdMob 등 광고 플랫폼 사용 시)</li>
      </ul>
    </section>

    <section class="section">
      <h2>3. 보관 기간 및 파기</h2>
      <p>
        앱에서 직접 수집·저장하는 정보는 서비스 제공 목적 달성 시 또는 이용자가 앱을 삭제한
        경우 지체 없이 파기되며, 외부 광고·분석 플랫폼에서 수집한 정보는 각 사업자의
        개인정보처리방침에 따라 보관 및 파기됩니다.
      </p>
    </section>

    <section class="section">
      <h2>4. 제3자 제공 및 외부 SDK</h2>
      <p>
        눈치게임 앱은 광고 및 통계 분석을 위해 외부 SDK를 사용할 수 있으며, 이 과정에서 광고
        식별자 등 일부 정보가 제3자에게 전송될 수 있습니다. 실제 사용 중인 SDK에 맞게 목록을
        보완해 주세요.
      </p>
      <ul>
        <li>Google AdMob: 광고 노출 및 광고 성과 측정</li>
        <li>Firebase 등 분석 도구: 앱 사용성 분석 및 오류 모니터링</li>
      </ul>
      <p>
        각 서비스의 세부적인 개인정보 처리 내용은 해당 서비스 제공자의 개인정보처리방침을
        참고하시기 바랍니다.
      </p>
    </section>

    <section class="section">
      <h2>5. 이용자의 권리</h2>
      <p>
        이용자는 단말기의 설정 메뉴를 통해 광고 식별자 재설정 또는 추적 거부를 할 수 있으며,
        앱 삭제를 통해 더 이상 정보가 수집되지 않도록 할 수 있습니다. 보다 구체적인 권리
        행사는 단말기 운영체제 및 광고 플랫폼 설정을 참고해 주세요.
      </p>
    </section>

    <section class="section">
      <h2>6. 문의처</h2>
      <p>개인정보 보호와 관련된 문의, 불만 처리, 상담은 아래 연락처로 요청하실 수 있습니다.</p>
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

