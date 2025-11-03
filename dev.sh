#!/bin/bash

# Ambro 홈페이지 개발 헬퍼 스크립트

echo "🚀 Ambro 홈페이지 개발 도구"
echo ""
echo "무엇을 하시겠습니까?"
echo "1) 개발 서버 실행 (Chrome)"
echo "2) 웹 빌드 (Release)"
echo "3) 분석 실행"
echo "4) 의존성 업데이트"
echo "5) 종료"
echo ""
read -p "선택 (1-5): " choice

case $choice in
  1)
    echo "🌐 Chrome에서 개발 서버를 시작합니다..."
    flutter run -d chrome
    ;;
  2)
    echo "📦 웹 빌드를 시작합니다..."
    flutter build web --release
    echo "✅ 빌드 완료! build/web 폴더를 확인하세요."
    ;;
  3)
    echo "🔍 코드 분석을 실행합니다..."
    flutter analyze
    ;;
  4)
    echo "📥 의존성을 업데이트합니다..."
    flutter pub get
    ;;
  5)
    echo "👋 안녕히 가세요!"
    exit 0
    ;;
  *)
    echo "❌ 잘못된 선택입니다."
    exit 1
    ;;
esac
