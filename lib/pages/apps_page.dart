import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '앱',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),

              // AIcent Category
              _CategorySection(
                title: 'AIcent',
                description: 'AI를 사용하는 앱 모음',
                apps: [
                  _AppCard(
                    name: '온기',
                    description: '따뜻한 일기 앱 - AI가 전해주는 위로의 한마디',
                    onTap: () => context.go('/apps/aicent/ongi'),
                    hasIcon: true,
                    iconColor: const Color(0xFF8B4513), // 따뜻한 갈색 계열
                    imagePath: 'assets/images/ongi_logo.png', // 나중에 추가 예정
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Play Category
              _CategorySection(
                title: 'Play',
                description: '단순 게임형 앱 모음',
                apps: [
                  _AppCard(
                    name: '눈치게임',
                    description: '친구들과 함께 즐기는 숫자 맞추기 게임',
                    onTap: () => context.go('/apps/play/nunchi-game'),
                    hasIcon: true,
                    imagePath: 'assets/images/game_guessing_logo.png',
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Mate Category
              _CategorySection(
                title: 'Mate',
                description: '생활 보조 앱 모음',
                apps: [
                  _AppCard(
                    name: '물주기 알림_lite',
                    description: '식물마다 주기를 설정하면 날짜에 맞춰 알려드려요',
                    onTap: () => context.go('/apps/mate/water-buddy'),
                    hasIcon: true,
                    iconColor: const Color(0xFF2E7D32),
                    imagePath: 'assets/images/water_buddy_logo.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> apps;

  const _CategorySection({
    required this.title,
    required this.description,
    required this.apps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 24),
        if (apps.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Text(
                  '준비 중입니다',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ),
          )
        else
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: apps,
          ),
      ],
    );
  }
}

class _AppCard extends StatelessWidget {
  final String name;
  final String description;
  final VoidCallback onTap;
  final bool hasIcon;
  final Color? iconColor;
  final String? imagePath;

  const _AppCard({
    required this.name,
    required this.description,
    required this.onTap,
    this.hasIcon = false,
    this.iconColor,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasIcon)
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: (iconColor ?? Theme.of(context).primaryColor)
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath ?? 'assets/images/game_guessing_logo.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.apps,
                            size: 32,
                            color: iconColor ?? Theme.of(context).primaryColor,
                          );
                        },
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onTap,
                  child: const Text('자세히 보기'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
