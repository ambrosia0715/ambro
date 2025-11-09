import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WaterBuddyPrivacyPage extends StatelessWidget {
  const WaterBuddyPrivacyPage({super.key});

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
                  onPressed: () => context.go('/apps/mate/water-buddy'),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('앱 정보로 돌아가기'),
                ),
                const SizedBox(height: 24),

                // Title
                const Text(
                  '물주기 알림_lite 개인정보 처리방침',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '최종 업데이트: 2025년 11월 9일',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 32),

                // 1. 수집하는 개인정보
                _SectionCard(
                  title: '1. 수집하는 개인정보',
                  children: [
                    const Text(
                      '물주기 알림_lite는 다음과 같은 정보를 수집하지 않습니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 12),
                    _BulletPoint(text: '개인 식별 정보 (이름, 이메일, 전화번호 등)'),
                    _BulletPoint(text: '위치 정보'),
                    _BulletPoint(text: '기기 고유 식별자'),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.offline_bolt,
                              color: Colors.green.shade700),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              '본 앱은 오프라인으로 작동하며, 모든 데이터는 사용자의 기기에만 저장됩니다.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 2. 데이터 저장
                _SectionCard(
                  title: '2. 데이터 저장',
                  children: [
                    const Text(
                      '로컬 저장',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _BulletPoint(
                        text: '식물 정보: 식물 이름, 사진, 물주기 주기, 마지막 물 준 날짜'),
                    _BulletPoint(text: '알림 설정: 알림 시간 및 활성화 상태'),
                    _BulletPoint(text: '앱 설정: 사용자 환경 설정'),
                    const SizedBox(height: 16),
                    Text(
                      '모든 데이터는 기기 내부 저장소에만 보관되며, 외부 서버로 전송되지 않습니다.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    const Text(
                      '데이터 백업',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _BulletPoint(text: '사용자가 직접 JSON 파일로 내보내기 가능'),
                    _BulletPoint(text: '백업 파일은 사용자가 선택한 위치에만 저장'),
                  ],
                ),
                const SizedBox(height: 24),

                // 3. 제3자 서비스
                _SectionCard(
                  title: '3. 제3자 서비스',
                  children: [
                    const Text(
                      'Google AdMob',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '본 앱은 광고 제공을 위해 Google AdMob을 사용합니다. AdMob은 광고 맞춤 설정을 위해 다음 정보를 수집할 수 있습니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 12),
                    _BulletPoint(text: '광고 ID'),
                    _BulletPoint(text: 'IP 주소'),
                    _BulletPoint(text: '기기 정보 (모델, OS 버전)'),
                    _BulletPoint(text: '앱 사용 통계'),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline,
                                  color: Colors.blue.shade700),
                              const SizedBox(width: 8),
                              Text(
                                'AdMob 개인정보 처리방침',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'https://policies.google.com/privacy',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '광고 맞춤 설정 해제 방법:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text:
                            'Android: 설정 > Google > 광고 > 광고 맞춤설정 선택 해제'),
                    _BulletPoint(
                        text: 'iOS: 설정 > 개인정보 보호 > 광고 > 광고 추적 제한'),
                  ],
                ),
                const SizedBox(height: 24),

                // 4. 권한 사용
                _SectionCard(
                  title: '4. 권한 사용',
                  children: [
                    const Text(
                      'Android 권한',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _PermissionItem(
                      permission: '알림 (POST_NOTIFICATIONS)',
                      purpose: '식물 물주기 알림 전송',
                    ),
                    _PermissionItem(
                      permission: '정확한 알람 (SCHEDULE_EXACT_ALARM)',
                      purpose: '정확한 시간에 알림 전송',
                    ),
                    _PermissionItem(
                      permission: '부팅 완료 수신 (RECEIVE_BOOT_COMPLETED)',
                      purpose: '기기 재시작 후 알림 재설정',
                    ),
                    _PermissionItem(
                      permission:
                          '배터리 최적화 무시 (REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)',
                      purpose: '알림 신뢰성 향상',
                    ),
                    _PermissionItem(
                      permission: '인터넷 (INTERNET)',
                      purpose: '광고 표시',
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    const Text(
                      'iOS 권한',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _PermissionItem(
                      permission: '알림',
                      purpose: '식물 물주기 알림 전송',
                    ),
                    _PermissionItem(
                      permission: '사진 라이브러리',
                      purpose: '식물 사진 선택 (선택사항)',
                    ),
                    _PermissionItem(
                      permission: '카메라',
                      purpose: '식물 사진 촬영 (선택사항)',
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.amber.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.security, color: Colors.amber.shade900),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              '모든 권한은 앱의 핵심 기능을 위해서만 사용됩니다.',
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
                  ],
                ),
                const SizedBox(height: 24),

                // 5. 데이터 보안
                _SectionCard(
                  title: '5. 데이터 보안',
                  children: [
                    _SecurityItem(
                      icon: Icons.phone_android,
                      text: '모든 데이터는 기기 내부에만 저장',
                    ),
                    _SecurityItem(
                      icon: Icons.cloud_off,
                      text: '외부 서버로 전송되지 않음',
                    ),
                    _SecurityItem(
                      icon: Icons.wifi,
                      text: '네트워크 통신은 광고 표시에만 사용',
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 6. 어린이 보호
                _SectionCard(
                  title: '6. 어린이 보호',
                  children: [
                    const Text(
                      '본 앱은 13세 미만 어린이를 대상으로 하지 않으며, 고의로 어린이의 개인정보를 수집하지 않습니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 7. 데이터 삭제
                _SectionCard(
                  title: '7. 데이터 삭제',
                  children: [
                    _BulletPoint(text: '앱 삭제 시 모든 데이터가 함께 삭제됩니다'),
                    _BulletPoint(text: '설정 메뉴에서 "전체 데이터 삭제" 가능'),
                  ],
                ),
                const SizedBox(height: 24),

                // 8. 개인정보 처리방침 변경
                _SectionCard(
                  title: '8. 개인정보 처리방침 변경',
                  children: [
                    const Text(
                      '본 개인정보 처리방침은 필요에 따라 업데이트될 수 있습니다. 중요한 변경사항이 있을 경우 앱 내 공지사항으로 알려드립니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 9. 문의
                _SectionCard(
                  title: '9. 문의',
                  children: [
                    const Text(
                      '개인정보 처리방침에 대한 문의사항이 있으시면 다음으로 연락해 주세요:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    _ContactItem(
                      icon: Icons.code,
                      label: 'GitHub',
                      value:
                          'https://github.com/ambrosia0715/plant-water-buddy-lite',
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
                          '최종 업데이트: 2025년 11월 9일',
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

class _PermissionItem extends StatelessWidget {
  final String permission;
  final String purpose;

  const _PermissionItem({
    required this.permission,
    required this.purpose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  permission,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  purpose,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
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

class _SecurityItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SecurityItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green.shade700, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.6),
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
