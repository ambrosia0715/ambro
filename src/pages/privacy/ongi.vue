<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '온기 개인정보처리방침 - Ambro Apps',
  description:
    '온기(따뜻한 일기 앱)의 개인정보 수집·이용, 제3자 제공, 보관 기간 등에 관한 내용을 안내합니다.',
  ogTitle: '온기 개인정보처리방침 - Ambro Apps',
  ogDescription:
    '온기(따뜻한 일기 앱)의 개인정보 수집·이용, 제3자 제공, 보관 기간 등에 관한 내용을 안내합니다.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <NuxtLink to="/privacy" class="back">
      ← 개인정보처리방침 목록으로 돌아가기
    </NuxtLink>

    <h1>온기 개인정보처리방침</h1>
    <p class="updated">최종 업데이트: 2025년 11월 3일</p>

    <section class="section">
      <h2>1. 수집하는 개인정보 항목</h2>
      <p>
        온기 앱은 일기 작성 및 데이터 백업 기능 제공을 위하여 다음과 같은 정보를 처리할 수
        있습니다. 실제 서비스 구현에 맞게 항목을 보완해 주세요.
      </p>
      <ul>
        <li>계정 정보: Google/Apple 계정(이메일, 고유 식별자 등)</li>
        <li>앱 내 데이터: 사용자가 직접 작성한 일기 내용, 감정, 목표, 할 일 등</li>
      </ul>
    </section>

    <section class="section">
      <h2>2. 개인정보의 이용 목적</h2>
      <ul>
        <li>일기 데이터 저장 및 조회 기능 제공</li>
        <li>기기 변경 시 데이터 백업 및 복원</li>
        <li>서비스 품질 향상을 위한 통계 분석 및 오류 모니터링</li>
      </ul>
    </section>

    <section class="section">
      <h2>3. 보관 기간 및 파기</h2>
      <p>
        이용자가 계정 연동을 해제하거나 탈퇴를 요청하는 경우, 관련 법령에서 별도로 정한
        기간을 제외하고 해당 계정과 연결된 일기 데이터는 지체 없이 파기합니다. 단, 법령상
        보관 의무가 있는 경우 그 기간 동안은 별도 분리 보관됩니다.
      </p>
    </section>

    <section class="section">
      <h2>4. 제3자 제공 및 외부 서비스</h2>
      <p>
        온기 앱은 데이터 저장 및 알림, 분석 기능을 위해 외부 클라우드/분석 서비스를 사용할 수
        있습니다. 실제 사용하는 서비스에 따라 목록을 수정해 주세요.
      </p>
      <ul>
        <li>Firebase: 인증, 데이터 저장 및 분석</li>
        <li>Crashlytics 등 오류 분석 도구</li>
      </ul>
    </section>

    <section class="section">
      <h2>5. 이용자의 권리</h2>
      <p>
        이용자는 앱 내에서 개별 일기 삭제, 계정 연동 해제 등을 통해 자신의 데이터를 관리할 수
        있으며, 필요한 경우 이메일을 통해 데이터 삭제를 요청할 수 있습니다.
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

