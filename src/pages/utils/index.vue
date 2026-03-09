<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '개발자 유틸리티 - Ambro Tech Blog',
  description:
    'JSON Formatter, SQL Formatter, Regex Tester, CamelCase 변환기 등 개발자 유틸리티 모음.',
  ogTitle: '개발자 유틸리티 - Ambro Tech Blog',
  ogDescription:
    'JSON Formatter, SQL Formatter, Regex Tester, CamelCase 변환기 등 개발자 유틸리티 모음.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <h1>개발자 유틸리티</h1>
    <p class="lead">
      코딩 시 자주 쓰는 포맷·변환 도구를 브라우저에서 바로 사용할 수 있습니다.
    </p>

    <div class="grid">
      <NuxtLink to="/utils/json-formatter" class="card">
        <h2>JSON Formatter</h2>
        <p>
          JSON 데이터를 보기 좋게 들여쓰기하거나, 공백을 제거해 Minify 하는 도구입니다.
        </p>
      </NuxtLink>

      <NuxtLink to="/utils/sql-formatter" class="card">
        <h2>SQL Formatter</h2>
        <p>
          한 줄로 된 SQL 쿼리를 절·키워드 기준으로 줄바꿈하고 대문자로 정리합니다.
        </p>
      </NuxtLink>

      <NuxtLink to="/utils/regex-tester" class="card">
        <h2>Regex Tester</h2>
        <p>
          정규표현식을 입력하고 테스트 문자열과 비교해 매칭 결과를 즉시 확인할 수 있습니다.
        </p>
      </NuxtLink>

      <NuxtLink to="/utils/camel-converter" class="card">
        <h2>CamelCase 변환기</h2>
        <p>
          여러 줄의 텍스트를 camelCase / PascalCase / snake_case 로 서로 변환합니다.
        </p>
      </NuxtLink>
    </div>
  </div>
</template>

<style scoped>
.page-root {
  max-width: 900px;
  margin: 0 auto;
}

h1 {
  font-size: 28px;
  font-weight: 800;
}

.lead {
  margin-top: 8px;
  color: #6b7280;
}

.grid {
  margin-top: 28px;
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 18px;
}

.card {
  padding: 18px 16px;
  border-radius: 14px;
  border: 1px solid #e5e7eb;
  background: #ffffff;
  text-decoration: none;
  color: inherit;
}

.card h2 {
  font-size: 18px;
  font-weight: 700;
}

.card p {
  margin-top: 8px;
  font-size: 14px;
  color: #4b5563;
}

@media (max-width: 768px) {
  .grid {
    grid-template-columns: repeat(1, minmax(0, 1fr));
  }
}
</style>

