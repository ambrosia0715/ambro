<script setup lang="ts">
import { useRoute } from '#imports'
import { categories, getPostsByCategory } from '../../data/blogData'
import type { BlogCategoryId } from '../../data/blogData'
import { useSeoMeta } from '#imports'

const route = useRoute()
const categoryId = route.params.category as BlogCategoryId
const categoryName = categories[categoryId] ?? '블로그'
const posts = getPostsByCategory(categoryId)

const categoryDescriptions: Partial<Record<BlogCategoryId, string>> = {
  'ai-basic': 'AI 도구를 실무에 적용하는 방법과 워크플로우를 정리합니다.',
  'ai-insight': 'AI 업계/제품/모델 트렌드를 핵심만 빠르게 분석합니다.',
  java: 'Java/Spring 기반의 실무 설계·성능·패턴을 다룹니다.',
  python: 'Python 실무 문법·데이터·웹 프레임워크를 정리합니다.'
}

const categoryBlurb = categoryDescriptions[categoryId] ?? '실무에 도움이 되는 글을 정리합니다.'
const featured = posts.slice(0, 5)

useSeoMeta({
  title: `${categoryName} - Ambro Tech Blog`,
  description: `${categoryName} 관련 기술 블로그 글 목록 - Ambro Tech Blog`,
  ogTitle: `${categoryName} - Ambro Tech Blog`,
  ogDescription: `${categoryName} 관련 기술 블로그 글 목록 - Ambro Tech Blog`,
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <header class="header">
      <h1>{{ categoryName }}</h1>
      <p class="sub">
        {{ categoryBlurb }} · {{ posts.length }}개의 글
      </p>
    </header>

    <section v-if="featured.length" class="featured">
      <div class="featured-head">
        <h2>추천 글</h2>
        <p class="featured-sub">
          처음 방문하셨다면 아래 글부터 보시면 전체 흐름을 빠르게 잡을 수 있어요.
        </p>
      </div>
      <ol class="featured-list">
        <li v-for="post in featured" :key="post.fileName" class="featured-item">
          <NuxtLink :to="`/blog/${post.category}/${post.fileName}`" class="featured-link">
            <span class="featured-title">{{ post.title }}</span>
            <span class="featured-meta">{{ post.date }} · {{ post.readTime }}</span>
          </NuxtLink>
        </li>
      </ol>
      <p class="policy-note">
        운영/정책: <NuxtLink to="/privacy">개인정보처리방침</NuxtLink> ·
        <NuxtLink to="/contact">문의하기</NuxtLink>
      </p>
    </section>

    <div v-if="!posts.length" class="empty">
      등록된 포스트가 없습니다.
    </div>

    <div v-else class="grid">
      <article v-for="post in posts" :key="post.fileName" class="card">
        <NuxtLink :to="`/blog/${post.category}/${post.fileName}`">
          <div class="thumb-wrapper">
            <img
              class="thumb"
              :src="`/${post.thumbnailUrl}`"
              :alt="post.title"
              loading="lazy"
            />
          </div>
          <div class="card-body">
            <p v-if="post.tags.length" class="tag">
              {{ post.tags[0] }}
            </p>
            <h2>{{ post.title }}</h2>
            <p class="desc">
              {{ post.description }}
            </p>
            <p class="meta">
              {{ post.date }} · {{ post.readTime }} · {{ post.author }}
            </p>
          </div>
        </NuxtLink>
      </article>
    </div>
  </div>
</template>

<style scoped>
.page-root {
  max-width: 1200px;
  margin: 0 auto;
  padding: 48px 24px;
}

.header {
  margin-bottom: 48px;
}

.header h1 {
  font-size: 36px;
  font-weight: 700;
  letter-spacing: -0.5px;
  color: #1a1a1a;
  margin: 0;
}

.sub {
  margin-top: 12px;
  font-size: 16px;
  font-weight: 500;
  color: #757575;
}

.featured {
  margin-top: 12px;
  margin-bottom: 40px;
  padding: 20px;
  border-radius: 12px;
  border: 1px solid #e0e0e0;
  background: #ffffff;
}

.featured-head h2 {
  margin: 0;
  font-size: 18px;
  font-weight: 800;
  color: #1a1a1a;
}

.featured-sub {
  margin: 6px 0 0;
  font-size: 14px;
  color: #6c757d;
}

.featured-list {
  margin: 14px 0 0;
  padding-left: 18px;
}

.featured-item {
  margin: 8px 0;
}

.featured-link {
  display: flex;
  justify-content: space-between;
  gap: 12px;
  text-decoration: none;
  color: inherit;
}

.featured-title {
  font-weight: 700;
  color: #212529;
}

.featured-meta {
  color: #9e9e9e;
  font-size: 13px;
  white-space: nowrap;
}

.policy-note {
  margin: 14px 0 0;
  font-size: 13px;
  color: #6c757d;
}

.policy-note a {
  color: #1976d2;
  text-decoration: none;
  font-weight: 600;
}

.policy-note a:hover {
  text-decoration: underline;
}

.empty {
  padding: 48px 0;
  text-align: center;
  color: #9e9e9e;
  font-size: 16px;
}

.grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 32px;
}

.card {
  background: #fff;
  border-radius: 12px;
  overflow: hidden;
  border: 1px solid #e0e0e0;
}

.card a {
  display: flex;
  flex-direction: column;
  height: 100%;
  color: inherit;
  text-decoration: none;
}

.thumb-wrapper {
  position: relative;
  padding-bottom: 56.25%;
  overflow: hidden;
}

.thumb {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.card-body {
  padding: 20px;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.tag {
  display: inline-block;
  font-size: 12px;
  font-weight: 700;
  padding: 4px 10px;
  border-radius: 16px;
  background: #e3f2fd;
  color: #1976d2;
  width: fit-content;
  margin: 0;
}

.card h2 {
  font-size: 18px;
  font-weight: 700;
  line-height: 1.4;
  color: #1a1a1a;
  margin: 0;
}

.desc {
  font-size: 14px;
  color: #757575;
  line-height: 1.5;
  flex: 1;
  margin: 0;
}

.card-body .meta {
  margin-top: 0;
  padding-top: 12px;
  border-top: 1px solid #f5f5f5;
  font-size: 12px;
  color: #9e9e9e;
}

@media (max-width: 900px) {
  .grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@media (max-width: 640px) {
  .grid {
    grid-template-columns: repeat(1, minmax(0, 1fr));
  }
}
</style>

