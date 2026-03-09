<script setup lang="ts">
import { ref } from 'vue'
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: 'CamelCase 변환기 - Ambro Tech Blog',
  description: 'camelCase, PascalCase, snake_case 를 서로 변환하는 도구',
  ogTitle: 'CamelCase 변환기 - Ambro Tech Blog',
  ogDescription: 'camelCase, PascalCase, snake_case 를 서로 변환하는 도구',
  ogType: 'website'
})

const input = ref('')
const camel = ref('')
const pascal = ref('')
const snake = ref('')

const splitWords = (value: string): string[] => {
  if (!value) return []
  const cleaned = value
    .replace(/[-_]+/g, ' ')
    .replace(/([a-z0-9])([A-Z])/g, '$1 $2')
  return cleaned
    .split(/\s+/)
    .map((w) => w.trim())
    .filter(Boolean)
}

const toCamel = (words: string[]): string =>
  words
    .map((w, i) =>
      i === 0 ? w.toLowerCase() : w.charAt(0).toUpperCase() + w.slice(1).toLowerCase()
    )
    .join('')

const toPascal = (words: string[]): string =>
  words
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1).toLowerCase())
    .join('')

const toSnake = (words: string[]): string =>
  words.map((w) => w.toLowerCase()).join('_')

const convert = () => {
  const lines = input.value.split('\n')
  const camelLines: string[] = []
  const pascalLines: string[] = []
  const snakeLines: string[] = []

  for (const line of lines) {
    const words = splitWords(line)
    if (!words.length) {
      camelLines.push('')
      pascalLines.push('')
      snakeLines.push('')
      continue
    }
    camelLines.push(toCamel(words))
    pascalLines.push(toPascal(words))
    snakeLines.push(toSnake(words))
  }

  camel.value = camelLines.join('\n')
  pascal.value = pascalLines.join('\n')
  snake.value = snakeLines.join('\n')
}
</script>

<template>
  <div class="page-root">
    <header class="header">
      <h1>CamelCase 변환기</h1>
      <p class="lead">
        여러 줄의 텍스트를 camelCase / PascalCase / snake_case 로 한 번에 변환합니다.
      </p>
      <div class="tip">
        <p class="tip-title">💡 사용법</p>
        <p>• 각 줄을 하나의 식별자로 취급해 형식을 변환합니다.</p>
        <p>• 공백, -, _ 로 구분된 단어는 자동으로 인식합니다.</p>
      </div>
    </header>

    <section class="grid">
      <div class="panel">
        <h2>입력</h2>
        <textarea
          v-model="input"
          class="textarea"
          spellcheck="false"
          placeholder="user name&#10;order-id&#10;product_price"
          @input="convert"
        />
      </div>
      <div class="panel">
        <h2>camelCase</h2>
        <textarea v-model="camel" class="textarea" spellcheck="false" readonly />
      </div>
      <div class="panel">
        <h2>PascalCase</h2>
        <textarea v-model="pascal" class="textarea" spellcheck="false" readonly />
      </div>
      <div class="panel">
        <h2>snake_case</h2>
        <textarea v-model="snake" class="textarea" spellcheck="false" readonly />
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

.grid {
  margin-top: 28px;
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 18px;
}

.panel h2 {
  font-size: 14px;
  font-weight: 700;
  margin-bottom: 6px;
  color: #374151;
}

.textarea {
  width: 100%;
  min-height: 160px;
  padding: 10px 12px;
  border-radius: 10px;
  border: 1px solid #e5e7eb;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas,
    'Liberation Mono', 'Courier New', monospace;
  font-size: 13px;
  resize: vertical;
  box-sizing: border-box;
}

@media (max-width: 900px) {
  .grid {
    grid-template-columns: repeat(1, minmax(0, 1fr));
  }
}
</style>

