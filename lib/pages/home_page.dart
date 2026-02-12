import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/blog_data.dart';
import '../widgets/blog_card.dart';
import '../utils/seo_helper_stub.dart' if (dart.library.html) '../utils/seo_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 동적 페이지 타이틀 설정 (SEO)
    setPageTitle('Ambro Tech Blog - AI, Java, Python 기술 블로그');
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                    context, 'ai-basic', 'Latest in AI Dev', 'AI Dev'),
                const SizedBox(height: 32),
                _buildSection(context, 'ai-insight', 'Latest in AI Insight',
                    'AI Insight'),
                const SizedBox(height: 32),
                _buildSection(context, 'java', 'Latest in Java', 'Java'),
                const SizedBox(height: 32),
                _buildSection(context, 'python', 'Latest in Python', 'Python'),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String categoryKey, String title,
      String displayCategory) {
    // Get latest 3 posts for the category
    final posts = BlogData.getPostsByCategory(categoryKey).take(3).toList();

    if (posts.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/blog/$categoryKey'),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF1976D2),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: Row(
                children: const [
                  Text('View All'),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Grid
        LayoutBuilder(
          builder: (context, constraints) {
            // Responsive: 3 columns on desktop, 1 on mobile
            int crossAxisCount = 3;
            if (constraints.maxWidth < 600) {
              crossAxisCount = 1;
            } else if (constraints.maxWidth < 900) {
              crossAxisCount = 2;
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 0.65, // Adjust based on card content
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return BlogCard(post: posts[index]);
              },
            );
          },
        ),
      ],
    );
  }
}
