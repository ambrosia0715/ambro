<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '물주기 알림_lite - Ambro Apps',
  description: '식물마다 주기를 설정하면 날짜에 맞춰 알려주는 물주기 알림_lite 소개',
  ogTitle: '물주기 알림_lite - Ambro Apps',
  ogDescription: '식물마다 주기를 설정하면 날짜에 맞춰 알려주는 물주기 알림_lite 소개',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <NuxtLink to="/about/apps" class="back">
      ← 앱 목록으로 돌아가기
    </NuxtLink>

    <section class="header-card">
      <img
        src="/assets/images/water_buddy_logo.png"
        alt="물주기 알림_lite"
        class="thumb"
      />
      <div class="header-text">
        <h1>물주기 알림_lite</h1>
        <p class="subtitle">식물마다 주기를 설정하면 날짜에 맞춰 알려드려요!</p>
        <div class="chips">
          <span class="chip">라이프스타일</span>
          <span class="chip">생산성</span>
          <span class="chip">무료</span>
        </div>
      </div>
    </section>

    <section class="card">
      <h2>🌱 물주기 알림_lite - 식물 관리가 쉬워집니다!</h2>
      <p>
        식물을 사랑하지만 물주는 날짜를 자주 잊으시나요? 물주기 알림_lite가 여러분의
        식물 친구들을 건강하게 지켜드립니다!
      </p>
    </section>

    <section class="card">
      <h2>주요 기능</h2>
      <ul class="features">
        <li>
          <strong>맞춤형 물주기 알림</strong>
          <span>각 식물마다 다른 물주기 주기를 설정하고, 원하는 시간에 정확한 알림을 받습니다.</span>
        </li>
        <li>
          <strong>간편한 식물 관리</strong>
          <span>식물 사진을 추가하여 시각적으로 관리하고, 마지막 물 준 날짜를 자동으로 기록합니다.</span>
        </li>
        <li>
          <strong>데이터 백업 &amp; 복구</strong>
          <span>JSON 파일로 데이터를 내보내고 기기 변경 시 쉽게 이전할 수 있습니다.</span>
        </li>
        <li>
          <strong>깔끔한 디자인</strong>
          <span>직관적인 UI와 Material 디자인으로 누구나 쉽게 사용할 수 있습니다.</span>
        </li>
      </ul>
    </section>

    <section class="card">
      <h2>이런 분들께 추천해요</h2>
      <ul>
        <li>식물을 키우지만 물주는 날을 자주 잊는 분</li>
        <li>여러 종류의 식물을 관리하는 분</li>
        <li>식물 초보자부터 전문가까지</li>
        <li>간단하고 가벼운 앱을 선호하는 분</li>
      </ul>
    </section>

    <section class="card">
      <h2>앱 정보</h2>
      <dl class="info">
        <div>
          <dt>개발자</dt>
          <dd>Ambrosia</dd>
        </div>
        <div>
          <dt>버전</dt>
          <dd>1.0.0</dd>
        </div>
        <div>
          <dt>카테고리</dt>
          <dd>라이프스타일, 생산성</dd>
        </div>
        <div>
          <dt>연령 등급</dt>
          <dd>전체 이용가</dd>
        </div>
        <div>
          <dt>가격</dt>
          <dd>무료 (광고 포함)</dd>
        </div>
      </dl>
      <NuxtLink to="/privacy/water-buddy" class="link-privacy">
        개인정보 처리방침 보기
      </NuxtLink>
    </section>

    <section class="download-card green">
      <p class="download-title">
        지금 다운로드하고<br />여러분의 식물 친구들을 건강하게 키워보세요! 🌱
      </p>
      <div class="stores">
        <a
          href="https://play.google.com/store/apps/details?id=com.ambrosia.plantwaterbuddy"
          target="_blank"
          rel="noopener noreferrer"
          class="store-btn"
        >
          <span>Google Play</span>
        </a>
        <a
          href="https://apps.apple.com/us/app/%EB%AC%BC%EC%A3%BC%EA%B8%B0-%EC%95%8C%EB%A6%BC-lite/id6755084030"
          target="_blank"
          rel="noopener noreferrer"
          class="store-btn"
        >
          <span>App Store</span>
        </a>
      </div>
    </section>
  </div>
</template>

<style scoped>
.page-root {
  max-width: 900px;
  margin: 0 auto;
}

.back {
  display: inline-block;
  margin-bottom: 16px;
  font-size: 14px;
  color: #2563eb;
  text-decoration: none;
}

.header-card {
  display: flex;
  gap: 24px;
  padding: 24px;
  border-radius: 16px;
  border: 1px solid #e5e7eb;
  background: #ffffff;
}

.thumb {
  width: 120px;
  height: 120px;
  border-radius: 24px;
  object-fit: cover;
}

.header-text h1 {
  font-size: 28px;
  font-weight: 800;
}

.subtitle {
  margin-top: 8px;
  color: #4b5563;
}

.chips {
  margin-top: 12px;
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.chip {
  padding: 4px 10px;
  border-radius: 999px;
  background: #ecfdf3;
  color: #15803d;
  font-size: 12px;
  font-weight: 600;
}

.card {
  margin-top: 24px;
  padding: 24px;
  border-radius: 16px;
  border: 1px solid #e5e7eb;
  background: #ffffff;
}

.card h2 {
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 12px;
}

.features li {
  margin-bottom: 10px;
}

.features strong {
  display: block;
  font-size: 15px;
}

.features span {
  font-size: 14px;
  color: #4b5563;
}

ul {
  padding-left: 20px;
}

.info {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 8px 24px;
  margin-bottom: 12px;
}

dt {
  font-size: 13px;
  color: #6b7280;
}

dd {
  font-size: 14px;
  font-weight: 600;
}

.link-privacy {
  display: inline-block;
  margin-top: 8px;
  font-size: 14px;
  color: #2563eb;
  text-decoration: none;
}

.download-card {
  margin-top: 24px;
  padding: 24px;
  border-radius: 16px;
  color: #ffffff;
  text-align: center;
}

.download-card.green {
  background: #2e7d32;
}

.download-title {
  font-size: 18px;
  font-weight: 700;
  line-height: 1.5;
}

.stores {
  margin-top: 18px;
  display: flex;
  justify-content: center;
  gap: 12px;
  flex-wrap: wrap;
}

.store-btn {
  padding: 8px 18px;
  border-radius: 999px;
  background: #ffffff;
  color: #1f2937;
  font-size: 14px;
  text-decoration: none;
  font-weight: 600;
}

@media (max-width: 768px) {
  .header-card {
    flex-direction: column;
    align-items: flex-start;
  }
}
</style>

