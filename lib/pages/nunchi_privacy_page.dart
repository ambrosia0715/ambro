import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NunchiPrivacyPage extends StatelessWidget {
  const NunchiPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                TextButton.icon(
                  onPressed: () => context.go('/apps/play/nunchi-game'),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('앱 정보로 돌아가기'),
                ),
                const SizedBox(height: 24),

                // Title
                const Text(
                  '눈치게임 개인정보 처리방침',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '최종 업데이트: 2025년 11월 3일',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 32),

                // Intro
                _SectionCard(
                  title: '개인정보 처리방침',
                  children: [
                    Text(
                      'Ambro(이하 "회사")는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등 관련 법령에 따라 이용자의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 다음과 같이 개인정보처리방침을 수립·공개합니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Section 1
                _SectionCard(
                  title: '제1조 (개인정보의 수집 및 이용 목적)',
                  children: [
                    const Text(
                      '회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    _NumberedPoint(number: '1', text: '회원 가입 및 관리'),
                    _NumberedPoint(number: '2', text: '서비스 제공 및 개선'),
                    _NumberedPoint(number: '3', text: '고객 문의 및 불만 처리'),
                  ],
                ),
                const SizedBox(height: 24),

                // Section 2
                _SectionCard(
                  title: '제2조 (수집하는 개인정보의 항목)',
                  children: [
                    const Text(
                      '회사는 서비스 제공을 위해 필요한 최소한의 개인정보를 수집합니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    _BulletPoint(text: '필수항목: 닉네임, 기기 식별 정보'),
                    _BulletPoint(text: '선택항목: 위치 정보(서비스 이용 시)'),
                    _BulletPoint(
                        text: '자동 수집 항목: 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보'),
                  ],
                ),
                const SizedBox(height: 24),

                // Section 3
                _SectionCard(
                  title: '제3조 (개인정보의 보유 및 이용기간)',
                  children: [
                    Text(
                      '회사는 법령에 따른 개인정보 보유·이용기간 또는 이용자로부터 개인정보를 수집 시 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _BulletPoint(
                        text:
                            '회원 탈퇴 시까지 (단, 관계 법령 위반에 따른 수사·조사 등이 진행 중인 경우에는 해당 수사·조사 종료 시까지)'),
                  ],
                ),
                const SizedBox(height: 24),

                // Section 4
                _SectionCard(
                  title: '제4조 (개인정보의 제3자 제공)',
                  children: [
                    Text(
                      '회사는 이용자의 개인정보를 제1조(개인정보의 수집 및 이용 목적)에서 명시한 범위 내에서만 처리하며, 이용자의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Section 5
                _SectionCard(
                  title: '제5조 (이용자의 권리·의무 및 행사방법)',
                  children: [
                    const Text(
                      '이용자는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    _NumberedPoint(number: '1', text: '개인정보 열람 요구'),
                    _NumberedPoint(number: '2', text: '오류 등이 있을 경우 정정 요구'),
                    _NumberedPoint(number: '3', text: '삭제 요구'),
                    _NumberedPoint(number: '4', text: '처리정지 요구'),
                  ],
                ),
                const SizedBox(height: 24),

                // Section 6
                _SectionCard(
                  title: '제6조 (개인정보의 파기)',
                  children: [
                    Text(
                      '회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Section 7
                _SectionCard(
                  title: '제7조 (개인정보 보호책임자)',
                  children: [
                    const Text(
                      '회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 이용자의 불만처리 및 피해구제를 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    _ContactItem(
                      icon: Icons.email,
                      label: '이메일',
                      value: 'ambrosia0715.ambro@gmail.com',
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Section 8
                _SectionCard(
                  title: '제8조 (개인정보 처리방침 변경)',
                  children: [
                    Text(
                      '이 개인정보처리방침은 2025년 11월 3일부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Footer
                Card(
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          '개발자: Ambrosia',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '앱 버전: 1.0.0',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '최종 업데이트: 2025년 11월 3일',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NumberedPoint extends StatelessWidget {
  final String number;
  final String text;

  const _NumberedPoint({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.6,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
