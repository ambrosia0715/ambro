<script setup lang="ts">
import { ref } from 'vue'
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: 'SQL Formatter - Ambro Tech Blog',
  description: 'SQL 쿼리를 보기 좋게 정렬하고 키워드를 대문자로 변환하는 도구',
  ogTitle: 'SQL Formatter - Ambro Tech Blog',
  ogDescription: 'SQL 쿼리를 보기 좋게 정렬하고 키워드를 대문자로 변환하는 도구',
  ogType: 'website'
})

const input = ref('')
const output = ref('')

const formatSql = () => {
  if (!input.value.trim()) {
    output.value = ''
    return
  }

  let formatted = input.value.replace(/\s+/g, ' ')
  formatted = formatted.replace(/\s*,\s*/g, ', ')

  const keywords = [
    'SELECT',
    'FROM',
    'WHERE',
    'GROUP BY',
    'HAVING',
    'ORDER BY',
    'INSERT INTO',
    'VALUES',
    'UPDATE',
    'SET',
    'DELETE FROM',
    'INNER JOIN',
    'LEFT JOIN',
    'RIGHT JOIN',
    'OUTER JOIN',
    'JOIN',
    'UNION',
    'UNION ALL',
    'LIMIT',
    'OFFSET'
  ]

  for (const kw of keywords) {
    const re = new RegExp(`\\b${kw}\\b`, 'gi')
    formatted = formatted.replace(re, (m) => `\n${m.toUpperCase()}\n  `)
  }

  formatted = formatted.replace(/\b(AND|OR)\b/gi, (m) => `\n  ${m.toUpperCase()}`)
  formatted = formatted.replace(/\n\s*\n/g, '\n').trim()

  output.value = formatted
}

const clearAll = () => {
  input.value = ''
  output.value = ''
}
</script>

<template>
  <div class="page-root">
    <header class="header">
      <h1>SQL Formatter</h1>
      <p class="lead">
        SQL 쿼리를 절과 키워드 기준으로 줄바꿈하고, 예약어를 대문자로 통일해 가독성을 높입니다.
      </p>
      <div class="tip">
        <p class="tip-title">💡 사용법</p>
        <p>• 입력창에 SQL 쿼리를 붙여넣고 "Format SQL" 버튼을 누르세요.</p>
        <p>• SELECT, FROM, WHERE, JOIN, ORDER BY 등의 절마다 줄이 바뀝니다.</p>
      </div>
    </header>

    <section class="layout">
      <div class="panel">
        <h2>입력 (Input)</h2>
        <textarea
          v-model="input"
          class="textarea"
          spellcheck="false"
          placeholder="SQL 쿼리를 여기에 붙여넣으세요..."
        />
      </div>

      <div class="actions">
        <button type="button" class="btn primary" @click="formatSql">
          Format SQL
        </button>
        <button type="button" class="btn ghost" @click="clearAll">
          Clear
        </button>
      </div>

      <div class="panel">
        <h2>결과 (Output)</h2>
        <textarea
          v-model="output"
          class="textarea"
          spellcheck="false"
          readonly
        />
      </div>
    </section>
  </div>
</template>

<style scoped>
.page-root {
  max-width: 1100px;
  margin: 0 auto;
}

.header h1 {
  font-size: 28px;
  font-weight: 800;
}

.lead {
  margin-top: 8px;
  color: #6b7280;
}

.tip {
  margin-top: 20px;
  padding: 14px 16px;
  border-radius: 10px;
  background: #e0edff;
  border: 1px solid #bfdbfe;
  font-size: 13px;
}

.tip-title {
  font-weight: 700;
  color: #1d4ed8;
  margin-bottom: 4px;
}

.layout {
  margin-top: 28px;
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 18px;
  align-items: flex-start;
}

.panel h2 {
  font-size: 14px;
  font-weight: 700;
  margin-bottom: 6px;
  color: #374151;
}

.textarea {
  width: 100%;
  min-height: 260px;
  padding: 10px 12px;
  border-radius: 10px;
  border: 1px solid #e5e7eb;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas,
    'Liberation Mono', 'Courier New', monospace;
  font-size: 13px;
  resize: vertical;
  box-sizing: border-box;
}

.actions {
  display: flex;
  flex-direction: column;
  gap: 8px;
  align-items: flex-start;
}

.btn {
  padding: 8px 14px;
  border-radius: 999px;
  border: 1px solid #d1d5db;
  background: white;
  font-size: 13px;
  cursor: pointer;
}

.btn.primary {
  background: #6200ee;
  color: white;
  border-color: #6200ee;
}

.btn.ghost {
  background: transparent;
}

.btn:hover {
  opacity: 0.95;
}

@media (max-width: 900px) {
  .layout {
    grid-template-columns: repeat(1, minmax(0, 1fr));
  }
}
</style>

