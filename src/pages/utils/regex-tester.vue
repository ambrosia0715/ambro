<script setup lang="ts">
import { computed, ref } from 'vue'
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: 'Regex Tester - Ambro Tech Blog',
  description: '정규표현식을 실시간으로 테스트하고 매칭 결과를 확인하는 도구',
  ogTitle: 'Regex Tester - Ambro Tech Blog',
  ogDescription: '정규표현식을 실시간으로 테스트하고 매칭 결과를 확인하는 도구',
  ogType: 'website'
})

const pattern = ref('')
const flags = ref('g')
const text = ref('')
const error = ref('')

const matches = computed(() => {
  error.value = ''
  if (!pattern.value || !text.value) return []
  try {
    const re = new RegExp(pattern.value, flags.value)
    const result: { value: string; start: number; end: number }[] = []
    let m: RegExpExecArray | null
    const t = text.value
    while ((m = re.exec(t)) !== null) {
      result.push({ value: m[0], start: m.index, end: m.index + m[0].length })
      if (!re.global) break
    }
    return result
  } catch (e: any) {
    error.value = e?.message ?? '정규식을 파싱할 수 없습니다.'
    return []
  }
})
</script>

<template>
  <div class="page-root">
    <header class="header">
      <h1>Regex Tester</h1>
      <p class="lead">
        정규표현식(Regular Expression)을 입력하고 테스트 문자열과 비교해 매칭 결과를 확인해 보세요.
      </p>
      <div class="tip">
        <p class="tip-title">💡 사용법</p>
        <p>• Pattern: 정규표현식을 입력합니다. (예: ^[a-zA-Z0-9]+@).</p>
        <p>• Flags: g, i, m, s 등 JS 정규식 플래그를 조합해서 사용할 수 있습니다.</p>
      </div>
    </header>

    <section class="form">
      <label class="field">
        <span>Pattern</span>
        <input v-model="pattern" class="input" placeholder="예: \\d{3}-\\d{4}" />
      </label>
      <label class="field small">
        <span>Flags</span>
        <input v-model="flags" class="input" placeholder="gim" />
      </label>
    </section>

    <section class="grid">
      <div class="panel">
        <h2>테스트 문자열 (Test String)</h2>
        <textarea
          v-model="text"
          class="textarea"
          spellcheck="false"
          placeholder="테스트할 텍스트를 입력하세요..."
        />
      </div>
      <div class="panel">
        <h2>매칭 결과 (Matches)</h2>
        <p v-if="error" class="error">
          {{ error }}
        </p>
        <p v-else-if="!matches.length" class="empty">
          매칭된 결과가 없습니다.
        </p>
        <ul v-else class="list">
          <li v-for="(m, idx) in matches" :key="idx">
            <code>{{ m.value }}</code>
            <span>@ [{{ m.start }}, {{ m.end }}]</span>
          </li>
        </ul>
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

.form {
  margin-top: 24px;
  display: flex;
  gap: 12px;
}

.field {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.field.small {
  max-width: 120px;
}

.field span {
  font-size: 13px;
  color: #4b5563;
}

.input {
  border-radius: 999px;
  border: 1px solid #e5e7eb;
  padding: 6px 10px;
  font-size: 13px;
}

.grid {
  margin-top: 20px;
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
  min-height: 220px;
  padding: 10px 12px;
  border-radius: 10px;
  border: 1px solid #e5e7eb;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas,
    'Liberation Mono', 'Courier New', monospace;
  font-size: 13px;
  resize: vertical;
  box-sizing: border-box;
}

.list {
  list-style: none;
  padding: 0;
  margin: 0;
  font-size: 13px;
}

.list li {
  display: flex;
  gap: 8px;
  padding: 4px 0;
}

.list code {
  background: #f3f4f6;
  padding: 2px 6px;
  border-radius: 4px;
}

.list span {
  color: #6b7280;
}

.error {
  font-size: 13px;
  color: #b91c1c;
}

.empty {
  font-size: 13px;
  color: #6b7280;
}

@media (max-width: 900px) {
  .grid {
    grid-template-columns: repeat(1, minmax(0, 1fr));
  }
}
</style>

