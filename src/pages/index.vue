<script setup lang="ts">
import { useSeoMeta } from '#imports'
import { getPostsByCategory } from '../data/blogData'
import type { BlogCategoryId } from '../data/blogData'

useSeoMeta({
  title: 'Ambro Tech Blog - AI, Java, Python 기술 블로그',
  description:
    'AI 개발, Java, Python 등 실무 개발 지식과 최신 기술 트렌드를 공유하는 Ambro Tech Blog입니다.',
  ogTitle: 'Ambro Tech Blog - AI, Java, Python 기술 블로그',
  ogDescription:
    'AI 개발, Java, Python 등 실무 개발 지식과 최신 기술 트렌드를 공유합니다.',
  ogType: 'website'
})

const sections: { key: BlogCategoryId; title: string; label: string }[] = [
  { key: 'ai-basic', title: 'Latest in AI Dev', label: 'AI Dev' },
  { key: 'ai-insight', title: 'Latest in AI Insight', label: 'AI Insight' },
  { key: 'java', title: 'Latest in Java', label: 'Java' },
  { key: 'python', title: 'Latest in Python', label: 'Python' }
]
</script>

<template>
  <div class="home-root">
    <section
      v-for="sec in sections"
      :key="sec.key"
      class="section"
    >
      <div class="section-header">
        <h2 class="section-title">{{ sec.title }}</h2>
        <NuxtLink :to="`/blog/${sec.key}`" class="view-all">
          View All
          <span class="arrow">→</span>
        </NuxtLink>
      </div>
      <div class="grid">
        <article
          v-for="post in getPostsByCategory(sec.key).slice(0, 3)"
          :key="post.fileName"
          class="card"
        >
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
              <p v-if="post.tags.length" class="tag">{{ post.tags[0] }}</p>
              <h3 class="card-title">{{ post.title }}</h3>
              <p class="desc">{{ post.description }}</p>
              <div class="card-divider" />
              <p class="meta">{{ post.date }} · {{ post.readTime }}</p>
            </div>
          </NuxtLink>
        </article>
      </div>
    </section>
  </div>
</template>

<style scoped>
.home-root {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px 48px;
}

.section {
  margin-bottom: 32px;
}

.section:last-child {
  margin-bottom: 48px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
}

.section-title {
  font-size: 24px;
  font-weight: 700;
  color: #1a1a1a;
  margin: 0;
}

.view-all {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  font-size: 14px;
  font-weight: 600;
  color: #1976d2;
  text-decoration: none;
}

.view-all:hover {
  text-decoration: underline;
}

.arrow {
  font-size: 16px;
}

.grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 24px;
}

.card {
  background: #fff;
  border-radius: 12px;
  border: 1px solid #e0e0e0;
  overflow: hidden;
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

.card-title {
  font-size: 18px;
  font-weight: 700;
  color: #1a1a1a;
  line-height: 1.4;
  margin: 0;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.desc {
  font-size: 14px;
  color: #757575;
  line-height: 1.5;
  flex: 1;
  margin: 0;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.card-divider {
  height: 1px;
  background: #f5f5f5;
  margin: 0;
}

.meta {
  font-size: 12px;
  color: #9e9e9e;
  margin: 0;
}

@media (max-width: 900px) {
  .grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@media (max-width: 600px) {
  .grid {
    grid-template-columns: 1fr;
  }
}
</style>

