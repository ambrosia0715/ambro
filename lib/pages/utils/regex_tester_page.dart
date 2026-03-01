import 'package:flutter/material.dart';

class RegexTesterPage extends StatefulWidget {
  const RegexTesterPage({super.key});

  @override
  State<RegexTesterPage> createState() => _RegexTesterPageState();
}

class _RegexTesterPageState extends State<RegexTesterPage> {
  final TextEditingController _regexController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  
  bool _isCaseSensitive = true;
  bool _isMultiLine = false;
  bool _isDotAll = false;
  
  List<RegExpMatch> _matches = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _regexController.addListener(_updateMatches);
    _textController.addListener(_updateMatches);
  }

  @override
  void dispose() {
    _regexController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _updateMatches() {
    final pattern = _regexController.text;
    final text = _textController.text;

    if (pattern.isEmpty || text.isEmpty) {
      setState(() {
        _matches = [];
        _error = null;
      });
      return;
    }

    try {
      final regex = RegExp(
        pattern,
        caseSensitive: _isCaseSensitive,
        multiLine: _isMultiLine,
        dotAll: _isDotAll,
      );
      
      setState(() {
        _matches = regex.allMatches(text).toList();
        _error = null;
      });
    } catch (e) {
      setState(() {
        _matches = [];
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  'Regex Tester',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '정규표현식(Regular Expression)을 실시간으로 테스트하고 매칭 결과를 확인하세요.',
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
                      Text('• Pattern: 정규표현식을 입력하세요. (예: ^[a-zA-Z0-9]+@)', style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Text('• Test String: 테스트할 텍스트를 입력하면 실시간으로 매칭 결과를 하단에 표시합니다.', style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Text('• Flags: Case Sensitive(대소문자 구분), Multi Line(여러 줄), Dot All(.이 개행 포함) 옵션을 선택할 수 있습니다.', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Regex Input & Flags
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('정규표현식 (Pattern)', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _regexController,
                        style: const TextStyle(fontFamily: 'monospace', fontSize: 16),
                        decoration: InputDecoration(
                          hintText: '예: ^[a-zA-Z0-9]+@',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                          errorText: _error,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 16,
                        children: [
                          _buildFlagCheckbox('Case Sensitive (i)', _isCaseSensitive, (v) => setState(() { _isCaseSensitive = v!; _updateMatches(); })),
                          _buildFlagCheckbox('Multi Line (m)', _isMultiLine, (v) => setState(() { _isMultiLine = v!; _updateMatches(); })),
                          _buildFlagCheckbox('Dot All (s)', _isDotAll, (v) => setState(() { _isDotAll = v!; _updateMatches(); })),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Test String Input
                const Text('테스트 문자열 (Test String)', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    controller: _textController,
                    maxLines: null,
                    expands: true,
                    style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
                    decoration: const InputDecoration(
                      hintText: '테스트할 텍스트를 입력하세요...',
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Match Results
                Row(
                  children: [
                    const Text('매칭 결과 (Matches)', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: _matches.isNotEmpty ? Colors.green.shade100 : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${_matches.length} matches',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: _matches.isNotEmpty ? Colors.green.shade800 : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: _matches.isEmpty
                      ? const Text('매칭된 결과가 없습니다.', style: TextStyle(color: Colors.grey))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _matches.asMap().entries.map((entry) {
                            final index = entry.key;
                            final match = entry.value;
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Match ${index + 1}: "${match.group(0)}"', 
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'monospace')),
                                  const SizedBox(height: 4),
                                  Text('Range: [${match.start}, ${match.end}]', 
                                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                                  if (match.groupCount > 0) ...[
                                    const SizedBox(height: 4),
                                    const Text('Groups:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                    for (int i = 1; i <= match.groupCount; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('$i: "${match.group(i)}"', 
                                          style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
                                      ),
                                  ],
                                ],
                              ),
                            );
                          }).toList(),
                        ),
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
            '정규표현식(Regular Expression)은 텍스트에서 패턴을 찾거나 검증할 때 쓰는 강력한 문법입니다. '
            '이메일·전화번호·URL 검증, 로그 파싱, 검색·치환 등에 활용됩니다. '
            '여기서는 패턴을 입력하고 테스트 문자열과 비교해 매칭 결과와 그룹을 바로 확인할 수 있어, 개발·디버깅 시 유용합니다.',
            style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildFlagCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text(label),
      ],
    );
  }
}
