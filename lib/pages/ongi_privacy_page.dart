import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 온기(Ongi) 앱 개인정보처리방침 페이지
/// 앱에서 수집하는 개인정보와 처리 방침을 안내하는 페이지입니다.
class OngiPrivacyPage extends StatelessWidget {
  const OngiPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 뒤로가기 버튼
                TextButton.icon(
                  onPressed: () => context.go('/apps/aicent/ongi'),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('앱 정보로 돌아가기'),
                ),
                const SizedBox(height: 24),

                // 제목
                const Text(
                  '온기 (Ongi) 개인정보처리방침',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '최종 업데이트: 2025년 11월 17일',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '시행일: 2025년 11월 17일',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 32),

                // 1. 개인정보처리방침의 의의
                _SectionCard(
                  title: '1. 개인정보처리방침의 의의',
                  children: [
                    Text(
                      '온기(Ongi, 이하 "본 앱")는 이용자의 개인정보를 소중하게 생각하며, 「개인정보 보호법」 및 관련 법령을 준수하여 이용자의 개인정보를 보호하기 위해 최선을 다하고 있습니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '본 개인정보처리방침은 본 앱이 제공하는 서비스 이용 시 수집되는 개인정보의 항목, 수집 및 이용 목적, 보유 및 이용 기간, 개인정보의 제3자 제공, 이용자의 권리 및 행사 방법 등을 안내합니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 2. 수집하는 개인정보의 항목 및 수집 방법
                _SectionCard(
                  title: '2. 수집하는 개인정보의 항목 및 수집 방법',
                  children: [
                    const Text(
                      '2.1 수집하는 개인정보 항목',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '필수 수집 항목',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '인증 정보'),
                    _BulletPoint(
                        text: '  - 이메일 주소 (이메일 회원가입 시)'),
                    _BulletPoint(
                        text:
                            '  - 비밀번호 (Firebase Authentication에서 암호화하여 저장)'),
                    _BulletPoint(
                        text:
                            '  - Google 계정 정보 (Google 로그인 시): 이메일, 이름, 프로필 사진 URL'),
                    const SizedBox(height: 12),
                    _BulletPoint(text: '일기 데이터'),
                    _BulletPoint(
                        text: '  - 작성한 일기 내용 (감정, 목표, 할 일, 마음 한 줄)'),
                    _BulletPoint(text: '  - AI 코멘트'),
                    _BulletPoint(text: '  - 작성 일시 및 수정 일시'),
                    const SizedBox(height: 12),
                    _BulletPoint(text: '사용자 프로필 정보'),
                    _BulletPoint(text: '  - 프리미엄 구독 여부'),
                    _BulletPoint(text: '  - AI 사용 횟수 및 마지막 사용 일자'),
                    _BulletPoint(text: '  - 계정 생성 일시'),
                    const SizedBox(height: 16),
                    const Text(
                      '자동 수집 항목',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '기기 정보'),
                    _BulletPoint(
                        text: '  - 기기 모델, 운영체제 버전, 고유 식별자 (디바이스 ID)'),
                    _BulletPoint(text: '  - 앱 버전 정보'),
                    const SizedBox(height: 12),
                    _BulletPoint(text: '서비스 이용 정보'),
                    _BulletPoint(
                        text: '  - 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보'),
                    const SizedBox(height: 16),
                    const Text(
                      '2.2 수집 방법',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '앱 내 회원가입 및 로그인 과정에서 직접 입력'),
                    _BulletPoint(text: 'Google 로그인을 통한 자동 수집'),
                    _BulletPoint(text: '서비스 이용 과정에서 자동 생성 및 수집'),
                  ],
                ),
                const SizedBox(height: 24),

                // 3. 개인정보의 수집 및 이용 목적
                _SectionCard(
                  title: '3. 개인정보의 수집 및 이용 목적',
                  children: [
                    const Text(
                      '본 앱은 다음의 목적을 위해 개인정보를 수집 및 이용합니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '3.1 서비스 제공',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '회원 가입 및 관리, 본인 확인'),
                    _BulletPoint(text: '일기 작성, 저장, 조회 서비스 제공'),
                    _BulletPoint(text: 'AI 코멘트 생성 서비스 제공'),
                    _BulletPoint(text: '일기 히스토리 및 통계 서비스 제공'),
                    _BulletPoint(text: '데이터 백업 및 복원 서비스 제공'),
                    const SizedBox(height: 12),
                    const Text(
                      '3.2 서비스 개선',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '서비스 품질 향상 및 신규 서비스 개발'),
                    _BulletPoint(text: '이용 통계 분석 및 서비스 개선'),
                    _BulletPoint(text: '오류 및 버그 수정'),
                    const SizedBox(height: 12),
                    const Text(
                      '3.3 마케팅 및 광고',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '맞춤형 광고 제공 (Google AdMob)'),
                    _BulletPoint(text: '서비스 관련 안내 및 공지사항 전달'),
                  ],
                ),
                const SizedBox(height: 24),

                // 4. 개인정보의 보유 및 이용 기간
                _SectionCard(
                  title: '4. 개인정보의 보유 및 이용 기간',
                  children: [
                    const Text(
                      '4.1 보유 기간',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                        text:
                            '회원 정보: 회원 탈퇴 시까지 (단, 관련 법령에 따라 일정 기간 보관 필요 시 해당 기간 동안 보관)'),
                    _BulletPoint(
                        text:
                            '일기 데이터: 회원 탈퇴 시까지 (이용자가 삭제 요청 시 즉시 삭제)'),
                    _BulletPoint(text: '로그 정보: 최대 1년'),
                    const SizedBox(height: 12),
                    const Text(
                      '4.2 법령에 따른 보관',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '계약 또는 청약철회 등에 관한 기록: 5년'),
                    _BulletPoint(text: '대금결제 및 재화 등의 공급에 관한 기록: 5년'),
                    _BulletPoint(text: '소비자의 불만 또는 분쟁처리에 관한 기록: 3년'),
                    _BulletPoint(text: '웹사이트 방문 기록: 3개월'),
                  ],
                ),
                const SizedBox(height: 24),

                // 5. 개인정보의 제3자 제공
                _SectionCard(
                  title: '5. 개인정보의 제3자 제공',
                  children: [
                    Text(
                      '본 앱은 원칙적으로 이용자의 개인정보를 외부에 제공하지 않습니다. 다만, 다음의 경우에는 예외로 합니다:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '5.1 서비스 제공을 위한 제3자 제공',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Firebase (Google)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _BulletPoint(text: '제공 항목: 이메일, 일기 데이터, 사용자 프로필 정보'),
                    _BulletPoint(
                        text: '이용 목적: 사용자 인증, 데이터 저장 및 동기화, 서비스 분석'),
                    _BulletPoint(text: '보유 기간: 회원 탈퇴 시까지'),
                    const SizedBox(height: 12),
                    const Text(
                      'OpenAI',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _BulletPoint(
                        text: '제공 항목: 일기 내용 (감정, 목표, 할 일, 마음 한 줄)'),
                    _BulletPoint(text: '이용 목적: AI 코멘트 생성'),
                    _BulletPoint(
                        text: '보유 기간: AI 코멘트 생성 후 즉시 삭제 (저장하지 않음)'),
                    const SizedBox(height: 12),
                    const Text(
                      'Google AdMob',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _BulletPoint(text: '제공 항목: 기기 정보, 광고 식별자'),
                    _BulletPoint(text: '이용 목적: 맞춤형 광고 제공'),
                    _BulletPoint(text: '보유 기간: 광고 제공 시까지'),
                    const SizedBox(height: 12),
                    const Text(
                      '5.2 법령에 의한 제공',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '법령에 의해 수사기관의 요청이 있는 경우'),
                    _BulletPoint(text: '법원의 영장이 발부된 경우'),
                    _BulletPoint(text: '기타 법령에 의해 요구되는 경우'),
                  ],
                ),
                const SizedBox(height: 24),

                // 6. 개인정보의 처리 위탁
                _SectionCard(
                  title: '6. 개인정보의 처리 위탁',
                  children: [
                    const Text(
                      '본 앱은 서비스 제공을 위해 다음 업체에 개인정보 처리 업무를 위탁하고 있습니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    Table(
                      border: TableBorder.all(color: Colors.grey.shade300),
                      children: [
                        const TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                          ),
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                '위탁 업체',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                '위탁 업무 내용',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                '보유 및 이용 기간',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('Google (Firebase)'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('사용자 인증, 데이터 저장 및 관리'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('회원 탈퇴 시까지'),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('Google (AdMob)'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('광고 서비스 제공'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('광고 제공 시까지'),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('OpenAI'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('AI 코멘트 생성'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text('서비스 제공 시까지'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 7. 이용자의 권리 및 행사 방법
                _SectionCard(
                  title: '7. 이용자의 권리 및 행사 방법',
                  children: [
                    const Text(
                      '7.1 이용자의 권리',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '이용자는 다음의 권리를 행사할 수 있습니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '개인정보 열람 요구'),
                    _BulletPoint(text: '개인정보 정정·삭제 요구'),
                    _BulletPoint(text: '개인정보 처리정지 요구'),
                    _BulletPoint(text: '개인정보의 수집·이용·제공에 대한 동의 철회'),
                    const SizedBox(height: 12),
                    const Text(
                      '7.2 권리 행사 방법',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '앱 내 설정 메뉴를 통해 문의'),
                    _BulletPoint(text: '이메일을 통한 요청'),
                    Text(
                      '개인정보 열람, 정정, 삭제, 처리정지 요구는 「개인정보 보호법」 시행령 제41조 제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있습니다.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '7.3 권리 행사 제한',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '법령에 특별한 규정이 있는 경우'),
                    _BulletPoint(
                        text: '다른 사람의 생명·신체를 해할 우려가 있는 경우'),
                    _BulletPoint(
                        text: '다른 사람의 재산과 이익을 부당하게 침해할 우려가 있는 경우'),
                    _BulletPoint(
                        text:
                            '공공기관이 법령 등에서 정하는 소관 업무의 수행을 위하여 불가피한 경우'),
                  ],
                ),
                const SizedBox(height: 24),

                // 8. 개인정보의 파기
                _SectionCard(
                  title: '8. 개인정보의 파기',
                  children: [
                    const Text(
                      '8.1 파기 절차',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '이용자가 회원 탈퇴를 요청하거나 개인정보 보유기간이 경과한 경우, 다음의 절차와 방법으로 개인정보를 파기합니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 8),
                    _NumberedPoint(number: '1', text: '파기 대상: 수집·이용 목적이 달성된 개인정보'),
                    _NumberedPoint(
                        number: '2', text: '파기 시점: 회원 탈퇴 요청 시 또는 보유기간 경과 시'),
                    _NumberedPoint(
                        number: '3',
                        text:
                            '파기 방법: 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제'),
                    const SizedBox(height: 12),
                    const Text(
                      '8.2 파기 예외',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '관련 법령에 따라 보관이 필요한 경우'),
                    _BulletPoint(text: '분쟁 해결을 위해 필요한 경우'),
                  ],
                ),
                const SizedBox(height: 24),

                // 9. 개인정보 보호책임자
                _SectionCard(
                  title: '9. 개인정보 보호책임자',
                  children: [
                    const Text(
                      '본 앱은 이용자의 개인정보 보호를 위해 다음과 같이 개인정보 보호책임자를 지정하고 있습니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 16),
                    _ContactItem(
                      icon: Icons.business,
                      label: '책임자',
                      value: 'Ambro (엠브로)',
                    ),
                    _ContactItem(
                      icon: Icons.email,
                      label: '연락처',
                      value: '앱 내 설정 메뉴를 통해 문의',
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 10. 개인정보의 안전성 확보 조치
                _SectionCard(
                  title: '10. 개인정보의 안전성 확보 조치',
                  children: [
                    const Text(
                      '본 앱은 이용자의 개인정보를 안전하게 보호하기 위해 다음과 같은 조치를 취하고 있습니다:',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '10.1 기술적 조치',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '개인정보를 암호화하여 저장 및 전송'),
                    _BulletPoint(text: 'Firebase의 보안 기능을 활용한 데이터 보호'),
                    _BulletPoint(text: '정기적인 보안 점검 및 취약점 분석'),
                    const SizedBox(height: 12),
                    const Text(
                      '10.2 관리적 조치',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '개인정보 처리에 대한 접근 권한 관리'),
                    _BulletPoint(text: '개인정보 처리 담당자의 최소화 및 교육'),
                    const SizedBox(height: 12),
                    const Text(
                      '10.3 물리적 조치',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '서버 및 데이터베이스의 물리적 보안 관리'),
                  ],
                ),
                const SizedBox(height: 24),

                // 11. 쿠키 및 광고 식별자
                _SectionCard(
                  title: '11. 쿠키 및 광고 식별자',
                  children: [
                    const Text(
                      '11.1 쿠키',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '본 앱은 서비스 제공을 위해 쿠키를 사용할 수 있습니다. 쿠키는 웹사이트 방문 시 자동으로 생성되어 기기에 저장되는 작은 텍스트 파일입니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '11.2 광고 식별자',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: 'Android: Google Advertising ID'),
                    _BulletPoint(text: 'iOS: Identifier for Advertisers (IDFA)'),
                    const SizedBox(height: 8),
                    const Text(
                      '광고 식별자는 맞춤형 광고 제공을 위해 사용되며, 기기 설정에서 광고 추적을 제한할 수 있습니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 12. 개인정보처리방침의 변경
                _SectionCard(
                  title: '12. 개인정보처리방침의 변경',
                  children: [
                    Text(
                      '본 개인정보처리방침은 법령, 정책 또는 보안기술의 변경에 따라 내용의 추가, 삭제 및 수정이 있을 수 있습니다. 변경 사항은 앱 내 공지사항을 통해 안내하며, 중요한 변경 사항의 경우 별도의 고지 절차를 거칠 수 있습니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '변경 이력',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(text: '2025년 11월 17일: 최초 작성'),
                  ],
                ),
                const SizedBox(height: 24),

                // 13. 이용자 및 법정대리인의 권리와 그 행사 방법
                _SectionCard(
                  title: '13. 이용자 및 법정대리인의 권리와 그 행사 방법',
                  children: [
                    const Text(
                      '13.1 만 14세 미만 아동의 개인정보',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '본 앱은 만 14세 미만 아동의 개인정보를 수집하지 않습니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '13.2 법정대리인의 권리',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '만 14세 미만 아동의 법정대리인은 아동의 개인정보 열람, 정정, 삭제, 처리정지를 요구할 수 있습니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 14. 개인정보 보호 관련 문의
                _SectionCard(
                  title: '14. 개인정보 보호 관련 문의',
                  children: [
                    const Text(
                      '개인정보 보호와 관련하여 문의사항이 있으시면 앱 내 설정 메뉴를 통해 문의해주시기 바랍니다.',
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 푸터
                Card(
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          '개발자: Ambro (엠브로)',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '앱 버전: 1.0.0',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '최종 업데이트: 2025년 11월 17일',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '본 개인정보처리방침은 2025년 11월 17일부터 시행됩니다.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 섹션 카드 위젯
class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// 불릿 포인트 위젯
class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 번호가 있는 포인트 위젯
class _NumberedPoint extends StatelessWidget {
  final String number;
  final String text;

  const _NumberedPoint({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.6,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 연락처 아이템 위젯
class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

