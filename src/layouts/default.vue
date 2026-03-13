<script setup lang="ts">
import { computed, ref } from 'vue'

const route = useRoute()
const config = useRuntimeConfig()
const siteUrl = (config.public.siteUrl as string) || 'https://ambro.space'

const canonicalUrl = computed(() => {
  const path = route.path === '/' ? '' : route.path
  return `${siteUrl}${path}`
})

const showAds = computed(() => {
  const p = route.path
  return !p.startsWith('/utils') && !p.startsWith('/privacy') && !p.startsWith('/contact') && !p.startsWith('/about/apps')
})

// 페이지별 canonical·ogUrl (개별 페이지에서 override 가능)
useHead(() => ({
  link: [{ rel: 'canonical', href: canonicalUrl.value }],
  script: showAds.value ? [
    {
      src: 'https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1444459980078427',
      async: true,
      crossorigin: 'anonymous'
    }
  ] : []
}))

useSeoMeta({
  ogUrl: () => canonicalUrl.value
})

const aboutOpen = ref(false)
let aboutCloseTimer: ReturnType<typeof setTimeout> | null = null

function openAbout() {
  if (aboutCloseTimer) {
    clearTimeout(aboutCloseTimer)
    aboutCloseTimer = null
  }
  aboutOpen.value = true
}

function closeAbout() {
  aboutCloseTimer = setTimeout(() => {
    aboutOpen.value = false
    aboutCloseTimer = null
  }, 180)
}

function cancelCloseAbout() {
  if (aboutCloseTimer) {
    clearTimeout(aboutCloseTimer)
    aboutCloseTimer = null
  }
  aboutOpen.value = true
}

const progOpen = ref(false)
let progCloseTimer: ReturnType<typeof setTimeout> | null = null

function openProg() {
  if (progCloseTimer) {
    clearTimeout(progCloseTimer)
    progCloseTimer = null
  }
  progOpen.value = true
}

function closeProg() {
  progCloseTimer = setTimeout(() => {
    progOpen.value = false
    progCloseTimer = null
  }, 180)
}

function cancelCloseProg() {
  if (progCloseTimer) {
    clearTimeout(progCloseTimer)
    progCloseTimer = null
  }
  progOpen.value = true
}
</script>

<template>
  <div class="app-root">
    <header class="app-header">
      <nav class="nav">
        <NuxtLink to="/" class="logo">
          <span class="logo-mark">AT</span>
          <span class="logo-text">Ambro Tech</span>
        </NuxtLink>
        <div class="nav-links">
          <NuxtLink to="/blog/ai-basic">AI Dev</NuxtLink>
          <NuxtLink to="/blog/ai-insight">AI Insight</NuxtLink>
          <div
            class="nav-group"
            @mouseenter="openProg"
            @mouseleave="closeProg"
          >
            <button class="nav-group-trigger" type="button">
              프로그래밍
              <span class="nav-group-arrow">▾</span>
            </button>
            <div
              class="nav-group-menu"
              :class="{ 'nav-group-menu-open': progOpen }"
              @mouseenter="cancelCloseProg"
              @mouseleave="closeProg"
            >
              <NuxtLink to="/blog/java">Java</NuxtLink>
              <NuxtLink to="/blog/python">Python</NuxtLink>
              <NuxtLink to="/utils">UTIL</NuxtLink>
            </div>
          </div>
          <div
            class="nav-group"
            @mouseenter="openAbout"
            @mouseleave="closeAbout"
          >
            <button class="nav-group-trigger" type="button">
              About
              <span class="nav-group-arrow">▾</span>
            </button>
            <div
              class="nav-group-menu"
              :class="{ 'nav-group-menu-open': aboutOpen }"
              @mouseenter="cancelCloseAbout"
              @mouseleave="closeAbout"
            >
              <NuxtLink to="/about">소개 (About)</NuxtLink>
              <NuxtLink to="/about/apps">Apps</NuxtLink>
              <NuxtLink to="/privacy">개인정보처리방침</NuxtLink>
              <NuxtLink to="/contact">문의하기</NuxtLink>
            </div>
          </div>
        </div>
      </nav>
    </header>
    <main class="app-main">
      <slot />
    </main>
    <footer class="app-footer">
      <p class="footer-links">
        <NuxtLink to="/privacy">개인정보처리방침</NuxtLink>
        <span class="divider">|</span>
        <NuxtLink to="/contact">문의하기</NuxtLink>
      </p>
      <p class="footer-meta">
        Ambro (엠브로) | 대표 이메일: ambrosia0715.ambro@gmail.com | 주소: 서울시 동작구 상도로387
      </p>
      <p class="footer-copy">© 2025 Ambro Tech. All rights reserved.</p>
    </footer>
  </div>
</template>

<style scoped>
.app-root {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: #ffffff;
  color: #1a1a1a;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
    'Noto Sans KR', system-ui, -system-ui, sans-serif;
}

.app-header {
  position: sticky;
  top: 0;
  z-index: 40;
  background: #ffffff;
  border-bottom: 1px solid #e0e0e0;
}

.nav {
  max-width: 1200px;
  margin: 0 auto;
  padding: 12px 24px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
}

.logo {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  text-decoration: none;
  color: inherit;
}

.logo-mark {
  width: 36px;
  height: 36px;
  border-radius: 8px;
  background: #6200ee;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  color: #ffffff;
  font-weight: 700;
  font-size: 18px;
}

.logo-text {
  font-weight: 700;
  font-size: 20px;
  color: #000000;
}

.nav-links {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 8px;
  font-size: 15px;
  font-weight: 500;
}

.nav-links > a {
  color: #555555;
}

.nav-links > a.router-link-exact-active,
.nav-links > a.router-link-active {
  color: #6200ee;
  font-weight: 700;
  background: transparent;
}

.nav-links > a:hover {
  color: #6200ee;
  background: transparent;
}

.nav-group {
  position: relative;
}

/* 드롭다운 트리거 공통: About 기준 회색 박스 */
.nav-group-trigger {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  background: #f5f5f5;
  color: #333333;
  font-weight: 600;
  font-size: 14px;
  padding: 8px 16px;
  border-radius: 8px;
  border: none;
  cursor: pointer;
  font-family: inherit;
  transition: background 0.15s ease, color 0.15s ease;
}

.nav-group-trigger:hover {
  background: #eeeeee;
  color: #333333;
}

.nav-group-arrow {
  font-size: 10px;
}

.nav-group-menu {
  position: absolute;
  top: 100%;
  left: 0;
  margin-top: 4px;
  min-width: 180px;
  padding: 8px 0;
  border-radius: 12px;
  background: #f9fafb;
  box-shadow: 0 12px 30px rgba(15, 23, 42, 0.18);
  border: 1px solid #e5e7eb;
  display: none;
  flex-direction: column;
  z-index: 50;
}

.nav-group-menu.nav-group-menu-open {
  display: flex;
}

/* 트리거와 메뉴 사이 빈 공간에도 hover 유지되도록 투명 영역 */
.nav-group-menu::before {
  content: '';
  position: absolute;
  left: 0;
  right: 0;
  bottom: 100%;
  height: 12px;
}

.nav-group-menu a {
  padding: 8px 14px;
  text-decoration: none;
  color: #374151;
  border-radius: 0;
}

.nav-group-menu a:hover {
  background: #eef2ff;
  color: #6200ee;
}

.nav-links > a {
  text-decoration: none;
  padding: 8px;
  transition: color 0.15s ease;
}

.app-main {
  flex: 1;
  padding: 48px 24px 56px;
}

.app-footer {
  border-top: 1px solid #e0e0e0;
  padding: 32px 24px;
  background: #f8f9fa;
  text-align: center;
  font-size: 13px;
  color: #6c757d;
}

.footer-links a {
  color: #495057;
  text-decoration: none;
  font-weight: 500;
  padding: 4px 8px;
}

.divider {
  margin: 0 8px;
  color: #dee2e6;
}

.footer-meta {
  margin-top: 24px;
}

.footer-copy {
  margin-top: 8px;
  color: #adb5bd;
  font-size: 12px;
}

@media (max-width: 768px) {
  .nav {
    flex-direction: column;
    align-items: flex-start;
  }

  .nav-links {
    gap: 8px;
  }
}
</style>

