import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// 온기(Ongi) 앱 상세 페이지
/// 따뜻한 일기 앱의 기능과 특징을 소개하는 페이지입니다.
class OngiPage extends StatelessWidget {
  const OngiPage({super.key});

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
                            color: const Color(0xFF8B4513).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              'assets/images/ongi_logo.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // 이미지가 없을 경우 기본 아이콘 표시
                                return Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF8B4513),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Icon(
                                    Icons.book,
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
                                '온기',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '따뜻한 일기 앱',
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
                                  _CategoryChip(label: '일기'),
                                  _CategoryChip(label: 'AI'),
                                  _CategoryChip(label: '생산성'),
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
                          '📱 온기 - 매일의 따뜻한 순간을 기록하는 일기 앱',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '복잡한 일기 작성 대신, 간단하고 편리하게 하루를 기록하고 AI가 전해주는 위로의 한마디로 하루를 마무리할 수 있습니다.',
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
                          icon: Icons.edit_note,
                          iconColor: Color(0xFF8B4513),
                          title: '간편한 일기 작성',
                          description:
                              '감정 선택, 오늘의 목표, 할 일 관리, 마음 한 줄을 통해 간단하게 하루를 기록하세요.',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.psychology,
                          iconColor: Color(0xFFD2691E),
                          title: 'AI가 전해주는 위로의 한마디',
                          description:
                              '일기를 작성하면 AI가 당신의 하루를 분석하고 따뜻한 코멘트를 전해드립니다. 무료 사용자는 하루 1회, 프리미엄 사용자는 제한 없이 이용 가능합니다.',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.bar_chart,
                          iconColor: Color(0xFFCD853F),
                          title: '일기 히스토리 및 통계',
                          description:
                              '날짜별로 작성한 일기를 쉽게 찾아보고, 감정별로 필터링하여 과거 일기를 확인하세요. 감정 분포 차트로 나의 감정 패턴을 한눈에 파악할 수 있습니다.',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.backup,
                          iconColor: Color(0xFFA0522D),
                          title: '데이터 백업 및 복원',
                          description:
                              '작성한 일기 데이터를 JSON 파일로 백업할 수 있습니다. 새로운 기기로 옮기거나 데이터를 복원할 때 유용합니다.',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.security,
                          iconColor: Color(0xFF8B4513),
                          title: '안전한 데이터 보관',
                          description:
                              'Firebase를 통한 안전한 클라우드 저장과 Google 계정으로 간편하게 로그인할 수 있습니다. 개인 정보와 일기 데이터가 안전하게 보호됩니다.',
                        ),
                        SizedBox(height: 20),
                        _FeatureItem(
                          icon: Icons.palette,
                          iconColor: Color(0xFFD2691E),
                          title: '깔끔하고 편리한 인터페이스',
                          description:
                              '따뜻한 색감의 UI로 편안한 사용 경험을 제공합니다. 직관적인 디자인으로 누구나 쉽게 사용할 수 있으며, 다크 모드를 지원합니다.',
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
                          '이런 분께 추천합니다',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        _BulletPoint(
                            text: '매일 일기를 쓰고 싶지만 시간이 부족한 분'),
                        _BulletPoint(text: '간단하게 하루를 기록하고 싶은 분'),
                        _BulletPoint(
                            text: 'AI의 응원 메시지로 하루를 마무리하고 싶은 분'),
                        _BulletPoint(
                            text: '감정을 추적하고 자기 이해를 높이고 싶은 분'),
                        _BulletPoint(
                            text: '목표와 할 일을 함께 관리하고 싶은 분'),
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
                        const _InfoRow(label: '개발자', value: 'Ambro (엠브로)'),
                        const _InfoRow(label: '버전', value: '1.0.0'),
                        const _InfoRow(
                            label: '카테고리', value: '일기, AI, 생산성'),
                        const _InfoRow(label: '연령 등급', value: '전체 이용가'),
                        const _InfoRow(
                            label: '가격', value: '무료 (프리미엄 구독 가능)'),
                        const _InfoRow(
                            label: '지원 플랫폼',
                            value: 'iOS 13.0 이상, Android 5.0 이상'),
                        const SizedBox(height: 16),
                        TextButton.icon(
                          onPressed: () => context.go('/privacy/ongi'),
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
                  color: const Color(0xFF8B4513),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        const Text(
                          '지금 다운로드하고\n따뜻한 하루를 기록해보세요! 📖',
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
                                'https://play.google.com/store/apps/details?id=com.ambro.ongi&pcampaignid=web_share',
                              ),
                            ),
                            _DownloadButton(
                              label: 'App Store',
                              icon: Icons.apple,
                              onPressed: () => _launchURL(
                                'https://apps.apple.com/us/app/%EC%98%A8%EA%B8%B0-%EB%94%B0%EB%9C%BB%ED%95%9C-%EC%9D%BC%EA%B8%B0/id6755369005',
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
        foregroundColor: const Color(0xFF8B4513),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

