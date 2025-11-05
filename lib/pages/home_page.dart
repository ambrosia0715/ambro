import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ambro CI Logo
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Image.asset(
                  'assets/images/ambro_CI.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.apps,
                        size: 80,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 48),
              
              // Message
              Text(
                '앱 관련 문의는 이메일로 연락해주세요.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
              
              // Company Info Card
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '회사 정보',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(height: 24),
                        _InfoRow(
                          icon: Icons.business,
                          label: '회사명',
                          value: 'Ambro (엠브로)',
                        ),
                        const SizedBox(height: 16),
                        _InfoRow(
                          icon: Icons.email,
                          label: '이메일',
                          value: 'ambrosia0715.ambro@gmail.com',
                        ),
                        const SizedBox(height: 16),
                        _InfoRow(
                          icon: Icons.language,
                          label: '웹사이트',
                          value: 'ambro-home.vercel.app',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
