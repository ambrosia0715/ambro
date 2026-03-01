import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SqlFormatterPage extends StatefulWidget {
  const SqlFormatterPage({super.key});

  @override
  State<SqlFormatterPage> createState() => _SqlFormatterPageState();
}

class _SqlFormatterPageState extends State<SqlFormatterPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    _outputController.dispose();
    super.dispose();
  }

  void _formatSql() {
    final input = _inputController.text;
    if (input.trim().isEmpty) {
      _outputController.clear();
      return;
    }

    // Basic SQL Formatting Logic
    String formatted = input
        .replaceAll(RegExp(r'\s+'), ' ') // Collapse whitespace
        .replaceAll(RegExp(r'\s*,\s*'), ', ') // Fix comma spacing
        .replaceAll(RegExp(r'\s*\(\s*'), ' (') // Fix parenthesis spacing
        .replaceAll(RegExp(r'\s*\)\s*'), ') ');

    // Keywords to uppercase and newline
    final keywords = [
      'SELECT', 'FROM', 'WHERE', 'GROUP BY', 'HAVING', 'ORDER BY', 
      'INSERT INTO', 'VALUES', 'UPDATE', 'SET', 'DELETE FROM', 
      'INNER JOIN', 'LEFT JOIN', 'RIGHT JOIN', 'OUTER JOIN', 'JOIN', 
      'UNION', 'UNION ALL', 'LIMIT', 'OFFSET'
    ];

    for (final keyword in keywords) {
      // Case insensitive replace to uppercase
      formatted = formatted.replaceAllMapped(
        RegExp('\\b${keyword}\\b', caseSensitive: false),
        (match) => '\n${match.group(0)!.toUpperCase()}\n  ',
      );
    }

    // Additional formatting for AND/OR
    formatted = formatted.replaceAllMapped(
      RegExp(r'\b(AND|OR)\b', caseSensitive: false),
      (match) => '\n  ${match.group(0)!.toUpperCase()}',
    );

    // Clean up extra newlines and spaces
    formatted = formatted.replaceAll(RegExp(r'\n\s*\n'), '\n');
    formatted = formatted.trim();

    _outputController.text = formatted;
  }

  void _copyToClipboard() {
    final text = _outputController.text;
    if (text.isEmpty) return;
    
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('결과가 복사되었습니다!'), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'SQL Formatter',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'SQL 쿼리를 보기 좋게 정렬하고 키워드를 대문자로 변환합니다.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade100),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('💡 사용법', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1565C0))),
                      SizedBox(height: 8),
                      Text('• 입력창에 SQL 쿼리를 붙여넣고 "Format SQL" 버튼을 누르세요.', style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Text('• 예약어(SELECT, FROM, WHERE 등)는 대문자로 변환되고, 적절한 들여쓰기가 적용됩니다.', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                if (isWideScreen)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildInputSection(),
                      ),
                      const SizedBox(width: 24),
                      _buildActionButtons(isVertical: true),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _buildOutputSection(),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildInputSection(),
                      const SizedBox(height: 16),
                      _buildActionButtons(isVertical: false),
                      const SizedBox(height: 16),
                      _buildOutputSection(),
                    ],
                  ),
                const SizedBox(height: 32),
                _buildAboutSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('이 도구에 대해', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1565C0))),
          SizedBox(height: 8),
          Text(
            'SQL 쿼리는 한 줄로 작성하면 읽기 어렵고 리뷰 시 실수를 찾기 힘듭니다. '
            '이 포맷터는 SELECT, FROM, WHERE, JOIN 등 예약어를 대문자로 통일하고, 절마다 줄을 나누어 가독성을 높입니다. '
            'Oracle, MySQL, PostgreSQL 등 주요 DB에서 사용하는 표준 SQL 문법에 맞춰 정렬합니다.',
            style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('입력 (Input)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        const SizedBox(height: 8),
        Container(
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            controller: _inputController,
            maxLines: null,
            expands: true,
            style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
            decoration: InputDecoration(
              hintText: 'SQL 쿼리를 여기에 붙여넣으세요...',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOutputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('결과 (Output)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
            if (_outputController.text.isNotEmpty)
              TextButton.icon(
                onPressed: _copyToClipboard,
                icon: const Icon(Icons.copy, size: 16),
                label: const Text('복사'),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 500,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            controller: _outputController,
            readOnly: true,
            maxLines: null,
            expands: true,
            style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(16),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons({required bool isVertical}) {
    final children = [
      ElevatedButton.icon(
        onPressed: _formatSql,
        icon: const Icon(Icons.format_align_left),
        label: const Text('Format SQL'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          backgroundColor: const Color(0xFF6200EE),
          foregroundColor: Colors.white,
        ),
      ),
      const SizedBox(width: 16, height: 16),
      TextButton(
        onPressed: () {
          _inputController.clear();
          _outputController.clear();
        },
        child: const Text('Clear'),
      ),
    ];

    if (isVertical) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          ...children,
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }
  }
}
