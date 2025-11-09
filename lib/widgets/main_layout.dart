import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          // Scrollable content area
          Expanded(
            child: SingleChildScrollView(
              child: child,
            ),
          ),
          // Footer pinned to bottom
          _buildFooter(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          Image.asset(
            'assets/images/ambro_CI.png',
            height: 40,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Text(
                'Ambro',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              );
            },
          ),
        ],
      ),
      actions: [
        _NavButton(label: '홈', path: '/'),
        _NavButton(label: '앱', path: '/apps'),
        _NavButton(label: '개인정보처리방침', path: '/privacy'),
        _NavButton(label: '문의', path: '/contact'),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '회사 정보',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003366),
                ),
              ),
              const SizedBox(height: 12),
              _FooterInfoText('회사명: Ambro (엠브로)'),
              const SizedBox(height: 4),
              _FooterInfoText('대표 이메일: ambrosia0715.ambro@gmail.com'),
              const SizedBox(height: 4),
              _FooterInfoText('주소: 서울시 동작구 상도로387'),
              const SizedBox(height: 4),
              _FooterInfoText('웹사이트: https://ambro.space/'),
              const SizedBox(height: 16),
              const Text(
                '© 2025 Ambro. All rights reserved.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
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
    final isActive = GoRouterState.of(context).uri.path == path;

    return TextButton(
      onPressed: () => context.go(path),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Theme.of(context).primaryColor : Colors.black87,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class _FooterInfoText extends StatelessWidget {
  final String text;

  const _FooterInfoText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xFF555555),
        height: 1.5,
      ),
    );
  }
}
