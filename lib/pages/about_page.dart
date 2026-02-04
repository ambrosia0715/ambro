import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 강민석님 프로필 기반 Ambro 블로그 운영자 소개 페이지
/// 베테랑 웹 프로그래머 포지셔닝, 파란색(#007BFF) 테마
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const _themeBlue = Color(0xFF007BFF);
  static const _themeBlueLight = Color(0xFFE7F1FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHero(context),
                const SizedBox(height: 64),
                _buildSection(
                  title: 'Tech Stack & Expertise',
                  subtitle: '기술 스택 & 전문성',
                  child: _buildTechStack(context),
                ),
                const SizedBox(height: 56),
                _buildSection(
                  title: 'Why Ambro Blog?',
                  subtitle: '운영 철학',
                  child: _buildPhilosophy(),
                ),
                const SizedBox(height: 56),
                _buildSection(
                  title: 'My Projects',
                  subtitle: 'Result-driven Developer의 결과물',
                  child: _buildProjects(context),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _themeBlueLight,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _themeBlue.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _themeBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              '15+ Years in Dev',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '견고한 웹 생태계를 만드는 개발자 Ambro입니다',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
              height: 1.4,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '강민석 · 15년 차 시니어 개발자 (Java/Spring 전문)',
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '레거시의 견고함과 최신 AI 도구(Cursor, LLM)의 효율성을 결합하여 '
            '가치를 창출하는 1인 개발자 및 기업가입니다.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechStack(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TechBlock(
          title: 'Backend',
          description: 'Java(Spring Boot) 기반 백엔드 및 API 설계 전문성',
          items: ['Java', 'Spring Boot', 'REST API', '비즈니스 로직 설계'],
          color: _themeBlue,
        ),
        const SizedBox(height: 24),
        _TechBlock(
          title: 'AI & Productivity',
          description: '차세대 개발 워크플로우 숙련도',
          items: ['Cursor', 'Replit', 'Ollama', 'LLM 활용'],
          color: _themeBlue,
        ),
      ],
    );
  }

  Widget _buildPhilosophy() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: _themeBlueLight.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _themeBlue.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, color: _themeBlue, size: 24),
              const SizedBox(width: 12),
              const Text(
                '기초가 튼튼해야 무너지지 않는다',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212529),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '이 블로그는 Java/Python의 핵심 문법과 최신 AI 정보를 공유합니다. '
            '개발자들이 실무에서 겪는 병목 현상을 해결해주는 가이드북 같은 블로그를 지향하며, '
            '최신 IT 정보를 통해 함께 성장하는 공간이 되고자 합니다.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade800,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjects(BuildContext context) {
    final apps = [
      _ProjectCardData(
        name: '온기',
        description: 'AI가 전해주는 위로의 일기 앱',
        path: '/apps/aicent/ongi',
        iconColor: const Color(0xFF8B4513),
      ),
      _ProjectCardData(
        name: '눈치게임',
        description: '친구들과 함께하는 숫자 맞추기 게임',
        path: '/apps/play/nunchi-game',
        iconColor: const Color(0xFF2196F3),
      ),
      _ProjectCardData(
        name: '물주기 알림_lite',
        description: '식물 돌봄을 돕는 알림 앱',
        path: '/apps/mate/water-buddy',
        iconColor: const Color(0xFF2E7D32),
      ),
      _ProjectCardData(
        name: 'PILL PING lite',
        description: '약 복용 시간 알림 앱',
        path: '/apps/mate/pill-ping',
        iconColor: const Color(0xFF1976D2),
      ),
    ];

    return Column(
      children: [
        ...apps.map((app) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _ProjectCard(
                name: app.name,
                description: app.description,
                path: app.path,
                iconColor: app.iconColor,
                onTap: () => context.go(app.path),
              ),
            )),
        const SizedBox(height: 8),
        Center(
          child: TextButton.icon(
            onPressed: () => context.go('/about/apps'),
            icon: const Icon(Icons.apps, size: 18),
            label: const Text('전체 앱 보기'),
            style: TextButton.styleFrom(
              foregroundColor: _themeBlue,
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 24),
        child,
      ],
    );
  }
}

class _TechBlock extends StatelessWidget {
  final String title;
  final String description;
  final List<String> items;
  final Color color;

  const _TechBlock({
    required this.title,
    required this.description,
    required this.items,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items
                .map((item) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: color.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectCardData {
  final String name;
  final String description;
  final String path;
  final Color iconColor;

  _ProjectCardData({
    required this.name,
    required this.description,
    required this.path,
    required this.iconColor,
  });
}

class _ProjectCard extends StatelessWidget {
  final String name;
  final String description;
  final String path;
  final Color iconColor;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.name,
    required this.description,
    required this.path,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.apps, color: iconColor, size: 24),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212529),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
