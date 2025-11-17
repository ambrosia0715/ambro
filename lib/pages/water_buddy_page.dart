import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class WaterBuddyPage extends StatelessWidget {
  const WaterBuddyPage({super.key});

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
                  onPressed: () => context.go('/apps'),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('앱 목록으로 돌아가기'),
                ),
                const SizedBox(height: 24),

                // App Header
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              'assets/images/water_buddy_logo.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2E7D32),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Icon(
                                    Icons.water_drop,
                                    size: 64,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '물주기 알림_lite',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '식물마다 주기를 설정하면 날짜에 맞춰 알려드려요!',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  _CategoryChip(label: '라이프스타일'),
                                  _CategoryChip(label: '생산성'),
                                  _CategoryChip(label: '무료'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Description
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '🌱 물주기 알림_lite - 식물 관리가 쉬워집니다!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '식물을 사랑하지만 물주는 날짜를 자주 잊으시나요?\n물주기 알림_lite가 여러분의 식물 친구들을 건강하게 지켜드립니다!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Features
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '주요 기능',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        _FeatureItem(
                          icon: Icons.notifications_active,
                          iconColor: const Color(0xFF2E7D32),
                          title: '맞춤형 물주기 알림',
                          description:
                              '각 식물마다 다른 물주기 주기를 설정하고, 원하는 시간에 정확한 알림을 받으세요. D-day 카운터로 한눈에 확인할 수 있습니다.',
                        ),
                        const SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.eco,
                          iconColor: const Color(0xFF66BB6A),
                          title: '간편한 식물 관리',
                          description:
                              '식물 사진을 추가하여 시각적으로 관리하고, 마지막 물 준 날짜가 자동으로 기록됩니다. "물 줬어요" 버튼으로 간편하게 업데이트하세요.',
                        ),
                        const SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.backup,
                          iconColor: const Color(0xFF4CAF50),
                          title: '데이터 백업 & 복구',
                          description:
                              'JSON 파일로 데이터를 내보내고, 기기 변경 시 쉽게 데이터를 이전할 수 있습니다. 모든 데이터는 기기에만 저장되어 개인정보가 안전합니다.',
                        ),
                        const SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.palette,
                          iconColor: const Color(0xFF81C784),
                          title: '깔끔한 디자인',
                          description:
                              '직관적인 사용자 인터페이스와 Material 3 디자인으로 누구나 쉽게 사용할 수 있습니다.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Target Users
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '이런 분들께 추천해요',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _BulletPoint(
                            text: '식물을 키우지만 물주는 날을 자주 잊는 분'),
                        _BulletPoint(text: '여러 종류의 식물을 관리하는 분'),
                        _BulletPoint(text: '식물 초보자부터 전문가까지'),
                        _BulletPoint(text: '간단하고 가벼운 앱을 선호하는 분'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Highlights
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '특징',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _HighlightChip(icon: Icons.money_off, label: '완전 무료'),
                            _HighlightChip(
                                icon: Icons.offline_bolt, label: '오프라인 작동'),
                            _HighlightChip(icon: Icons.security, label: '개인정보 수집 없음'),
                            _HighlightChip(icon: Icons.language, label: '한국어 지원'),
                            _HighlightChip(icon: Icons.flash_on, label: '가볍고 빠름'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // App Info
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '앱 정보',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _InfoRow(label: '개발자', value: 'Ambrosia'),
                        _InfoRow(label: '버전', value: '1.0.0'),
                        _InfoRow(label: '카테고리', value: '라이프스타일, 생산성'),
                        _InfoRow(label: '연령 등급', value: '전체 이용가'),
                        _InfoRow(label: '가격', value: '무료 (광고 포함)'),
                        const SizedBox(height: 16),
                        TextButton.icon(
                          onPressed: () => context.go('/privacy/water-buddy'),
                          icon: const Icon(Icons.privacy_tip),
                          label: const Text('개인정보 처리방침 보기'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Download Section
                Card(
                  color: const Color(0xFF2E7D32),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        const Text(
                          '지금 다운로드하고\n여러분의 식물 친구들을 건강하게 키워보세요! 🌱',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          alignment: WrapAlignment.center,
                          children: [
                            _DownloadButton(
                              label: 'Google Play',
                              icon: Icons.android,
                              onPressed: () {
                                // TODO: Add Google Play Store link
                              },
                            ),
                            _DownloadButton(
                              label: 'App Store',
                              icon: Icons.apple,
                              onPressed: () => _launchURL(
                                'https://apps.apple.com/us/app/%EB%AC%BC%EC%A3%BC%EA%B8%B0-%EC%95%8C%EB%A6%BC-lite/id6755084030',
                              ),
                            ),
                          ],
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

  Future<void> _launchURL(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;

  const _CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
      labelStyle: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('✅  ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HighlightChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HighlightChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18, color: const Color(0xFF2E7D32)),
      label: Text(label),
      backgroundColor: const Color(0xFF2E7D32).withOpacity(0.1),
      labelStyle: const TextStyle(
        color: Color(0xFF2E7D32),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DownloadButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const _DownloadButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF2E7D32),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
