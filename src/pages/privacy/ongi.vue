<script setup lang="ts">
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: '온기 개인정보처리방침 - Ambro Apps',
  description:
    '온기(Ongi) 개인정보처리방침. Firebase/OpenAI/AdMob 제공 항목, 보유 기간, 이용자 권리 등을 안내합니다.',
  ogTitle: '온기 개인정보처리방침 - Ambro Apps',
  ogDescription:
    '온기(Ongi) 개인정보처리방침. Firebase/OpenAI/AdMob 제공 항목, 보유 기간, 이용자 권리 등을 안내합니다.',
  ogType: 'website'
})
</script>

<template>
  <div class="page-root">
    <NuxtLink to="/apps/aicent/ongi" class="back">
      ← 앱 정보로 돌아가기
    </NuxtLink>

    <h1>온기 (Ongi) 개인정보처리방침</h1>
    <p class="updated">최종 업데이트: 2025년 11월 17일</p>
    <p class="updated">시행일: 2025년 11월 17일</p>

    <section class="section">
      <h2>1. 개인정보처리방침의 의의</h2>
      <p>
        온기(Ongi, 이하 &quot;본 앱&quot;)는 이용자의 개인정보를 소중하게 생각하며, 「개인정보 보호법」 및 관련
        법령을 준수하여 이용자의 개인정보를 보호하기 위해 최선을 다하고 있습니다.
      </p>
      <p>
        본 개인정보처리방침은 본 앱이 제공하는 서비스 이용 시 수집되는 개인정보의 항목, 수집 및 이용 목적,
        보유 및 이용 기간, 개인정보의 제3자 제공, 이용자의 권리 및 행사 방법 등을 안내합니다.
      </p>
    </section>

    <section class="section">
      <h2>2. 수집하는 개인정보의 항목 및 수집 방법</h2>
      <h3>2.1 수집하는 개인정보 항목</h3>
      <h4>필수 수집 항목</h4>
      <ul>
        <li>인증 정보</li>
        <li> - 이메일 주소 (이메일 회원가입 시)</li>
        <li> - 비밀번호 (Firebase Authentication에서 암호화하여 저장)</li>
        <li> - Google 계정 정보 (Google 로그인 시): 이메일, 이름, 프로필 사진 URL</li>
      </ul>
      <ul>
        <li>일기 데이터</li>
        <li> - 작성한 일기 내용 (감정, 목표, 할 일, 마음 한 줄)</li>
        <li> - AI 코멘트</li>
        <li> - 작성 일시 및 수정 일시</li>
      </ul>
      <ul>
        <li>사용자 프로필 정보</li>
        <li> - 프리미엄 구독 여부</li>
        <li> - AI 사용 횟수 및 마지막 사용 일자</li>
        <li> - 계정 생성 일시</li>
      </ul>
      <h4>자동 수집 항목</h4>
      <ul>
        <li>기기 정보</li>
        <li> - 기기 모델, 운영체제 버전, 고유 식별자 (디바이스 ID)</li>
        <li> - 앱 버전 정보</li>
      </ul>
      <ul>
        <li>서비스 이용 정보</li>
        <li> - 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보</li>
      </ul>

      <h3>2.2 수집 방법</h3>
      <ul>
        <li>앱 내 회원가입 및 로그인 과정에서 직접 입력</li>
        <li>Google 로그인을 통한 자동 수집</li>
        <li>서비스 이용 과정에서 자동 생성 및 수집</li>
      </ul>
    </section>

    <section class="section">
      <h2>3. 개인정보의 수집 및 이용 목적</h2>
      <p>본 앱은 다음의 목적을 위해 개인정보를 수집 및 이용합니다:</p>
      <h3>3.1 서비스 제공</h3>
      <ul>
        <li>회원 가입 및 관리, 본인 확인</li>
        <li>일기 작성, 저장, 조회 서비스 제공</li>
        <li>AI 코멘트 생성 서비스 제공</li>
        <li>일기 히스토리 및 통계 서비스 제공</li>
        <li>데이터 백업 및 복원 서비스 제공</li>
      </ul>
      <h3>3.2 서비스 개선</h3>
      <ul>
        <li>서비스 품질 향상 및 신규 서비스 개발</li>
        <li>이용 통계 분석 및 서비스 개선</li>
        <li>오류 및 버그 수정</li>
      </ul>
      <h3>3.3 마케팅 및 광고</h3>
      <ul>
        <li>맞춤형 광고 제공 (Google AdMob)</li>
        <li>서비스 관련 안내 및 공지사항 전달</li>
      </ul>
    </section>

    <section class="section">
      <h2>4. 개인정보의 보유 및 이용 기간</h2>
      <h3>4.1 보유 기간</h3>
      <ul>
        <li>
          회원 정보: 회원 탈퇴 시까지 (단, 관련 법령에 따라 일정 기간 보관 필요 시 해당 기간 동안 보관)
        </li>
        <li>일기 데이터: 회원 탈퇴 시까지 (이용자가 삭제 요청 시 즉시 삭제)</li>
        <li>로그 정보: 최대 1년</li>
      </ul>
      <h3>4.2 법령에 따른 보관</h3>
      <ul>
        <li>계약 또는 청약철회 등에 관한 기록: 5년</li>
        <li>대금결제 및 재화 등의 공급에 관한 기록: 5년</li>
        <li>소비자의 불만 또는 분쟁처리에 관한 기록: 3년</li>
        <li>웹사이트 방문 기록: 3개월</li>
      </ul>
    </section>

    <section class="section">
      <h2>5. 개인정보의 제3자 제공</h2>
      <p>
        본 앱은 원칙적으로 이용자의 개인정보를 외부에 제공하지 않습니다. 다만, 다음의 경우에는 예외로 합니다:
      </p>
      <h3>5.1 서비스 제공을 위한 제3자 제공</h3>
      <ul>
        <li><strong>Firebase (Google)</strong></li>
        <li> - 제공 항목: 이메일, 일기 데이터, 사용자 프로필 정보</li>
        <li> - 이용 목적: 사용자 인증, 데이터 저장 및 동기화, 서비스 분석</li>
        <li> - 보유 기간: 회원 탈퇴 시까지</li>
      </ul>
      <ul>
        <li><strong>OpenAI</strong></li>
        <li> - 제공 항목: 일기 내용 (감정, 목표, 할 일, 마음 한 줄)</li>
        <li> - 이용 목적: AI 코멘트 생성</li>
        <li> - 보유 기간: AI 코멘트 생성 후 즉시 삭제 (저장하지 않음)</li>
      </ul>
      <ul>
        <li><strong>Google AdMob</strong></li>
        <li> - 제공 항목: 기기 정보, 광고 식별자</li>
        <li> - 이용 목적: 맞춤형 광고 제공</li>
        <li> - 보유 기간: 광고 제공 시까지</li>
      </ul>
      <h3>5.2 법령에 의한 제공</h3>
      <ul>
        <li>법령에 의해 수사기관의 요청이 있는 경우</li>
        <li>법원의 영장이 발부된 경우</li>
        <li>기타 법령에 의해 요구되는 경우</li>
      </ul>
    </section>

    <section class="section">
      <h2>6. 개인정보의 처리 위탁</h2>
      <p>본 앱은 서비스 제공을 위해 다음 업체에 개인정보 처리 업무를 위탁하고 있습니다:</p>
      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <th>위탁 업체</th>
              <th>위탁 업무 내용</th>
              <th>보유 및 이용 기간</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Google (Firebase)</td>
              <td>사용자 인증, 데이터 저장 및 관리</td>
              <td>회원 탈퇴 시까지</td>
            </tr>
            <tr>
              <td>Google (AdMob)</td>
              <td>광고 서비스 제공</td>
              <td>광고 제공 시까지</td>
            </tr>
            <tr>
              <td>OpenAI</td>
              <td>AI 코멘트 생성</td>
              <td>서비스 제공 시까지</td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>

    <section class="section">
      <h2>7. 이용자의 권리 및 행사 방법</h2>
      <h3>7.1 이용자의 권리</h3>
      <p>이용자는 다음의 권리를 행사할 수 있습니다:</p>
      <ul>
        <li>개인정보 열람 요구</li>
        <li>개인정보 정정·삭제 요구</li>
        <li>개인정보 처리정지 요구</li>
        <li>개인정보의 수집·이용·제공에 대한 동의 철회</li>
      </ul>
      <h3>7.2 권리 행사 방법</h3>
      <ul>
        <li>앱 내 설정 메뉴를 통해 문의</li>
        <li>이메일을 통한 요청</li>
      </ul>
      <p class="note">
        개인정보 열람, 정정, 삭제, 처리정지 요구는 「개인정보 보호법」 시행령 제41조 제1항에 따라 서면, 전자우편,
        모사전송(FAX) 등을 통하여 하실 수 있습니다.
      </p>
      <h3>7.3 권리 행사 제한</h3>
      <ul>
        <li>법령에 특별한 규정이 있는 경우</li>
        <li>다른 사람의 생명·신체를 해할 우려가 있는 경우</li>
        <li>다른 사람의 재산과 이익을 부당하게 침해할 우려가 있는 경우</li>
        <li>공공기관이 법령 등에서 정하는 소관 업무의 수행을 위하여 불가피한 경우</li>
      </ul>
    </section>

    <section class="section">
      <h2>8. 개인정보의 파기</h2>
      <h3>8.1 파기 절차</h3>
      <p>
        이용자가 회원 탈퇴를 요청하거나 개인정보 보유기간이 경과한 경우, 다음의 절차와 방법으로 개인정보를 파기합니다:
      </p>
      <ol>
        <li>파기 대상: 수집·이용 목적이 달성된 개인정보</li>
        <li>파기 시점: 회원 탈퇴 요청 시 또는 보유기간 경과 시</li>
        <li>파기 방법: 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제</li>
      </ol>
      <h3>8.2 파기 예외</h3>
      <ul>
        <li>관련 법령에 따라 보관이 필요한 경우</li>
        <li>분쟁 해결을 위해 필요한 경우</li>
      </ul>
    </section>

    <section class="section">
      <h2>9. 개인정보 보호책임자</h2>
      <p>본 앱은 이용자의 개인정보 보호를 위해 다음과 같이 개인정보 보호책임자를 지정하고 있습니다:</p>
      <ul>
        <li><strong>책임자</strong>: Ambro (엠브로)</li>
        <li><strong>연락처</strong>: 앱 내 설정 메뉴를 통해 문의</li>
      </ul>
    </section>

    <section class="section">
      <h2>10. 개인정보의 안전성 확보 조치</h2>
      <p>본 앱은 이용자의 개인정보를 안전하게 보호하기 위해 다음과 같은 조치를 취하고 있습니다:</p>
      <h3>10.1 기술적 조치</h3>
      <ul>
        <li>개인정보를 암호화하여 저장 및 전송</li>
        <li>Firebase의 보안 기능을 활용한 데이터 보호</li>
        <li>정기적인 보안 점검 및 취약점 분석</li>
      </ul>
      <h3>10.2 관리적 조치</h3>
      <ul>
        <li>개인정보 처리에 대한 접근 권한 관리</li>
        <li>개인정보 처리 담당자의 최소화 및 교육</li>
      </ul>
      <h3>10.3 물리적 조치</h3>
      <ul>
        <li>서버 및 데이터베이스의 물리적 보안 관리</li>
      </ul>
    </section>

    <section class="section">
      <h2>11. 쿠키 및 광고 식별자</h2>
      <h3>11.1 쿠키</h3>
      <p>
        본 앱은 서비스 제공을 위해 쿠키를 사용할 수 있습니다. 쿠키는 웹사이트 방문 시 자동으로 생성되어 기기에 저장되는 작은 텍스트 파일입니다.
      </p>
      <h3>11.2 광고 식별자</h3>
      <ul>
        <li>Android: Google Advertising ID</li>
        <li>iOS: Identifier for Advertisers (IDFA)</li>
      </ul>
      <p>광고 식별자는 맞춤형 광고 제공을 위해 사용되며, 기기 설정에서 광고 추적을 제한할 수 있습니다.</p>
    </section>

    <section class="section">
      <h2>12. 개인정보처리방침의 변경</h2>
      <p>
        본 개인정보처리방침은 법령, 정책 또는 보안기술의 변경에 따라 내용의 추가, 삭제 및 수정이 있을 수 있습니다.
        변경 사항은 앱 내 공지사항을 통해 안내하며, 중요한 변경 사항의 경우 별도의 고지 절차를 거칠 수 있습니다.
      </p>
      <h3>변경 이력</h3>
      <ul>
        <li>2025년 11월 17일: 최초 작성</li>
      </ul>
    </section>

    <section class="section">
      <h2>13. 이용자 및 법정대리인의 권리와 그 행사 방법</h2>
      <h3>13.1 만 14세 미만 아동의 개인정보</h3>
      <p>본 앱은 만 14세 미만 아동의 개인정보를 수집하지 않습니다.</p>
      <h3>13.2 법정대리인의 권리</h3>
      <p>만 14세 미만 아동의 법정대리인은 아동의 개인정보 열람, 정정, 삭제, 처리정지를 요구할 수 있습니다.</p>
    </section>

    <section class="section">
      <h2>14. 개인정보 보호 관련 문의</h2>
      <p>개인정보 보호와 관련하여 문의사항이 있으시면 앱 내 설정 메뉴를 통해 문의해주시기 바랍니다.</p>
    </section>

    <section class="footer">
      <p>개발자: Ambro (엠브로)</p>
      <p>앱 버전: 1.0.0</p>
      <p>최종 업데이트: 2025년 11월 17일</p>
      <p><strong>본 개인정보처리방침은 2025년 11월 17일부터 시행됩니다.</strong></p>
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

.section h4 {
  margin-top: 10px;
  margin-bottom: 6px;
  font-size: 14px;
  font-weight: 800;
  color: #343a40;
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

.note {
  margin-top: 8px;
  font-size: 13px;
  color: #6c757d;
  font-style: italic;
}

.table-wrap {
  margin-top: 12px;
  overflow-x: auto;
  border: 1px solid #e0e0e0;
  border-radius: 10px;
}

table {
  width: 100%;
  border-collapse: collapse;
  min-width: 560px;
}

th,
td {
  border-bottom: 1px solid #e0e0e0;
  padding: 10px 12px;
  vertical-align: top;
  font-size: 14px;
}

thead th {
  background: #f5f5f5;
  font-weight: 800;
}

tbody tr:last-child td {
  border-bottom: none;
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

