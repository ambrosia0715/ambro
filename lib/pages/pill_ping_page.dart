import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// Pill Ping Lite 앱 상세 페이지
/// 약 복용 알림 앱의 기능과 특징을 소개하는 페이지입니다.
class PillPingPage extends StatelessWidget {
  const PillPingPage({super.key});

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
                  onPressed: () => context.go('/apps'),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('앱 목록으로 돌아가기'),
                ),
                const SizedBox(height: 24),

                // 앱 헤더
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
                              'assets/images/pill_ping_logo.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2196F3),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Icon(
                                    Icons.medication,
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
                                'PILL PING lite',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '약 복용 시간을 놓치지 않도록 도와주는 간편한 알림 앱',
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
                                  _CategoryChip(label: '건강'),
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

                // 앱 소개
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '💊 PILL PING lite - 약 복용 시간을 놓치지 않도록 도와드립니다!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '복잡한 설정 없이 약 이름과 복용 시간만 입력하면, 설정한 시간에 알림으로 복용을 알려드립니다.',
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

                // 주요 기능
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
                          icon: Icons.notifications_active,
                          iconColor: Color(0xFF2196F3),
                          title: '약 복용 알림',
                          description:
                              '약 이름별로 아침, 점심, 저녁 복용 시간을 개별 설정할 수 있습니다. 설정한 시간에 정확한 로컬 알림을 발송하며, 알림에서 바로 "복용" 또는 "미루기" 처리가 가능합니다.',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.calendar_today,
                          iconColor: Color(0xFF42A5F5),
                          title: '복용 기록 관리',
                          description:
                              '오늘의 복용 스케줄을 한눈에 확인할 수 있습니다. 복용 완료, 미루기, 누락 상태를 실시간으로 표시하며, 시간표 형태로 전체 약 스케줄을 확인할 수 있습니다.',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.accessibility_new,
                          iconColor: Color(0xFF64B5F6),
                          title: '간편한 사용',
                          description:
                              '직관적인 UI로 누구나 쉽게 사용할 수 있습니다. 복잡한 설정 없이 약 이름과 시간만 입력하면 되며, 12시간 형식(AM/PM)으로 시간을 표시합니다.',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.touch_app,
                          iconColor: Color(0xFF90CAF9),
                          title: '알림 액션',
                          description:
                              '알림에서 바로 "복용" 버튼으로 복용 완료 처리가 가능합니다. "10분 미루기", "30분 미루기", "60분 미루기" 옵션을 제공하여 앱을 열지 않고도 복용 상태를 관리할 수 있습니다.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 추천 대상
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '이런 분들께 추천해요',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        _BulletPoint(text: '약을 복용해야 하지만 시간을 자주 잊는 분'),
                        _BulletPoint(text: '여러 종류의 약을 복용하는 분'),
                        _BulletPoint(text: '간단하고 직관적인 앱을 선호하는 분'),
                        _BulletPoint(text: '복잡한 설정 없이 바로 사용하고 싶은 분'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 특징
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
                            _HighlightChip(
                                icon: Icons.money_off, label: '완전 무료'),
                            _HighlightChip(
                                icon: Icons.offline_bolt, label: '오프라인 작동'),
                            _HighlightChip(
                                icon: Icons.security, label: '개인정보 수집 없음'),
                            _HighlightChip(
                                icon: Icons.language, label: '한국어 지원'),
                            _HighlightChip(
                                icon: Icons.flash_on, label: '가볍고 빠름'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 시스템 요구사항
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '시스템 요구사항',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _InfoRow(label: 'Android', value: 'Android 8.0 (API 26) 이상'),
                        _InfoRow(label: 'iOS', value: 'iOS 14.0 이상'),
                        _InfoRow(
                            label: '인터넷 연결',
                            value: '광고 표시를 위해 필요 (앱 기본 기능은 오프라인에서도 작동)'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 앱 정보
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
                        const _InfoRow(label: '개발자', value: 'MinSeok Kang'),
                        const _InfoRow(label: '버전', value: '1.0.0 (Build 1)'),
                        const _InfoRow(
                            label: '카테고리', value: '라이프스타일, 건강'),
                        const _InfoRow(label: '연령 등급', value: '전체 이용가'),
                        const _InfoRow(label: '가격', value: '무료 (광고 포함)'),
                        const SizedBox(height: 16),
                        TextButton.icon(
                          onPressed: () => context.go('/privacy/pill-ping'),
                          icon: const Icon(Icons.privacy_tip),
                          label: const Text('개인정보 처리방침 보기'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // 다운로드 섹션
                Card(
                  color: const Color(0xFF2196F3),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        const Text(
                          '지금 다운로드하고\n약 복용 시간을 놓치지 마세요! 💊',
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
                                'https://apps.apple.com/us/app/pill-ping-lite/id6755383377',
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

/// 카테고리 칩 위젯
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

/// 기능 아이템 위젯
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

/// 불릿 포인트 위젯
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

/// 하이라이트 칩 위젯
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
      avatar: Icon(icon, size: 18, color: const Color(0xFF2196F3)),
      label: Text(label),
      backgroundColor: const Color(0xFF2196F3).withOpacity(0.1),
      labelStyle: const TextStyle(
        color: Color(0xFF2196F3),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

/// 정보 행 위젯
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

/// 다운로드 버튼 위젯
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
        foregroundColor: const Color(0xFF2196F3),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

