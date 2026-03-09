<script setup lang="ts">
import { ref } from 'vue'
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '문의하기 - Ambro Tech Blog',
  description: '앱 관련 문의 이메일: ambrosia0715.ambro@gmail.com',
  ogTitle: '문의하기 - Ambro Tech Blog',
  ogDescription: '앱 관련 문의 이메일: ambrosia0715.ambro@gmail.com',
  ogType: 'website'
})

const email = 'ambrosia0715.ambro@gmail.com'
const copied = ref(false)

const copyEmail = async () => {
  try {
    await navigator.clipboard.writeText(email)
    copied.value = true
    setTimeout(() => {
      copied.value = false
    }, 2000)
  } catch {
    copied.value = false
  }
}
</script>

<template>
  <div class="page-root">
    <h1>문의하기</h1>
    <p class="lead">앱 관련 문의는 이메일로 연락해주세요.</p>

    <section class="card">
      <div class="icon">✉️</div>
      <p class="text">
        앱 관련 문의는 아래 이메일 주소로 연락해 주세요.
      </p>
      <div class="email-box">
        <span class="email">{{ email }}</span>
      </div>
      <button type="button" class="btn" @click="copyEmail">
        이메일 복사
      </button>
      <p v-if="copied" class="copied">이메일 주소가 복사되었습니다.</p>
    </section>
  </div>
</template>

<style scoped>
.page-root {
  max-width: 600px;
  margin: 0 auto;
}

h1 {
  font-size: 32px;
  font-weight: 800;
  margin-bottom: 8px;
}

.lead {
  font-size: 16px;
  color: #6b7280;
  margin-bottom: 32px;
}

.card {
  padding: 32px;
  border-radius: 16px;
  border: 1px solid #e5e7eb;
  background: #ffffff;
  text-align: left;
}

.icon {
  font-size: 32px;
}

.text {
  margin-top: 20px;
  font-size: 16px;
  color: #4b5563;
}

.email-box {
  margin-top: 20px;
  padding: 14px 16px;
  border-radius: 10px;
  background: #f8f9fa;
  border: 1px solid #e5e7eb;
}

.email {
  font-size: 18px;
  font-weight: 600;
  color: #111827;
}

.btn {
  margin-top: 20px;
  padding: 12px 18px;
  border-radius: 8px;
  border: none;
  background: #6200ee;
  color: #ffffff;
  font-size: 15px;
  font-weight: 600;
  cursor: pointer;
}

.btn:hover {
  opacity: 0.95;
}

.copied {
  margin-top: 10px;
  font-size: 13px;
  color: #16a34a;
}
</style>

