<script setup lang="ts">
import { useRoute } from '#imports'
import { categories, getPostsByCategory } from '../../data/blogData'
import type { BlogCategoryId } from '../../data/blogData'
import { useSeoMeta } from '#imports'

const route = useRoute()
const categoryId = route.params.category as BlogCategoryId
const categoryName = categories[categoryId] ?? '블로그'
const posts = getPostsByCategory(categoryId)

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
        {{ posts.length }}개의 글
      </p>
    </header>

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

