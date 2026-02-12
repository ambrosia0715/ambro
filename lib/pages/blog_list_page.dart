import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/blog_data.dart';
import '../widgets/blog_card.dart';
import '../utils/seo_helper_stub.dart' if (dart.library.html) '../utils/seo_helper.dart';

class BlogListPage extends StatelessWidget {
  final String category;

  const BlogListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final categoryName = BlogData.categories[category] ?? '블로그';
    final posts = BlogData.getPostsByCategory(category);
    // 동적 페이지 타이틀 설정 (SEO)
    setPageTitle('$categoryName - Ambro Tech Blog');
    setPageMeta('$categoryName 관련 기술 블로그 글 목록 - Ambro Tech Blog');

    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Header
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${posts.length}개의 글',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 48),

              // Posts Grid
              if (posts.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(48.0),
                    child: Text('등록된 포스트가 없습니다.',
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ),
                )
              else
                LayoutBuilder(
                  builder: (context, constraints) {
                    // Responsive Grid Columns
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
                        mainAxisSpacing: 32,
                        crossAxisSpacing: 32,
                        childAspectRatio: 0.65, // 카드 비율 조정 (세로 공간 더 확보)
                      ),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return BlogCard(post: posts[index]);
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

