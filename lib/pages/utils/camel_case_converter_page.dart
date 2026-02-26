import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import '../../utils/seo_helper_stub.dart' if (dart.library.html) '../../utils/seo_helper.dart';

class CamelCaseConverterPage extends StatefulWidget {
  const CamelCaseConverterPage({super.key});

  @override
  State<CamelCaseConverterPage> createState() => _CamelCaseConverterPageState();
}

class _CamelCaseConverterPageState extends State<CamelCaseConverterPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  bool _isFirstLetterUpperCase = false; // 첫 글자 대문자 여부 (PascalCase vs camelCase)

  @override
  void dispose() {
    _inputController.dispose();
    _outputController.dispose();
    super.dispose();
  }

  void _convert() {
    final input = _inputController.text;
    if (input.isEmpty) {
      _outputController.clear();
      return;
    }

    final lines = input.split('\n');
    final convertedLines = <String>[];

    for (final line in lines) {
      if (line.trim().isEmpty) {
        convertedLines.add('');
        continue;
      }

      // 1. 단어 분리 (공백, _, -, 특수문자 기준)
      final words = line
          .split(RegExp(r'[^a-zA-Z0-9가-힣]+'))
          .where((w) => w.isNotEmpty)
          .toList();

      if (words.isEmpty) {
        convertedLines.add('');
        continue;
      }

      // 2. 변환 로직
      final buffer = StringBuffer();
      for (int i = 0; i < words.length; i++) {
        final word = words[i];
        if (i == 0) {
          if (_isFirstLetterUpperCase) {
            // PascalCase (첫 글자 대문자)
            buffer.write(
                word[0].toUpperCase() + word.substring(1).toLowerCase());
          } else {
            // camelCase (첫 글자 소문자)
            buffer.write(word.toLowerCase());
          }
        } else {
          // 이후 단어는 무조건 첫 글자 대문자
          buffer.write(
              word[0].toUpperCase() + word.substring(1).toLowerCase());
        }
      }
      convertedLines.add(buffer.toString());
    }

    setState(() {
      _outputController.text = convertedLines.join('\n');
    });
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
    final isWideScreen = MediaQuery.of(context).size.width > 700;

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'CamelCase 변환기',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '여러 줄의 텍스트를 한 번에 변환하세요. 공백, 언더바(_), 하이픈(-) 등을 기준으로 단어를 조합합니다.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // 옵션 선택 영역
                Wrap(
                  spacing: 16,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text('변환 옵션:', style: TextStyle(fontWeight: FontWeight.bold)),
                    ChoiceChip(
                      label: const Text('camelCase (소문자 시작)'),
                      selected: !_isFirstLetterUpperCase,
                      onSelected: (selected) {
                        setState(() {
                          _isFirstLetterUpperCase = !selected;
                        });
                        _convert(); // 옵션 변경 시 즉시 재변환
                      },
                    ),
                    ChoiceChip(
                      label: const Text('PascalCase (대문자 시작)'),
                      selected: _isFirstLetterUpperCase,
                      onSelected: (selected) {
                        setState(() {
                          _isFirstLetterUpperCase = selected;
                        });
                        _convert(); // 옵션 변경 시 즉시 재변환
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 입력 및 결과 영역 (반응형 레이아웃)
                if (isWideScreen)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: _inputController,
                          label: '입력 (Input)',
                          hint: '변환할 텍스트를 입력하세요.\n예:\nuser_name\nget-user-id',
                          onChanged: (_) => _convert(),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(height: 100), // 대략적인 중앙 정렬
                          Icon(Icons.arrow_forward, color: Colors.grey),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _buildTextField(
                          controller: _outputController,
                          label: '결과 (Output)',
                          readOnly: true,
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildTextField(
                        controller: _inputController,
                        label: '입력 (Input)',
                        hint: '변환할 텍스트를 입력하세요.\n예:\nuser_name\nget-user-id',
                        onChanged: (_) => _convert(),
                      ),
                      const SizedBox(height: 16),
                      const Center(child: Icon(Icons.arrow_downward, color: Colors.grey)),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _outputController,
                        label: '결과 (Output)',
                        readOnly: true,
                      ),
                    ],
                  ),
                
                const SizedBox(height: 24),
                
                // 하단 버튼 영역
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _copyToClipboard,
                      icon: const Icon(Icons.copy),
                      label: const Text('결과 복사하기'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    bool readOnly = false,
    Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: readOnly ? Colors.grey.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            onChanged: onChanged,
            maxLines: 15, // 멀티라인 지원
            minLines: 10,
            style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
