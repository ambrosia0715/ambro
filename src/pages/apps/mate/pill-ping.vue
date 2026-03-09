<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: 'PILL PING lite - Ambro Apps',
  description: '약 복용 시간을 놓치지 않도록 도와주는 PILL PING lite 소개',
  ogTitle: 'PILL PING lite - Ambro Apps',
  ogDescription: '약 복용 시간을 놓치지 않도록 도와주는 PILL PING lite 소개',
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
        src="/assets/images/pill_ping_logo.png"
        alt="PILL PING lite"
        class="thumb"
      />
      <div class="header-text">
        <h1>PILL PING lite</h1>
        <p class="subtitle">
          약 복용 시간을 놓치지 않도록 도와주는 간편한 알림 앱
        </p>
        <div class="chips">
          <span class="chip">라이프스타일</span>
          <span class="chip">건강</span>
          <span class="chip">무료</span>
        </div>
      </div>
    </section>

    <section class="card">
      <h2>💊 PILL PING lite - 약 복용 시간을 놓치지 않도록 도와드립니다!</h2>
      <p>
        복잡한 설정 없이 약 이름과 복용 시간만 입력하면, 설정한 시간에 알림으로 복용을
        알려드립니다.
      </p>
    </section>

    <section class="card">
      <h2>주요 기능</h2>
      <ul class="features">
        <li>
          <strong>약 복용 알림</strong>
          <span>약 이름별로 아침, 점심, 저녁 복용 시간을 개별 설정할 수 있습니다.</span>
        </li>
        <li>
          <strong>복용 기록 관리</strong>
          <span>오늘의 복용 스케줄을 한눈에 확인하고 상태를 실시간으로 표시합니다.</span>
        </li>
        <li>
          <strong>간편한 사용</strong>
          <span>직관적인 UI로 복잡한 설정 없이 바로 사용할 수 있습니다.</span>
        </li>
        <li>
          <strong>알림 액션</strong>
          <span>알림에서 바로 복용/미루기 처리가 가능해 앱을 열지 않고도 관리할 수 있습니다.</span>
        </li>
      </ul>
    </section>

    <section class="card">
      <h2>이런 분들께 추천해요</h2>
      <ul>
        <li>약을 복용해야 하지만 시간을 자주 잊는 분</li>
        <li>여러 종류의 약을 복용하는 분</li>
        <li>간단하고 직관적인 앱을 선호하는 분</li>
        <li>복잡한 설정 없이 바로 사용하고 싶은 분</li>
      </ul>
    </section>

    <section class="card">
      <h2>앱 정보</h2>
      <dl class="info">
        <div>
          <dt>개발자</dt>
          <dd>MinSeok Kang</dd>
        </div>
        <div>
          <dt>버전</dt>
          <dd>1.0.0 (Build 1)</dd>
        </div>
        <div>
          <dt>카테고리</dt>
          <dd>라이프스타일, 건강</dd>
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
      <NuxtLink to="/privacy/pill-ping" class="link-privacy">
        개인정보 처리방침 보기
      </NuxtLink>
    </section>

    <section class="download-card blue">
      <p class="download-title">
        지금 다운로드하고<br />약 복용 시간을 놓치지 마세요! 💊
      </p>
      <div class="stores">
        <a
          href="https://play.google.com/store/apps/details?id=com.ambro.pillpinglite"
          target="_blank"
          rel="noopener noreferrer"
          class="store-btn"
        >
          <span>Google Play</span>
        </a>
        <a
          href="https://apps.apple.com/us/app/pill-ping-lite/id6755383377"
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
  background: #dbeafe;
  color: #1d4ed8;
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

.download-card.blue {
  background: #2196f3;
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

