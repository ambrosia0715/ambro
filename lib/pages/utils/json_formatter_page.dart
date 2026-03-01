import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonFormatterPage extends StatefulWidget {
  const JsonFormatterPage({super.key});

  @override
  State<JsonFormatterPage> createState() => _JsonFormatterPageState();
}

class _JsonFormatterPageState extends State<JsonFormatterPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _inputController.dispose();
    _outputController.dispose();
    super.dispose();
  }

  void _formatJson() {
    final input = _inputController.text;
    if (input.trim().isEmpty) {
      _outputController.clear();
      setState(() => _errorMessage = null);
      return;
    }

    try {
      final dynamic parsed = jsonDecode(input);
      final String formatted = const JsonEncoder.withIndent('  ').convert(parsed);
      _outputController.text = formatted;
      setState(() => _errorMessage = null);
    } catch (e) {
      setState(() {
        _errorMessage = 'Invalid JSON: ${e.toString()}';
        _outputController.clear();
      });
    }
  }

  void _minifyJson() {
    final input = _inputController.text;
    if (input.trim().isEmpty) return;

    try {
      final dynamic parsed = jsonDecode(input);
      final String minified = jsonEncode(parsed);
      _outputController.text = minified;
      setState(() => _errorMessage = null);
    } catch (e) {
      setState(() {
        _errorMessage = 'Invalid JSON: ${e.toString()}';
        _outputController.clear();
      });
    }
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
                  'JSON Formatter',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '복잡한 JSON 데이터를 보기 좋게 정렬하거나 압축(Minify)할 수 있습니다.',
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
                      Text('• Format: JSON 데이터를 입력하고 버튼을 누르면 들여쓰기가 적용된 형태로 정렬됩니다.', style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Text('• Minify: 공백을 제거하여 용량을 줄인 형태로 변환합니다.', style: TextStyle(fontSize: 14)),
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
            'JSON(JavaScript Object Notation)은 API 응답, 설정 파일, NoSQL 문서 등에서 널리 쓰이는 데이터 형식입니다. '
            'Format은 가독성을 위해 들여쓰기와 줄바꿈을 넣고, Minify는 네트워크 전송이나 번들 크기 절감을 위해 공백을 제거합니다. '
            '유효하지 않은 JSON을 넣으면 오류 위치를 참고해 수정할 수 있습니다.',
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
              hintText: 'JSON 데이터를 여기에 붙여넣으세요...',
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
            border: Border.all(color: _errorMessage != null ? Colors.red.shade300 : Colors.grey.shade300),
          ),
          child: _errorMessage != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : TextField(
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
        onPressed: _formatJson,
        icon: const Icon(Icons.format_align_left),
        label: const Text('Format'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          backgroundColor: const Color(0xFF6200EE),
          foregroundColor: Colors.white,
        ),
      ),
      const SizedBox(width: 16, height: 16),
      OutlinedButton.icon(
        onPressed: _minifyJson,
        icon: const Icon(Icons.compress),
        label: const Text('Minify'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      const SizedBox(width: 16, height: 16),
      TextButton(
        onPressed: () {
          _inputController.clear();
          _outputController.clear();
          setState(() => _errorMessage = null);
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
