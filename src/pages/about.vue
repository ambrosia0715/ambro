<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '소개 (About) - Ambro Tech Blog',
  description:
    '15년 차 시니어 개발자 Ambro의 기술 블로그. Java/Spring 전문, AI 도구 활용.',
  ogTitle: '소개 (About) - Ambro Tech Blog',
  ogDescription:
    '15년 차 시니어 개발자 Ambro의 기술 블로그. Java/Spring 전문, AI 도구 활용.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <section class="hero">
      <p class="badge">15+ Years in Dev</p>
      <h1>견고한 웹 생태계를 만드는 개발자 Ambro입니다</h1>
      <p class="headline">
        강민석 · 15년 차 시니어 개발자 (Java/Spring 전문)
      </p>
      <p class="text">
        레거시의 견고함과 최신 AI 도구(Cursor, LLM)의 효율성을 결합하여 가치를 창출하는
        1인 개발자 및 기업가입니다.
      </p>
    </section>

    <section class="section">
      <h2>Tech Stack &amp; Expertise</h2>
      <p class="subtitle">기술 스택 &amp; 전문성</p>
      <div class="grid">
        <div class="card">
          <h3>Backend</h3>
          <p>Java(Spring Boot) 기반 백엔드 및 API 설계 전문성</p>
          <ul>
            <li>Java</li>
            <li>Spring Boot</li>
            <li>REST API</li>
            <li>비즈니스 로직 설계</li>
          </ul>
        </div>
        <div class="card">
          <h3>AI &amp; Productivity</h3>
          <p>차세대 개발 워크플로우 숙련도</p>
          <ul>
            <li>Cursor</li>
            <li>Replit</li>
            <li>Ollama</li>
            <li>LLM 활용</li>
          </ul>
        </div>
      </div>
    </section>

    <section class="section">
      <h2>Why Ambro Blog?</h2>
      <p class="subtitle">운영 철학</p>
      <div class="philosophy">
        <h3>기초가 튼튼해야 무너지지 않는다</h3>
        <p>
          이 블로그는 Java/Python의 핵심 문법과 최신 AI 정보를 공유합니다.
          개발자들이 실무에서 겪는 병목 현상을 해결해주는 가이드북 같은 블로그를
          지향하며, 최신 IT 정보를 통해 함께 성장하는 공간이 되고자 합니다.
        </p>
      </div>
    </section>

    <section class="section">
      <h2>My Projects</h2>
      <p class="subtitle">Result-driven Developer의 결과물</p>
      <div class="projects">
        <NuxtLink to="/apps/aicent/ongi" class="project">
          <div class="icon ongi">📖</div>
          <div>
            <p class="name">온기</p>
            <p class="desc">AI가 전해주는 위로의 일기 앱</p>
          </div>
        </NuxtLink>
        <NuxtLink to="/apps/play/nunchi-game" class="project">
          <div class="icon nunchi">🎮</div>
          <div>
            <p class="name">눈치게임</p>
            <p class="desc">친구들과 함께하는 숫자 맞추기 게임</p>
          </div>
        </NuxtLink>
        <NuxtLink to="/apps/mate/water-buddy" class="project">
          <div class="icon water">🌱</div>
          <div>
            <p class="name">물주기 알림_lite</p>
            <p class="desc">식물마다 주기를 설정하면 날짜에 맞춰 알려드려요</p>
          </div>
        </NuxtLink>
        <NuxtLink to="/apps/mate/pill-ping" class="project">
          <div class="icon pill">💊</div>
          <div>
            <p class="name">PILL PING lite</p>
            <p class="desc">약 복용 시간을 놓치지 않도록 도와주는 알림 앱</p>
          </div>
        </NuxtLink>
      </div>
      <p class="apps-link">
        <NuxtLink to="/about/apps">전체 앱 보기 →</NuxtLink>
      </p>
    </section>
  </div>
</template>

<style scoped>
.page-root {
  max-width: 900px;
  margin: 0 auto;
  padding: 48px 24px 64px;
}

.hero {
  padding: 40px 24px;
  border-radius: 16px;
  background: linear-gradient(135deg, #e7f1ff, #ffffff);
  border: 1px solid rgba(0, 123, 255, 0.2);
}

.badge {
  display: inline-block;
  padding: 6px 12px;
  border-radius: 8px;
  background: #007bff;
  color: white;
  font-size: 14px;
  font-weight: 600;
}

h1 {
  margin-top: 24px;
  font-size: 28px;
  font-weight: 800;
  letter-spacing: -0.03em;
}

.headline {
  margin-top: 12px;
  font-size: 17px;
  color: #4b5563;
}

.text {
  margin-top: 8px;
  font-size: 16px;
  color: #6b7280;
}

.section {
  margin-top: 48px;
}

.section h2 {
  font-size: 24px;
  font-weight: 700;
  color: #1a1a1a;
}

.subtitle {
  margin-top: 4px;
  font-size: 14px;
  color: #6b7280;
}

.grid {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 20px;
  margin-top: 24px;
}

.card {
  padding: 20px;
  border-radius: 12px;
  border: 1px solid #e0e0e0;
  background: #ffffff;
}

.card h3 {
  font-size: 18px;
  font-weight: 700;
  color: #007bff;
}

.card p {
  margin-top: 8px;
  font-size: 14px;
  color: #4b5563;
}

.card ul {
  margin-top: 12px;
  padding-left: 18px;
  font-size: 14px;
  color: #374151;
}

.philosophy {
  margin-top: 24px;
  padding: 24px;
  border-radius: 12px;
  border: 1px solid rgba(0, 123, 255, 0.3);
  background: rgba(231, 241, 255, 0.7);
}

.philosophy h3 {
  font-size: 18px;
  font-weight: 700;
}

.philosophy p {
  margin-top: 12px;
  font-size: 16px;
  color: #4b5563;
  line-height: 1.7;
}

.projects {
  margin-top: 24px;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.project {
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 14px 16px;
  border-radius: 12px;
  border: 1px solid #e0e0e0;
  background: #ffffff;
  text-decoration: none;
  color: inherit;
  transition: border-color 0.2s, box-shadow 0.2s;
}

.project:hover {
  border-color: #007bff;
  box-shadow: 0 2px 8px rgba(0, 123, 255, 0.08);
}

.icon {
  width: 40px;
  height: 40px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
}

.icon.ongi {
  background: #fef3c7;
}

.icon.nunchi {
  background: #dbeafe;
}

.icon.water {
  background: #dcfce7;
}

.icon.pill {
  background: #e0f2fe;
}

.project .name {
  font-size: 16px;
  font-weight: 700;
}

.project .desc {
  font-size: 13px;
  color: #6b7280;
}

.apps-link {
  margin-top: 16px;
  text-align: right;
}

.apps-link a {
  color: #007bff;
  text-decoration: none;
  font-weight: 600;
}

@media (max-width: 768px) {
  .grid {
    grid-template-columns: repeat(1, minmax(0, 1fr));
  }
}
</style>

