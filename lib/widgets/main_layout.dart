import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: child, // Content of the page
          ),
          SliverFillRemaining(
            hasScrollBody: false, // Important for sticky footer behavior
            child: Column(
              children: [
                const Spacer(), // Pushes footer to the bottom
                _buildFooter(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/contact'),
        backgroundColor: const Color(0xFF333333),
        child: const Icon(Icons.question_mark, color: Colors.white),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.grey.shade200,
          height: 1,
        ),
      ),
      titleSpacing: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            InkWell(
              onTap: () => context.go('/'),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6200EE), // Deep Purple Accent
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'AT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Ambro Tech',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Desktop Menu
            if (MediaQuery.of(context).size.width > 800) ...[
              _NavButton(label: 'AI Dev', path: '/blog/ai-basic'),
              _NavButton(label: 'AI Insight', path: '/blog/ai-insight'),
              _NavButton(label: 'Java', path: '/blog/java'),
              _NavButton(label: 'Python', path: '/blog/python'),
              const SizedBox(width: 16),
              _AboutDropdown(),
            ],
          ],
        ),
      ),
      // Mobile Menu Button & Icons
      actions: [
        if (MediaQuery.of(context).size.width > 800) ...[
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {}, // 검색 기능 (UI Only)
            icon: const Icon(Icons.search, color: Colors.black54),
            tooltip: '검색',
          ),
          IconButton(
            onPressed: () {}, // 다크모드 토글 (UI Only)
            icon: const Icon(Icons.nightlight_round, color: Colors.black54),
            tooltip: '다크 모드',
          ),
          const SizedBox(width: 24),
        ] else ...[
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onSelected: (value) => context.go(value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                  value: '/blog/ai-basic', child: Text('AI Dev')),
              const PopupMenuItem(
                  value: '/blog/ai-insight', child: Text('AI Insight')),
              const PopupMenuItem(value: '/blog/java', child: Text('Java')),
              const PopupMenuItem(value: '/blog/python', child: Text('Python')),
              const PopupMenuDivider(),
              const PopupMenuItem(value: '/about', child: Text('소개 (About)')),
              const PopupMenuItem(value: '/about/apps', child: Text('Apps')),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 8,
                children: [
                  _FooterLink(label: '개인정보처리방침', path: '/privacy'),
                  _FooterDivider(),
                  _FooterLink(label: '문의하기', path: '/contact'),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Ambro (엠브로) | 대표 이메일: ambrosia0715.ambro@gmail.com | 주소: 서울시 동작구 상도로387',
                style: TextStyle(color: Color(0xFF6C757D), fontSize: 13),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                '© 2025 Ambro Tech. All rights reserved.',
                style: TextStyle(color: Color(0xFFADB5BD), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final String path;

  const _NavButton({required this.label, required this.path});

  @override
  Widget build(BuildContext context) {
    // Check if the current location starts with the path (for active state)
    final currentLocation = GoRouterState.of(context).uri.path;
    final isActive = currentLocation.startsWith(path);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => context.go(path),
        style: TextButton.styleFrom(
          foregroundColor:
              isActive ? const Color(0xFF6200EE) : const Color(0xFF555555),
          textStyle: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            fontSize: 15,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class _AboutDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(left: 8),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 40),
        tooltip: 'About 메뉴',
        onSelected: (value) => context.go(value),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: const [
              Text(
                'About',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_drop_down, size: 18, color: Color(0xFF333333)),
            ],
          ),
        ),
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: '/about',
            child: Text('소개 (About)'),
          ),
          const PopupMenuItem(
            value: '/about/apps',
            child: Text('Apps'),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final String path;

  const _FooterLink({required this.label, required this.path});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(path),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF495057),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}

class _FooterDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 1,
      color: Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
