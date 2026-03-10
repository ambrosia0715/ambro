<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: 'PILL PING lite 개인정보처리방침 - Ambro Apps',
  description:
    'Pill Ping Lite 개인정보 처리방침. 로컬 저장, AdMob 광고 수집 항목, 이용자 권리 등을 안내합니다.',
  ogTitle: 'PILL PING lite 개인정보처리방침 - Ambro Apps',
  ogDescription:
    'Pill Ping Lite 개인정보 처리방침. 로컬 저장, AdMob 광고 수집 항목, 이용자 권리 등을 안내합니다.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <NuxtLink to="/apps/mate/pill-ping" class="back">
      ← 앱 정보로 돌아가기
    </NuxtLink>

    <h1>Pill Ping Lite 개인정보 처리방침</h1>
    <p class="updated">최종 수정일: 2024년</p>

    <section class="section">
      <h2>1. 수집하는 정보</h2>
      <h3>1.1 사용자가 직접 입력하는 정보</h3>
      <p>앱 사용을 위해 다음 정보를 수집합니다:</p>
      <ul>
        <li>약 이름: 사용자가 입력한 약의 이름</li>
        <li>복용 시간 설정: 아침, 점심, 저녁 복용 여부 및 각 시간대의 시각(시, 분)</li>
        <li>
          복용 기록: 예정된 복용 시간, 실제 복용 시간, 복용 상태(예정/복용/미루기/누락)
        </li>
      </ul>
      <h3>1.2 자동으로 수집되는 정보</h3>
      <ul>
        <li>기기 정보: 알림 발송을 위한 기기 식별자 (로컬에서만 사용)</li>
        <li>알림 권한 상태: 알림 기능 작동을 위한 권한 상태</li>
      </ul>
      <h3>1.3 광고 관련 정보</h3>
      <p>Google AdMob: 광고 표시를 위해 Google AdMob을 사용합니다</p>
      <ul>
        <li>
          Google AdMob의 개인정보 처리방침:
          <a href="https://policies.google.com/privacy" target="_blank" rel="noopener noreferrer">
            https://policies.google.com/privacy
          </a>
        </li>
        <li>Google AdMob은 광고 표시를 위해 기기 정보, 광고 ID 등을 수집할 수 있습니다</li>
      </ul>
    </section>

    <section class="section">
      <h2>2. 정보 수집 목적</h2>
      <p>수집한 정보는 다음 목적으로만 사용됩니다:</p>
      <ol>
        <li>
          약 복용 알림 서비스 제공 - 설정한 시간에 알림 발송, 복용 기록 관리 및 표시
        </li>
        <li>앱 기능 개선 - 사용자 경험 향상, 버그 수정 및 기능 추가</li>
        <li>
          광고 표시 - 무료 앱 운영을 위한 광고 수익화, Google AdMob을 통한 광고 표시
        </li>
      </ol>
    </section>

    <section class="section">
      <h2>3. 정보 보관 및 보안</h2>
      <h3>3.1 정보 보관 위치</h3>
      <ul>
        <li>모든 데이터는 사용자의 기기 내부 저장소에만 저장됩니다</li>
        <li>클라우드나 외부 서버로 데이터가 전송되지 않습니다</li>
        <li>데이터는 기기의 앱 전용 저장 공간에 암호화되어 저장됩니다</li>
      </ul>
      <h3>3.2 정보 보관 기간</h3>
      <ul>
        <li>앱을 사용하는 동안 데이터가 보관됩니다</li>
        <li>앱을 삭제하면 모든 데이터가 함께 삭제됩니다</li>
        <li>사용자가 직접 데이터를 삭제할 수 있습니다</li>
      </ul>
      <h3>3.3 정보 보안</h3>
      <ul>
        <li>데이터는 기기 내부에만 저장되므로 외부 유출 위험이 최소화됩니다</li>
        <li>Hive 데이터베이스를 사용하여 안전하게 저장됩니다</li>
        <li>인터넷 연결 없이도 앱의 모든 기능을 사용할 수 있습니다</li>
      </ul>
    </section>

    <section class="section">
      <h2>4. 정보 공유 및 제공</h2>
      <h3>4.1 제3자 제공</h3>
      <ul>
        <li>약 이름, 복용 시간, 복용 기록 등 사용자 입력 정보는 제3자에게 제공되지 않습니다</li>
        <li>외부 서버로 데이터를 전송하지 않습니다</li>
      </ul>
      <h3>4.2 광고 서비스</h3>
      <ul>
        <li>Google AdMob을 사용하여 광고를 표시합니다</li>
        <li>Google AdMob은 자체 개인정보 처리방침에 따라 정보를 수집할 수 있습니다</li>
        <li>
          Google AdMob 개인정보 처리방침:
          <a href="https://policies.google.com/privacy" target="_blank" rel="noopener noreferrer">
            https://policies.google.com/privacy
          </a>
        </li>
      </ul>
      <h3>4.3 법적 요구사항</h3>
      <ul>
        <li>법원의 명령이나 법적 절차에 따라 정보를 제공해야 하는 경우에만 제공됩니다</li>
      </ul>
    </section>

    <section class="section">
      <h2>5. 사용자 권리</h2>
      <h3>5.1 데이터 접근</h3>
      <ul>
        <li>앱 내에서 언제든지 저장된 약 정보와 복용 기록을 확인할 수 있습니다</li>
      </ul>
      <h3>5.2 데이터 수정</h3>
      <ul>
        <li>앱 내에서 약 정보를 수정하거나 삭제할 수 있습니다</li>
        <li>복용 기록은 수정할 수 없으며, 복용 상태만 변경할 수 있습니다</li>
      </ul>
      <h3>5.3 데이터 삭제</h3>
      <ul>
        <li>앱 내에서 개별 약 정보를 삭제할 수 있습니다</li>
        <li>앱을 삭제하면 모든 데이터가 함께 삭제됩니다</li>
      </ul>
      <h3>5.4 알림 권한 거부</h3>
      <ul>
        <li>알림 권한을 거부할 수 있으나, 이 경우 알림 기능이 작동하지 않습니다</li>
        <li>알림 권한은 설정에서 언제든지 변경할 수 있습니다</li>
      </ul>
    </section>

    <section class="section">
      <h2>6. 광고 관련 개인정보</h2>
      <h3>6.1 Google AdMob</h3>
      <p>
        앱은 Google AdMob을 사용하여 광고를 표시합니다. Google AdMob은 광고 표시를 위해 다음 정보를
        수집할 수 있습니다:
      </p>
      <ul>
        <li>기기 정보 (모델, OS 버전 등)</li>
        <li>광고 ID</li>
        <li>IP 주소</li>
        <li>앱 사용 정보</li>
      </ul>
      <h3>6.2 광고 개인화</h3>
      <ul>
        <li>Google AdMob은 사용자에게 맞춤 광고를 표시할 수 있습니다</li>
        <li>광고 개인화 설정은 기기 설정에서 변경할 수 있습니다</li>
      </ul>
      <h3>6.3 광고 ID 재설정</h3>
      <ul>
        <li>Android: 설정 &gt; Google &gt; 광고 &gt; 광고 ID 재설정</li>
        <li>iOS: 설정 &gt; 개인정보 보호 &gt; Apple 광고 &gt; 개인화된 광고 끄기</li>
      </ul>
    </section>

    <section class="section">
      <h2>7. 아동의 개인정보 보호</h2>
      <ul>
        <li>이 앱은 13세 미만의 아동을 대상으로 하지 않습니다</li>
        <li>13세 미만의 아동이 사용하는 경우, 보호자의 동의가 필요합니다</li>
      </ul>
    </section>

    <section class="section">
      <h2>8. 개인정보 처리방침 변경</h2>
      <ul>
        <li>개인정보 처리방침은 필요에 따라 변경될 수 있습니다</li>
        <li>중요한 변경사항이 있는 경우 앱 내 공지 또는 이메일로 알려드립니다</li>
        <li>변경된 개인정보 처리방침은 앱에 게시된 시점부터 효력이 발생합니다</li>
      </ul>
    </section>

    <section class="section">
      <h2>9. 쿠키 및 추적 기술</h2>
      <ul>
        <li>앱 자체는 쿠키를 사용하지 않습니다</li>
        <li>Google AdMob은 쿠키 및 유사한 추적 기술을 사용할 수 있습니다</li>
        <li>자세한 내용은 Google AdMob 개인정보 처리방침을 참고하세요</li>
      </ul>
    </section>

    <section class="section">
      <h2>10. 국제 사용자</h2>
      <ul>
        <li>이 앱은 대한민국 법률에 따라 운영됩니다</li>
        <li>해외에서 사용하는 경우, 해당 국가의 법률도 적용될 수 있습니다</li>
      </ul>
    </section>

    <section class="section">
      <h2>11. 연락처</h2>
      <p>개인정보 처리방침에 대한 질문이나 요청사항이 있으시면 아래로 연락해주세요.</p>
      <ul>
        <li>이메일: ambrosia0715@gmail.com</li>
        <li>
          GitHub:
          <a href="https://github.com/ambrosia0715/pillping" target="_blank" rel="noopener noreferrer">
            https://github.com/ambrosia0715/pillping
          </a>
        </li>
      </ul>
    </section>

    <section class="section">
      <h2>12. 동의</h2>
      <p>
        이 앱을 사용함으로써 사용자는 이 개인정보 처리방침에 동의하는 것으로 간주됩니다. 동의하지 않는 경우 앱을 사용하지 않을 수 있습니다.
      </p>
    </section>

    <div class="callout amber">
      <p class="callout-text">
        중요: 이 앱은 약 복용을 알림하는 도구일 뿐이며, 실제 복용 여부를 보장하지 않습니다. 중요한 약물의 경우 의사나 약사의 지시를 따르시기 바랍니다.
      </p>
    </div>

    <section class="footer">
      <p>개발자: MinSeok Kang</p>
      <p>앱 버전: 1.0.0 (Build 1)</p>
      <p>최종 수정일: 2024년</p>
    </section>
  </div>
</template>

<style scoped>
.page-root {
  max-width: 900px;
  margin: 0 auto;
  font-size: 15px;
  line-height: 1.8;
}

.back {
  display: inline-block;
  margin-bottom: 16px;
  font-size: 14px;
  color: #2563eb;
  text-decoration: none;
}

h1 {
  font-size: 28px;
  font-weight: 800;
  margin-bottom: 8px;
}

.updated {
  color: #6b7280;
  margin-bottom: 24px;
}

.section {
  margin-top: 24px;
}

.section h2 {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 8px;
}

.section h3 {
  margin-top: 12px;
  margin-bottom: 8px;
  font-size: 16px;
  font-weight: 800;
  color: #212529;
}

ul {
  padding-left: 20px;
}

li {
  margin-bottom: 4px;
}

ol {
  padding-left: 20px;
}

a {
  color: #1976d2;
  text-decoration: none;
  font-weight: 700;
}

a:hover {
  text-decoration: underline;
}

.callout {
  margin-top: 12px;
  padding: 14px 14px;
  border-radius: 10px;
  border: 1px solid #e0e0e0;
  background: #f8f9fa;
}

.callout-text {
  margin: 0;
  font-size: 13px;
  line-height: 1.7;
}

.callout.amber {
  background: #fffbeb;
  border-color: #fde68a;
}

.footer {
  margin-top: 28px;
  padding: 16px;
  border-radius: 12px;
  background: #f8f9fa;
  border: 1px solid #e0e0e0;
  color: #6c757d;
  font-size: 14px;
}

.footer p {
  margin: 4px 0;
}
</style>

