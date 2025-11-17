import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Pill Ping Lite 앱 개인정보처리방침 페이지
/// 앱에서 수집하는 개인정보와 처리 방침을 안내하는 페이지입니다.
class PillPingPrivacyPage extends StatelessWidget {
  const PillPingPrivacyPage({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 뒤로가기 버튼
                TextButton.icon(
                  onPressed: () => context.go('/apps/mate/pill-ping'),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('앱 정보로 돌아가기'),
                ),
                const SizedBox(height: 24),

                // 제목
                const Text(
                  'Pill Ping Lite 개인정보 처리방침',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '최종 수정일: 2024년',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 32),

                // 1. 수집하는 정보
                _SectionCard(
                  title: '1. 수집하는 정보',
                  children: [
                    const Text(
                      '1.1 사용자가 직접 입력하는 정보',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '앱 사용을 위해 다음 정보를 수집합니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '약 이름: 사용자가 입력한 약의 이름'),
                    _BulletPoint(
                        text:
                            '복용 시간 설정: 아침, 점심, 저녁 복용 여부 및 각 시간대의 시각(시, 분)'),
                    _BulletPoint(
                        text:
                            '복용 기록: 예정된 복용 시간, 실제 복용 시간, 복용 상태(예정/복용/미루기/누락)'),
                    const SizedBox(height: 16),
                    const Text(
                      '1.2 자동으로 수집되는 정보',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text: '기기 정보: 알림 발송을 위한 기기 식별자 (로컬에서만 사용)'),
                    _BulletPoint(
                        text: '알림 권한 상태: 알림 기능 작동을 위한 권한 상태'),
                    const SizedBox(height: 16),
                    const Text(
                      '1.3 광고 관련 정보',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Google AdMob: 광고 표시를 위해 Google AdMob을 사용합니다',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text:
                            'Google AdMob의 개인정보 처리방침: https://policies.google.com/privacy'),
                    _BulletPoint(
                        text:
                            'Google AdMob은 광고 표시를 위해 기기 정보, 광고 ID 등을 수집할 수 있습니다'),
                  ],
                ),
                const SizedBox(height: 24),

                // 2. 정보 수집 목적
                _SectionCard(
                  title: '2. 정보 수집 목적',
                  children: [
                    const Text(
                      '수집한 정보는 다음 목적으로만 사용됩니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 12),
                    _NumberedPoint(
                        number: '1',
                        text: '약 복용 알림 서비스 제공 - 설정한 시간에 알림 발송, 복용 기록 관리 및 표시'),
                    _NumberedPoint(
                        number: '2',
                        text: '앱 기능 개선 - 사용자 경험 향상, 버그 수정 및 기능 추가'),
                    _NumberedPoint(
                        number: '3',
                        text: '광고 표시 - 무료 앱 운영을 위한 광고 수익화, Google AdMob을 통한 광고 표시'),
                  ],
                ),
                const SizedBox(height: 24),

                // 3. 정보 보관 및 보안
                _SectionCard(
                  title: '3. 정보 보관 및 보안',
                  children: [
                    const Text(
                      '3.1 정보 보관 위치',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text: '모든 데이터는 사용자의 기기 내부 저장소에만 저장됩니다'),
                    _BulletPoint(
                        text: '클라우드나 외부 서버로 데이터가 전송되지 않습니다'),
                    _BulletPoint(
                        text:
                            '데이터는 기기의 앱 전용 저장 공간에 암호화되어 저장됩니다'),
                    const SizedBox(height: 12),
                    const Text(
                      '3.2 정보 보관 기간',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '앱을 사용하는 동안 데이터가 보관됩니다'),
                    _BulletPoint(text: '앱을 삭제하면 모든 데이터가 함께 삭제됩니다'),
                    _BulletPoint(text: '사용자가 직접 데이터를 삭제할 수 있습니다'),
                    const SizedBox(height: 12),
                    const Text(
                      '3.3 정보 보안',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text:
                            '데이터는 기기 내부에만 저장되므로 외부 유출 위험이 최소화됩니다'),
                    _BulletPoint(
                        text: 'Hive 데이터베이스를 사용하여 안전하게 저장됩니다'),
                    _BulletPoint(
                        text:
                            '인터넷 연결 없이도 앱의 모든 기능을 사용할 수 있습니다'),
                  ],
                ),
                const SizedBox(height: 24),

                // 4. 정보 공유 및 제공
                _SectionCard(
                  title: '4. 정보 공유 및 제공',
                  children: [
                    const Text(
                      '4.1 제3자 제공',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text:
                            '약 이름, 복용 시간, 복용 기록 등 사용자 입력 정보는 제3자에게 제공되지 않습니다'),
                    _BulletPoint(text: '외부 서버로 데이터를 전송하지 않습니다'),
                    const SizedBox(height: 12),
                    const Text(
                      '4.2 광고 서비스',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text: 'Google AdMob을 사용하여 광고를 표시합니다'),
                    _BulletPoint(
                        text:
                            'Google AdMob은 자체 개인정보 처리방침에 따라 정보를 수집할 수 있습니다'),
                    _BulletPoint(
                        text:
                            'Google AdMob 개인정보 처리방침: https://policies.google.com/privacy'),
                    const SizedBox(height: 12),
                    const Text(
                      '4.3 법적 요구사항',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text:
                            '법원의 명령이나 법적 절차에 따라 정보를 제공해야 하는 경우에만 제공됩니다'),
                  ],
                ),
                const SizedBox(height: 24),

                // 5. 사용자 권리
                _SectionCard(
                  title: '5. 사용자 권리',
                  children: [
                    const Text(
                      '5.1 데이터 접근',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text:
                            '앱 내에서 언제든지 저장된 약 정보와 복용 기록을 확인할 수 있습니다'),
                    const SizedBox(height: 12),
                    const Text(
                      '5.2 데이터 수정',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text: '앱 내에서 약 정보를 수정하거나 삭제할 수 있습니다'),
                    _BulletPoint(
                        text:
                            '복용 기록은 수정할 수 없으며, 복용 상태만 변경할 수 있습니다'),
                    const SizedBox(height: 12),
                    const Text(
                      '5.3 데이터 삭제',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text: '앱 내에서 개별 약 정보를 삭제할 수 있습니다'),
                    _BulletPoint(
                        text: '앱을 삭제하면 모든 데이터가 함께 삭제됩니다'),
                    const SizedBox(height: 12),
                    const Text(
                      '5.4 알림 권한 거부',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text:
                            '알림 권한을 거부할 수 있으나, 이 경우 알림 기능이 작동하지 않습니다'),
                    _BulletPoint(
                        text: '알림 권한은 설정에서 언제든지 변경할 수 있습니다'),
                  ],
                ),
                const SizedBox(height: 24),

                // 6. 광고 관련 개인정보
                _SectionCard(
                  title: '6. 광고 관련 개인정보',
                  children: [
                    const Text(
                      '6.1 Google AdMob',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '앱은 Google AdMob을 사용하여 광고를 표시합니다. Google AdMob은 광고 표시를 위해 다음 정보를 수집할 수 있습니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '기기 정보 (모델, OS 버전 등)'),
                    _BulletPoint(text: '광고 ID'),
                    _BulletPoint(text: 'IP 주소'),
                    _BulletPoint(text: '앱 사용 정보'),
                    const SizedBox(height: 12),
                    const Text(
                      '6.2 광고 개인화',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text: 'Google AdMob은 사용자에게 맞춤 광고를 표시할 수 있습니다'),
                    _BulletPoint(
                        text: '광고 개인화 설정은 기기 설정에서 변경할 수 있습니다'),
                    const SizedBox(height: 12),
                    const Text(
                      '6.3 광고 ID 재설정',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text: 'Android: 설정 > Google > 광고 > 광고 ID 재설정'),
                    _BulletPoint(
                        text:
                            'iOS: 설정 > 개인정보 보호 > Apple 광고 > 개인화된 광고 끄기'),
                  ],
                ),
                const SizedBox(height: 24),

                // 7. 아동의 개인정보 보호
                _SectionCard(
                  title: '7. 아동의 개인정보 보호',
                  children: [
                    _BulletPoint(
                        text: '이 앱은 13세 미만의 아동을 대상으로 하지 않습니다'),
                    _BulletPoint(
                        text:
                            '13세 미만의 아동이 사용하는 경우, 보호자의 동의가 필요합니다'),
                  ],
                ),
                const SizedBox(height: 24),

                // 8. 개인정보 처리방침 변경
                _SectionCard(
                  title: '8. 개인정보 처리방침 변경',
                  children: [
                    _BulletPoint(
                        text:
                            '개인정보 처리방침은 필요에 따라 변경될 수 있습니다'),
                    _BulletPoint(
                        text:
                            '중요한 변경사항이 있는 경우 앱 내 공지 또는 이메일로 알려드립니다'),
                    _BulletPoint(
                        text:
                            '변경된 개인정보 처리방침은 앱에 게시된 시점부터 효력이 발생합니다'),
                  ],
                ),
                const SizedBox(height: 24),

                // 9. 쿠키 및 추적 기술
                _SectionCard(
                  title: '9. 쿠키 및 추적 기술',
                  children: [
                    _BulletPoint(text: '앱 자체는 쿠키를 사용하지 않습니다'),
                    _BulletPoint(
                        text:
                            'Google AdMob은 쿠키 및 유사한 추적 기술을 사용할 수 있습니다'),
                    _BulletPoint(
                        text:
                            '자세한 내용은 Google AdMob 개인정보 처리방침을 참고하세요'),
                  ],
                ),
                const SizedBox(height: 24),

                // 10. 국제 사용자
                _SectionCard(
                  title: '10. 국제 사용자',
                  children: [
                    _BulletPoint(
                        text: '이 앱은 대한민국 법률에 따라 운영됩니다'),
                    _BulletPoint(
                        text:
                            '해외에서 사용하는 경우, 해당 국가의 법률도 적용될 수 있습니다'),
                  ],
                ),
                const SizedBox(height: 24),

                // 11. 연락처
                _SectionCard(
                  title: '11. 연락처',
                  children: [
                    const Text(
                      '개인정보 처리방침에 대한 질문이나 요청사항이 있으시면 아래로 연락해주세요.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    _ContactItem(
                      icon: Icons.email,
                      label: '이메일',
                      value: 'ambrosia0715@gmail.com',
                    ),
                    _ContactItem(
                      icon: Icons.code,
                      label: 'GitHub',
                      value: 'https://github.com/ambrosia0715/pillping',
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 12. 동의
                _SectionCard(
                  title: '12. 동의',
                  children: [
                    const Text(
                      '이 앱을 사용함으로써 사용자는 이 개인정보 처리방침에 동의하는 것으로 간주됩니다. 동의하지 않는 경우 앱을 사용하지 않을 수 있습니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 면책 조항
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.amber.shade900),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '중요: 이 앱은 약 복용을 알림하는 도구일 뿐이며, 실제 복용 여부를 보장하지 않습니다. 중요한 약물의 경우 의사나 약사의 지시를 따르시기 바랍니다.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.amber.shade900,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // 푸터
                Card(
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          '개발자: MinSeok Kang',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '앱 버전: 1.0.0 (Build 1)',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '최종 수정일: 2024년',
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

/// 섹션 카드 위젯
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

/// 불릿 포인트 위젯
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

/// 번호가 있는 포인트 위젯
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

/// 연락처 아이템 위젯
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
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
      ),
    );
  }
}

