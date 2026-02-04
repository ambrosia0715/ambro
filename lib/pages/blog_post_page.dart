import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import '../models/blog_data.dart';
import 'package:markdown/markdown.dart' as md;

class BlogPostPage extends StatefulWidget {
  final String category;
  final String fileName;

  const BlogPostPage({
    super.key,
    required this.category,
    required this.fileName,
  });

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  String? _content;
  bool _isLoading = true;
  String? _errorMessage;
  BlogPost? _postData;
  List<Map<String, dynamic>> _toc = []; // 목차 데이터

  @override
  void initState() {
    super.initState();
    _loadContent();
    _findPostData();
  }

  void _findPostData() {
    try {
      final post = BlogData.posts.firstWhere(
        (p) => p.category == widget.category && p.fileName == widget.fileName,
      );
      setState(() {
        _postData = post;
      });
    } catch (_) {}
  }

  Future<void> _loadContent() async {
    try {
      final path = 'assets/content/blog/${widget.category}/${widget.fileName}';
      final content = await rootBundle.loadString(path);

      // 목차 추출
      _extractToc(content);

      setState(() {
        _content = content;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '포스트를 불러올 수 없습니다.\n$e';
        _isLoading = false;
      });
    }
  }

  // 간단한 정규식을 사용한 목차 추출
  void _extractToc(String content) {
    final RegExp headingRegex = RegExp(r'^(#{1,3})\s+(.+)$', multiLine: true);
    final matches = headingRegex.allMatches(content);

    _toc = matches.map((match) {
      return {
        'level': match.group(1)!.length,
        'text': match.group(2)!.trim(),
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }

    final isWideScreen = MediaQuery.of(context).size.width > 1000;

    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400), // Wider for TOC
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main Content
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      if (_postData != null) ...[
                        // Tags
                        Wrap(
                          spacing: 8,
                          children: _postData!.tags
                              .map((tag) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE3F2FD),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      tag,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1976D2),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                        // Title
                        Text(
                          _postData!.title,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Meta Info
                        Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(_postData!.date,
                                style: const TextStyle(color: Colors.grey)),
                            const SizedBox(width: 16),
                            const Icon(Icons.access_time_outlined,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(_postData!.readTime,
                                style: const TextStyle(color: Colors.grey)),
                            const SizedBox(width: 16),
                            const Text('By ',
                                style: TextStyle(color: Colors.grey)),
                            Text(_postData!.author,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Thumbnail (웹: 직접 URL로 로드하여 asset 경로 이슈 우회)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: _postData!.isLocalImage
                              ? (kIsWeb
                                  ? Image.network(
                                      '/assets/${_postData!.thumbnailUrl}',
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const SizedBox(),
                                    )
                                  : Image.asset(
                                      _postData!.thumbnailUrl,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const SizedBox(),
                                    ))
                              : Image.network(
                                  _postData!.thumbnailUrl,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const SizedBox(),
                                ),
                        ),
                        const SizedBox(height: 48),
                      ],

                      // Markdown Content (imageBuilder: 웹에서 본문 이미지 asset 경로 올바르게 로드)
                      MarkdownBody(
                        data: _content ?? '',
                        selectable: true,
                        imageBuilder: (uri, title, altText) {
                          final path = uri.path;
                          if (uri.scheme == 'http' || uri.scheme == 'https') {
                            return Image.network(
                              uri.toString(),
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) =>
                                  _buildImageError(altText),
                            );
                          }
                          if (kIsWeb && path.startsWith('assets/')) {
                            return Image.network(
                              '/assets/$path',
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) =>
                                  _buildImageError(altText),
                            );
                          }
                          return Image.asset(
                            path,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) =>
                                _buildImageError(altText),
                          );
                        },
                        styleSheet: MarkdownStyleSheet(
                          h1: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Color(0xFF212529),
                              letterSpacing: -0.5),
                          h2: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Color(0xFF212529)),
                          h3: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Color(0xFF343A40)),
                          p: const TextStyle(
                              fontSize: 17,
                              height: 1.8,
                              color: Color(0xFF495057)),
                          listBullet:
                              const TextStyle(fontSize: 17, height: 1.8),
                          code: const TextStyle(
                            fontFamily: 'monospace',
                            backgroundColor: Color(0xFFF1F3F5),
                            color: Color(0xFFE83E8C),
                            fontSize: 15,
                          ),
                          codeblockDecoration: BoxDecoration(
                            color: const Color(0xFFF8F9FA),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          blockquote: const TextStyle(
                              color: Color(0xFF6C757D), fontSize: 16),
                          blockquoteDecoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Colors.grey.shade300, width: 4)),
                            color: Colors.grey.shade50,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 64),

                      // Bottom CTA
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFE9ECEF)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '🚀 Ambro의 앱을 확인해보세요',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF212529),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              '개발 생산성을 높여주는 다양한 도구와 애플리케이션을 만나보세요.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF495057),
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: () => context.go('/about/apps'),
                              icon: const Icon(Icons.arrow_forward),
                              label: const Text('Apps 페이지 보기'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2962FF),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // TOC Sidebar (Desktop Only)
                if (isWideScreen) ...[
                  const SizedBox(width: 64),
                  Expanded(
                    flex: 1,
                    child: _buildToc(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageError(String? altText) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.grey.shade200,
      child: Center(
        child: Text(
          altText ?? 'Image',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildToc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '목차',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _toc.map((item) {
              return Padding(
                padding: EdgeInsets.only(
                  left: item['level'] == 1
                      ? 16.0
                      : (item['level'] == 2 ? 16.0 : 32.0),
                  bottom: 12.0,
                ),
                child: Text(
                  item['text'],
                  style: TextStyle(
                    fontSize: 14,
                    color: item['level'] == 1
                        ? Colors.black87
                        : Colors.grey.shade600,
                    fontWeight: item['level'] == 1
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
