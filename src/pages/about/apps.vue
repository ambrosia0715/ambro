<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: 'Apps - Ambro Tech Blog',
  description: 'Ambro에서 제공하는 앱들을 만나보세요. 온기, 눈치게임, 물주기 알림_lite, PILL PING lite 등.',
  ogTitle: 'Apps - Ambro Tech Blog',
  ogDescription: 'Ambro에서 제공하는 앱들을 만나보세요. 온기, 눈치게임, 물주기 알림_lite, PILL PING lite 등.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <h1>Apps</h1>
    <p class="lead">Ambro에서 제공하는 앱들을 만나보세요.</p>

    <section class="section">
      <h2>AIcent</h2>
      <p class="desc">AI를 사용하는 앱 모음</p>
      <div class="cards">
        <NuxtLink to="/apps/aicent/ongi" class="card">
          <img src="/assets/images/ongi_logo.png" alt="온기" class="thumb" />
          <div>
            <p class="name">온기</p>
            <p class="text">따뜻한 일기 앱 - AI가 전해주는 위로의 한마디</p>
          </div>
        </NuxtLink>
      </div>
    </section>

    <section class="section">
      <h2>Play</h2>
      <p class="desc">단순 게임형 앱 모음</p>
      <div class="cards">
        <NuxtLink to="/apps/play/nunchi-game" class="card">
          <img
            src="/assets/images/game_guessing_logo.png"
            alt="눈치게임"
            class="thumb"
          />
          <div>
            <p class="name">눈치게임</p>
            <p class="text">친구들과 함께 즐기는 숫자 맞추기 게임</p>
          </div>
        </NuxtLink>
      </div>
    </section>

    <section class="section">
      <h2>Mate</h2>
      <p class="desc">생활 보조 앱 모음</p>
      <div class="cards">
        <NuxtLink to="/apps/mate/water-buddy" class="card">
          <img
            src="/assets/images/water_buddy_logo.png"
            alt="물주기 알림_lite"
            class="thumb"
          />
          <div>
            <p class="name">물주기 알림_lite</p>
            <p class="text">식물마다 주기를 설정하면 날짜에 맞춰 알려드려요</p>
          </div>
        </NuxtLink>
        <NuxtLink to="/apps/mate/pill-ping" class="card">
          <img
            src="/assets/images/pill_ping_logo.png"
            alt="PILL PING lite"
            class="thumb"
          />
          <div>
            <p class="name">PILL PING lite</p>
            <p class="text">약 복용 시간을 놓치지 않도록 도와주는 알림 앱</p>
          </div>
        </NuxtLink>
      </div>
    </section>
  </div>
</template>

<style scoped>
.page-root {
  max-width: 1200px;
  margin: 0 auto;
}

h1 {
  font-size: 32px;
  font-weight: 800;
  margin-bottom: 8px;
}

.lead {
  font-size: 16px;
  color: #6b7280;
}

.section {
  margin-top: 40px;
}

.section h2 {
  font-size: 24px;
  font-weight: 700;
}

.desc {
  margin-top: 4px;
  color: #6b7280;
}

.cards {
  margin-top: 20px;
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
}

.card {
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 16px 18px;
  border-radius: 12px;
  border: 1px solid #e5e7eb;
  background: #ffffff;
  text-decoration: none;
  color: inherit;
  width: 340px;
}

.thumb {
  width: 56px;
  height: 56px;
  border-radius: 14px;
  object-fit: cover;
}

.name {
  font-size: 16px;
  font-weight: 700;
}

.text {
  font-size: 13px;
  color: #6b7280;
}

@media (max-width: 768px) {
  .card {
    width: 100%;
  }
}
</style>

