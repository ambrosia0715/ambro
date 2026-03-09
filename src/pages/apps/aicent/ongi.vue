<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '온기 - Ambro Apps',
  description: '따뜻한 일기 앱 온기 소개. AI가 전해주는 위로의 한마디와 간편한 일기 작성',
  ogTitle: '온기 - Ambro Apps',
  ogDescription: '따뜻한 일기 앱 온기 소개. AI가 전해주는 위로의 한마디와 간편한 일기 작성',
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
        src="/assets/images/ongi_logo.png"
        alt="온기"
        class="thumb"
      />
      <div class="header-text">
        <h1>온기</h1>
        <p class="subtitle">따뜻한 일기 앱</p>
        <div class="chips">
          <span class="chip">일기</span>
          <span class="chip">AI</span>
          <span class="chip">생산성</span>
        </div>
      </div>
    </section>

    <section class="card">
      <h2>📱 온기 - 매일의 따뜻한 순간을 기록하는 일기 앱</h2>
      <p>
        복잡한 일기 작성 대신, 간단하고 편리하게 하루를 기록하고 AI가 전해주는
        위로의 한마디로 하루를 마무리할 수 있습니다.
      </p>
    </section>

    <section class="card">
      <h2>주요 기능</h2>
      <ul class="features">
        <li>
          <strong>간편한 일기 작성</strong>
          <span>감정 선택, 오늘의 목표, 할 일 관리, 마음 한 줄로 간단하게 하루를 기록합니다.</span>
        </li>
        <li>
          <strong>AI가 전해주는 위로의 한마디</strong>
          <span>일기를 작성하면 AI가 하루를 분석하고 따뜻한 코멘트를 전해줍니다.</span>
        </li>
        <li>
          <strong>일기 히스토리 및 통계</strong>
          <span>날짜별 일기를 쉽게 찾아보고 감정 분포 차트로 패턴을 확인할 수 있습니다.</span>
        </li>
        <li>
          <strong>데이터 백업 및 복원</strong>
          <span>JSON 파일로 데이터를 백업해 새로운 기기로 옮길 수 있습니다.</span>
        </li>
        <li>
          <strong>안전한 데이터 보관</strong>
          <span>Firebase와 Google 계정을 통해 데이터를 안전하게 보관합니다.</span>
        </li>
        <li>
          <strong>깔끔하고 편리한 인터페이스</strong>
          <span>따뜻한 색감의 UI와 다크 모드 지원으로 편안한 사용 경험을 제공합니다.</span>
        </li>
      </ul>
    </section>

    <section class="card">
      <h2>이런 분께 추천합니다</h2>
      <ul>
        <li>매일 일기를 쓰고 싶지만 시간이 부족한 분</li>
        <li>간단하게 하루를 기록하고 싶은 분</li>
        <li>AI의 응원 메시지로 하루를 마무리하고 싶은 분</li>
        <li>감정을 추적하고 자기 이해를 높이고 싶은 분</li>
        <li>목표와 할 일을 함께 관리하고 싶은 분</li>
      </ul>
    </section>

    <section class="card">
      <h2>앱 정보</h2>
      <dl class="info">
        <div>
          <dt>개발자</dt>
          <dd>Ambro (엠브로)</dd>
        </div>
        <div>
          <dt>버전</dt>
          <dd>1.0.0</dd>
        </div>
        <div>
          <dt>카테고리</dt>
          <dd>일기, AI, 생산성</dd>
        </div>
        <div>
          <dt>연령 등급</dt>
          <dd>전체 이용가</dd>
        </div>
        <div>
          <dt>가격</dt>
          <dd>무료 (프리미엄 구독 가능)</dd>
        </div>
        <div>
          <dt>지원 플랫폼</dt>
          <dd>iOS 13.0 이상, Android 5.0 이상</dd>
        </div>
      </dl>
      <NuxtLink to="/privacy/ongi" class="link-privacy">
        개인정보 처리방침 보기
      </NuxtLink>
    </section>

    <section class="download-card brown">
      <p class="download-title">
        지금 다운로드하고<br />따뜻한 하루를 기록해보세요! 📖
      </p>
      <div class="stores">
        <a
          href="https://play.google.com/store/apps/details?id=com.ambro.ongi&pcampaignid=web_share"
          target="_blank"
          rel="noopener noreferrer"
          class="store-btn"
        >
          <span>Google Play</span>
        </a>
        <a
          href="https://apps.apple.com/us/app/%EC%98%A8%EA%B8%B0-%EB%94%B0%EB%9C%BB%ED%95%9C-%EC%9D%BC%EA%B8%B0/id6755369005"
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
  background: #fef3c7;
  color: #92400e;
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

ul {
  padding-left: 20px;
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

.download-card.brown {
  background: #8b4513;
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

