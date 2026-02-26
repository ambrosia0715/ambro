import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ConversionMode {
  toCamel, // 일반 텍스트 -> CamelCase/PascalCase
  toSnake, // CamelCase -> snake_case
}

class CamelCaseConverterPage extends StatefulWidget {
  const CamelCaseConverterPage({super.key});

  @override
  State<CamelCaseConverterPage> createState() => _CamelCaseConverterPageState();
}

class _CamelCaseConverterPageState extends State<CamelCaseConverterPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  
  ConversionMode _mode = ConversionMode.toCamel;
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

      if (_mode == ConversionMode.toCamel) {
        // Mode 1: To Camel/Pascal Case
        convertedLines.add(_convertToCamel(line));
      } else {
        // Mode 2: To Snake Case
        convertedLines.add(_convertToSnake(line));
      }
    }

    setState(() {
      _outputController.text = convertedLines.join('\n');
    });
  }

  String _convertToCamel(String line) {
    // 1. 단어 분리 (공백, _, -, 특수문자 기준)
    final words = line
        .split(RegExp(r'[^a-zA-Z0-9가-힣]+'))
        .where((w) => w.isNotEmpty)
        .toList();

    if (words.isEmpty) return '';

    // 2. 변환 로직
    final buffer = StringBuffer();
    for (int i = 0; i < words.length; i++) {
      final word = words[i];
      if (i == 0) {
        if (_isFirstLetterUpperCase) {
          // PascalCase (첫 글자 대문자)
          buffer.write(word[0].toUpperCase() + word.substring(1).toLowerCase());
        } else {
          // camelCase (첫 글자 소문자)
          buffer.write(word.toLowerCase());
        }
      } else {
        // 이후 단어는 무조건 첫 글자 대문자
        buffer.write(word[0].toUpperCase() + word.substring(1).toLowerCase());
      }
    }
    return buffer.toString();
  }

  String _convertToSnake(String line) {
    // 대문자 앞에 _를 추가하고 소문자로 변환
    // 예: camelCase -> camel_case, PascalCase -> pascal_case
    // 정규식: 대문자를 찾아서 (_ + 소문자)로 치환
    String result = line.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
      return '_${match.group(0)!.toLowerCase()}';
    });

    // 맨 앞에 생긴 _ 제거 (예: PascalCase -> _pascal_case -> pascal_case)
    if (result.startsWith('_')) {
      result = result.substring(1);
    }
    
    // 혹시 모를 중복 _ 제거 및 양옆 공백 제거
    return result.replaceAll(RegExp(r'_+'), '_').trim();
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
                  '텍스트를 CamelCase로 변환하거나, CamelCase를 snake_case로 분리할 수 있습니다.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // 변환 모드 선택 (탭 스타일)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        children: [
                          _buildModeTab(
                            title: 'To CamelCase',
                            subtitle: 'user_name → userName',
                            isSelected: _mode == ConversionMode.toCamel,
                            onTap: () {
                              setState(() {
                                _mode = ConversionMode.toCamel;
                                _convert();
                              });
                            },
                          ),
                          _buildModeTab(
                            title: 'To SnakeCase',
                            subtitle: 'userName → user_name',
                            isSelected: _mode == ConversionMode.toSnake,
                            onTap: () {
                              setState(() {
                                _mode = ConversionMode.toSnake;
                                _convert();
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // 옵션 선택 영역 (CamelCase 모드일 때만 표시)
                if (_mode == ConversionMode.toCamel) ...[
                  Wrap(
                    spacing: 16,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text('세부 옵션:', style: TextStyle(fontWeight: FontWeight.bold)),
                      ChoiceChip(
                        label: const Text('camelCase (소문자 시작)'),
                        selected: !_isFirstLetterUpperCase,
                        onSelected: (selected) {
                          setState(() {
                            _isFirstLetterUpperCase = !selected;
                          });
                          _convert();
                        },
                      ),
                      ChoiceChip(
                        label: const Text('PascalCase (대문자 시작)'),
                        selected: _isFirstLetterUpperCase,
                        onSelected: (selected) {
                          setState(() {
                            _isFirstLetterUpperCase = selected;
                          });
                          _convert();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],

                // 입력 및 결과 영역 (반응형 레이아웃)
                if (isWideScreen)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: _inputController,
                          label: '입력 (Input)',
                          hint: _mode == ConversionMode.toCamel
                              ? '변환할 텍스트를 입력하세요.\n예:\nuser_name\nget-user-id'
                              : 'CamelCase 텍스트를 입력하세요.\n예:\nuserName\nGetUserList',
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
                        hint: _mode == ConversionMode.toCamel
                            ? '변환할 텍스트를 입력하세요.\n예:\nuser_name\nget-user-id'
                            : 'CamelCase 텍스트를 입력하세요.\n예:\nuserName\nGetUserList',
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

  Widget _buildModeTab({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.black54 : Colors.grey.shade400,
                ),
              ),
            ],
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
