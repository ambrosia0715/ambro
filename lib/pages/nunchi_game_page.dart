import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class NunchiGamePage extends StatelessWidget {
  const NunchiGamePage({super.key});

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
                              'assets/images/game_guessing_logo.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Icon(
                                    Icons.gamepad,
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
                                '눈치게임',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '친구들과 함께 즐기는 숫자 맞추기 게임',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: const [
                                  _CategoryChip(label: '게임'),
                                  _CategoryChip(label: '파티게임'),
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
                          '🎮 눈치게임 - 친구들과 함께 즐기는 재미!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '상대의 눈치를 보며 1부터 차례대로 숫자를 외쳐보세요!\n'
                          '중복되지 않고 마지막 숫자를 외치는 사람이 승리합니다.',
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
                      children: const [
                        Text(
                          '주요 기능',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 24),
                        _FeatureItem(
                          icon: Icons.people,
                          iconColor: Colors.blue,
                          title: '멀티플레이어',
                          description: '친구들과 함께 즐기는 실시간 멀티플레이어 게임',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.psychology,
                          iconColor: Colors.purple,
                          title: '심리전',
                          description: '상대의 눈치를 살피며 최적의 타이밍을 찾아보세요',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.celebration,
                          iconColor: Colors.orange,
                          title: '파티게임',
                          description: '모임에서 간단하게 즐길 수 있는 재미있는 게임',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.fast_forward,
                          iconColor: Colors.green,
                          title: '빠른 게임',
                          description: '짧은 시간에 끝나는 빠른 게임 진행',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // How to Play
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '게임 방법',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        _BulletPoint(text: '참가자 수만큼의 숫자가 주어집니다'),
                        _BulletPoint(text: '각자 차례 없이 1부터 순서대로 숫자를 외칩니다'),
                        _BulletPoint(text: '동시에 같은 숫자를 외치면 탈락합니다'),
                        _BulletPoint(text: '마지막 숫자를 혼자 외치는 사람이 승리합니다'),
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
                        const _InfoRow(label: '개발자', value: 'Ambrosia'),
                        const _InfoRow(label: '버전', value: '1.0.0'),
                        const _InfoRow(label: '카테고리', value: '게임, 파티게임'),
                        const _InfoRow(label: '연령 등급', value: '전체 이용가'),
                        const _InfoRow(label: '가격', value: '무료'),
                        const SizedBox(height: 16),
                        TextButton.icon(
                          onPressed: () => context.go('/privacy/nunchi-game'),
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
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        const Text(
                          '지금 다운로드하고\n친구들과 함께 즐거운 시간을 보내세요! 🎮',
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
                              onPressed: () => _launchURL(
                                'https://play.google.com/store/apps/details?id=com.ambro.nunchigame&pcampaignid=web_share',
                              ),
                            ),
                            _DownloadButton(
                              label: 'App Store',
                              icon: Icons.apple,
                              onPressed: () => _launchURL(
                                'https://apps.apple.com/us/app/%EB%88%88%EC%B9%98%EA%B2%8C%EC%9E%84/id6755019137',
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
        foregroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
