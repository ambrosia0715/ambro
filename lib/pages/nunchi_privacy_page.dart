import 'package:flutter/material.dart';

class NunchiPrivacyPage extends StatelessWidget {
  const NunchiPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  TextButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('뒤로가기'),
                  ),
                  const SizedBox(height: 24),
                  
                  // Title
                  const Text(
                    '눈치게임 개인정보처리방침',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Content
                  Text(
                    '본 앱은 사용자의 어떠한 개인정보도 수집, 저장 또는 제3자에게 제공하지 않습니다.\n\n'
                    '앱 내 데이터는 전적으로 사용자 기기 내에서만 처리됩니다.\n\n'
                    '본 방침은 2025년 11월 3일부터 적용됩니다.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
