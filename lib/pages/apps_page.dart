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
                description: 'AI를 활용한 대화 기반 교육/개념 앱 모음',
                apps: const [],
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
                  ),
                ],
              ),
              const SizedBox(height: 48),
              
              // Mate Category
              _CategorySection(
                title: 'Mate',
                description: '생활 보조 앱 모음',
                apps: const [],
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

  const _AppCard({
    required this.name,
    required this.description,
    required this.onTap,
    this.hasIcon = false,
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
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/game_guessing_logo.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.gamepad,
                            size: 32,
                            color: Theme.of(context).primaryColor,
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
