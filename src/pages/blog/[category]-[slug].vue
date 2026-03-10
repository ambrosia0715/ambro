<script setup lang="ts">
import {
  useRoute,
  useSeoMeta,
  useRuntimeConfig,
  definePageMeta,
  useAsyncData
} from '#imports'
import { posts } from '../../data/blogData'
import type { BlogPost, BlogCategoryId } from '../../data/blogData'

definePageMeta({
  path: '/blog/:category/:slug'
})

const route = useRoute()
const config = useRuntimeConfig()

const category = route.params.category as BlogCategoryId
const slug = route.params.slug as string

const post = posts.find(
  (p) => p.category === category && p.fileName === slug
) as BlogPost | undefined

const audienceText = computed(() => {
  if (!post) return ''
  const c = post.category
  if (c === 'java') return 'Java/Spring 실무 설계·성능·패턴이 필요한 개발자'
  if (c === 'python') return 'Python 실무 문법/데이터/웹 프레임워크를 빠르게 정리하고 싶은 개발자'
  if (c === 'ai-basic') return 'AI 도구를 개발 워크플로우에 적용해 생산성을 올리고 싶은 개발자'
  return 'AI 트렌드를 빠르게 이해하고 의사결정에 참고하고 싶은 개발자'
})

const summaryBullets = computed(() => {
  if (!post) return []
  // description을 기반으로 2~3개의 짧은 요약 포인트를 생성 (너무 인위적이지 않게)
  const d = post.description?.trim() ?? ''
  if (!d) return []
  const parts = d
    // 구분자를 단순화해 안전하게 분리 (· • - / , 주변 공백 포함)
    .replace(/\s*[-/·•,]\s*/g, '|')
    .split('|')
    .map((s) => s.trim())
    .filter(Boolean)
  const uniq: string[] = []
  for (const p of parts) {
    if (uniq.length >= 3) break
    if (p.length < 6) continue
    if (!uniq.includes(p)) uniq.push(p)
  }
  return uniq.length ? uniq : [d]
})

// Nuxt Content 자동 임포트 queryCollection으로 전체 문서 조회 후 ContentRenderer로 본문 전체 렌더
const contentPath = post ? `/blog/${post.category}/${post.fileName}` : ''
const { data: doc } = await useAsyncData(
  `blog-doc-${contentPath}`,
  () => (contentPath ? queryCollection('blog').path(contentPath).first() : null),
  { watch: [() => contentPath] }
)

if (post) {
  const base = (config.public.siteUrl as string) || ''
  const thumbPath = post.thumbnailUrl.startsWith('assets/')
    ? `${base}/${post.thumbnailUrl}`
    : post.thumbnailUrl
  const canonical = `${base}/blog/${post.category}/${post.fileName}`

  useSeoMeta({
    title: `${post.title} - Ambro Tech Blog`,
    description: post.description,
    ogTitle: `${post.title} - Ambro Tech Blog`,
    ogDescription: post.description,
    ogType: 'article',
    ogUrl: canonical,
    ogImage: thumbPath,
    twitterCard: 'summary_large_image',
    twitterTitle: `${post.title} - Ambro Tech Blog`,
    twitterDescription: post.description,
    twitterImage: thumbPath
  })
}
</script>

<template>
  <div class="post-root">
    <div v-if="!post" class="not-found">
      포스트를 찾을 수 없습니다.
    </div>

    <article v-else class="post">
      <header class="post-header">
        <div v-if="post.tags.length" class="tags">
          <span v-for="tag in post.tags" :key="tag" class="tag">{{ tag }}</span>
        </div>
        <h1>{{ post.title }}</h1>
        <p class="meta">
          {{ post.date }} · {{ post.readTime }} · {{ post.author }}
        </p>

        <section class="info-box">
          <div class="info-col">
            <p class="info-label">이 글은 이런 분께</p>
            <p class="info-text">{{ audienceText }}</p>
          </div>
          <div class="info-col">
            <p class="info-label">핵심 요약</p>
            <ul class="info-list">
              <li v-for="s in summaryBullets" :key="s">{{ s }}</li>
            </ul>
          </div>
        </section>

        <p class="trust">
          작성자/운영: <NuxtLink to="/about">About</NuxtLink> ·
          <NuxtLink to="/privacy">개인정보처리방침</NuxtLink> ·
          <NuxtLink to="/contact">문의하기</NuxtLink>
        </p>

        <div v-if="post.thumbnailUrl" class="thumb-wrapper">
          <img
            class="thumb"
            :src="`/${post.thumbnailUrl}`"
            :alt="post.title"
            loading="lazy"
          />
        </div>
      </header>

      <div class="content">
        <ContentRenderer v-if="doc" :value="doc" />
        <p v-else-if="post && !doc" class="loading">본문을 불러오는 중…</p>
        <p v-else class="not-found-msg">본문을 불러올 수 없습니다. (콘텐츠 파일 누락)</p>
      </div>
    </article>
  </div>
</template>

<style scoped>
.post-root {
  max-width: 960px;
  margin: 0 auto;
  padding: 48px 24px 64px;
}

.not-found {
  padding: 80px 0;
  text-align: center;
  color: #9e9e9e;
}

.post-header {
  margin-bottom: 48px;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 16px;
}

.tag {
  display: inline-block;
  font-size: 13px;
  font-weight: 700;
  padding: 6px 12px;
  border-radius: 20px;
  background: #e3f2fd;
  color: #1976d2;
}

h1 {
  font-size: 40px;
  font-weight: 700;
  line-height: 1.3;
  color: #1a1a1a;
  margin: 0 0 16px;
}

.meta {
  font-size: 16px;
  color: #9e9e9e;
  margin: 0 0 32px;
}

.thumb-wrapper {
  border-radius: 12px;
  overflow: hidden;
}

.thumb {
  width: 100%;
  height: auto;
  display: block;
}

.info-box {
  margin-top: 16px;
  padding: 16px;
  border-radius: 12px;
  border: 1px solid #e0e0e0;
  background: #ffffff;
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 16px;
}

.info-label {
  margin: 0;
  font-size: 12px;
  font-weight: 800;
  color: #9e9e9e;
  letter-spacing: 0.2px;
}

.info-text {
  margin: 6px 0 0;
  font-size: 14px;
  font-weight: 700;
  color: #212529;
  line-height: 1.6;
}

.info-list {
  margin: 6px 0 0;
  padding-left: 18px;
  color: #495057;
  font-size: 14px;
  line-height: 1.6;
}

.trust {
  margin: 14px 0 0;
  font-size: 13px;
  color: #6c757d;
}

.trust a {
  color: #1976d2;
  text-decoration: none;
  font-weight: 700;
}

.trust a:hover {
  text-decoration: underline;
}

.content {
  margin-top: 48px;
  font-size: 17px;
  line-height: 1.8;
}

@media (max-width: 768px) {
  .info-box {
    grid-template-columns: 1fr;
  }
}

.content :deep(h2) {
  margin-top: 32px;
  margin-bottom: 12px;
  font-size: 26px;
  font-weight: 700;
  color: #212529;
}

.content :deep(h3) {
  margin-top: 24px;
  margin-bottom: 8px;
  font-size: 22px;
  font-weight: 700;
  color: #343a40;
}

.content :deep(p) {
  margin: 10px 0;
  color: #495057;
  font-size: 17px;
  line-height: 1.8;
}

.content :deep(p code),
.content :deep(li code),
.content :deep(td code) {
  background: #f1f3f5;
  color: #212529;
  padding: 2px 6px;
  border-radius: 4px;
  font-size: 15px;
}

.content :deep(pre) {
  background: #f8f9fa;
  color: #212529;
  padding: 14px 16px;
  border-radius: 8px;
  border: 1px solid #e0e0e0;
  overflow-x: auto;
  font-size: 15px;
}

.content :deep(pre code),
.content :deep(pre code span),
.content :deep(pre [class]) {
  background: transparent !important;
  color: inherit;
  padding: 0;
  font-size: inherit;
}

.content :deep(a) {
  color: #1976d2;
  text-decoration: none;
}

.content :deep(a:hover) {
  text-decoration: underline;
}

.content :deep(img) {
  max-width: 100%;
  border-radius: 8px;
  margin: 16px 0;
}

.content :deep(blockquote) {
  margin: 16px 0;
  padding: 12px 16px;
  border-left: 4px solid #dee2e6;
  background: #f8f9fa;
  color: #6c757d;
  font-size: 16px;
  border-radius: 0 8px 8px 0;
}

.loading,
.not-found-msg {
  color: #6b7280;
  margin-top: 1rem;
}
</style>

