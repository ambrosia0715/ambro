<script setup lang="ts">
import { ref } from 'vue'
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: 'JSON Formatter - Ambro Tech Blog',
  description: 'JSON 포맷/Minify를 지원하는 온라인 JSON 포맷터',
  ogTitle: 'JSON Formatter - Ambro Tech Blog',
  ogDescription: 'JSON 포맷/Minify를 지원하는 온라인 JSON 포맷터',
  ogType: 'website'
})

const input = ref('')
const output = ref('')
const error = ref('')

const formatJson = () => {
  if (!input.value.trim()) {
    output.value = ''
    error.value = ''
    return
  }
  try {
    const parsed = JSON.parse(input.value)
    output.value = JSON.stringify(parsed, null, 2)
    error.value = ''
  } catch (e: any) {
    output.value = ''
    error.value = `Invalid JSON: ${e?.message ?? ''}`
  }
}

const minifyJson = () => {
  if (!input.value.trim()) return
  try {
    const parsed = JSON.parse(input.value)
    output.value = JSON.stringify(parsed)
    error.value = ''
  } catch (e: any) {
    output.value = ''
    error.value = `Invalid JSON: ${e?.message ?? ''}`
  }
}

const clearAll = () => {
  input.value = ''
  output.value = ''
  error.value = ''
}
</script>

<template>
  <div class="page-root">
    <header class="header">
      <h1>JSON Formatter</h1>
      <p class="lead">
        복잡한 JSON 데이터를 보기 좋게 정렬하거나, 공백을 제거해 Minify 할 수 있습니다.
      </p>
      <div class="tip">
        <p class="tip-title">💡 사용법</p>
        <p>• Format: JSON 데이터를 입력하면 들여쓰기가 적용된 형태로 정렬합니다.</p>
        <p>• Minify: 공백을 제거한 한 줄 JSON으로 변환합니다.</p>
      </div>
    </header>

    <section class="layout">
      <div class="panel">
        <h2>입력 (Input)</h2>
        <textarea
          v-model="input"
          class="textarea"
          spellcheck="false"
          placeholder='JSON 데이터를 여기에 붙여넣으세요...'
        />
      </div>

      <div class="actions">
        <button type="button" class="btn primary" @click="formatJson">
          Format
        </button>
        <button type="button" class="btn" @click="minifyJson">
          Minify
        </button>
        <button type="button" class="btn ghost" @click="clearAll">
          Clear
        </button>
        <p v-if="error" class="error">
          {{ error }}
        </p>
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

.error {
  font-size: 12px;
  color: #b91c1c;
}

@media (max-width: 900px) {
  .layout {
    grid-template-columns: repeat(1, minmax(0, 1fr));
  }
}
</style>

