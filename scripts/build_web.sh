#!/bin/bash
# Flutter 웹 빌드 + SEO 프리렌더링 통합 스크립트
# 사용: bash scripts/build_web.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== 1/2: Flutter 웹 빌드 ==="
cd "$PROJECT_DIR"
flutter build web --release

echo ""
echo "=== 2/2: SEO 프리렌더링 ==="
python3 "$SCRIPT_DIR/generate_seo_pages.py"

echo ""
echo "=== 빌드 완료! ==="
echo "build/web/ 디렉토리에 SEO 최적화된 결과물이 생성되었습니다."
echo "로컬 확인: cd build/web && python3 -m http.server 8080"
