import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            child,
            _buildFooter(),
          ],
        ),
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
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: const Text(
        '© 2025 Ambro. All rights reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey),
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
