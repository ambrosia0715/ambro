import 'package:flutter/material.dart';

class NunchiPrivacyPage extends StatelessWidget {
  const NunchiPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Card(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('뒤로가기'),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      '개인정보처리방침',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Ambro(이하 "회사")는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등 관련 법령에 따라 이용자의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 다음과 같이 개인정보처리방침을 수립·공개합니다.\n\n제1조 (개인정보의 수집 및 이용 목적)\n회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.\n1. 회원 가입 및 관리\n2. 서비스 제공 및 개선\n3. 고객 문의 및 불만 처리\n\n제2조 (수집하는 개인정보의 항목)\n회사는 서비스 제공을 위해 필요한 최소한의 개인정보를 수집합니다.\n- 필수항목: 닉네임, 기기 식별 정보\n- 선택항목: 위치 정보(서비스 이용 시)\n- 자동 수집 항목: 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보\n\n제3조 (개인정보의 보유 및 이용기간)\n회사는 법령에 따른 개인정보 보유·이용기간 또는 이용자로부터 개인정보를 수집 시 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.\n- 회원 탈퇴 시까지 (단, 관계 법령 위반에 따른 수사·조사 등이 진행 중인 경우에는 해당 수사·조사 종료 시까지)\n\n제4조 (개인정보의 제3자 제공)\n회사는 이용자의 개인정보를 제1조(개인정보의 수집 및 이용 목적)에서 명시한 범위 내에서만 처리하며, 이용자의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.\n\n제5조 (이용자의 권리·의무 및 행사방법)\n이용자는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.\n1. 개인정보 열람 요구\n2. 오류 등이 있을 경우 정정 요구\n3. 삭제 요구\n4. 처리정지 요구\n\n제6조 (개인정보의 파기)\n회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.\n\n제7조 (개인정보 보호책임자)\n회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 이용자의 불만처리 및 피해구제를 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.\n- 이메일: ambrosia0715.ambro@gmail.com\n\n제8조 (개인정보 처리방침 변경)\n이 개인정보처리방침은 2025년 11월 3일부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade800,
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
