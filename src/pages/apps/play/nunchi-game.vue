<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '눈치게임 - Ambro Apps',
  description: '친구들과 함께 즐기는 숫자 맞추기 파티게임 눈치게임 소개',
  ogTitle: '눈치게임 - Ambro Apps',
  ogDescription: '친구들과 함께 즐기는 숫자 맞추기 파티게임 눈치게임 소개',
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
        src="/assets/images/game_guessing_logo.png"
        alt="눈치게임"
        class="thumb"
      />
      <div class="header-text">
        <h1>눈치게임</h1>
        <p class="subtitle">친구들과 함께 즐기는 숫자 맞추기 게임</p>
        <div class="chips">
          <span class="chip">게임</span>
          <span class="chip">파티게임</span>
          <span class="chip">무료</span>
        </div>
      </div>
    </section>

    <section class="card">
      <h2>🎮 눈치게임 - 친구들과 함께 즐기는 재미!</h2>
      <p>
        상대의 눈치를 보며 1부터 차례대로 숫자를 외쳐보세요! 중복되지 않고 마지막
        숫자를 외치는 사람이 승리합니다.
      </p>
    </section>

    <section class="card">
      <h2>주요 기능</h2>
      <ul class="features">
        <li>
          <strong>멀티플레이어</strong>
          <span>친구들과 함께 즐기는 실시간 멀티플레이어 게임</span>
        </li>
        <li>
          <strong>심리전</strong>
          <span>상대의 눈치를 살피며 최적의 타이밍을 찾아보세요</span>
        </li>
        <li>
          <strong>파티게임</strong>
          <span>모임에서 간단하게 즐길 수 있는 재미있는 게임</span>
        </li>
        <li>
          <strong>빠른 게임</strong>
          <span>짧은 시간에 끝나는 빠른 게임 진행</span>
        </li>
      </ul>
    </section>

    <section class="card">
      <h2>게임 방법</h2>
      <ul>
        <li>참가자 수만큼의 숫자가 주어집니다.</li>
        <li>각자 차례 없이 1부터 순서대로 숫자를 외칩니다.</li>
        <li>동시에 같은 숫자를 외치면 탈락합니다.</li>
        <li>마지막 숫자를 혼자 외치는 사람이 승리합니다.</li>
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
          <dd>게임, 파티게임</dd>
        </div>
        <div>
          <dt>연령 등급</dt>
          <dd>전체 이용가</dd>
        </div>
        <div>
          <dt>가격</dt>
          <dd>무료</dd>
        </div>
      </dl>
      <NuxtLink to="/privacy/nunchi-game" class="link-privacy">
        개인정보 처리방침 보기
      </NuxtLink>
    </section>

    <section class="download-card">
      <p class="download-title">
        지금 다운로드하고<br />친구들과 함께 즐거운 시간을 보내세요! 🎮
      </p>
      <div class="stores">
        <a
          href="https://play.google.com/store/apps/details?id=com.ambro.nunchigame&pcampaignid=web_share"
          target="_blank"
          rel="noopener noreferrer"
          class="store-btn"
        >
          <span>Google Play</span>
        </a>
        <a
          href="https://apps.apple.com/us/app/%EB%88%88%EC%B9%98%EA%B2%8C%EC%9E%84/id6755019137"
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
  background: #eff6ff;
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
  background: #2563eb;
  color: #ffffff;
  text-align: center;
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

