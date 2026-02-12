// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// 웹 브라우저의 페이지 타이틀을 동적으로 변경합니다.
/// Flutter Web에서만 동작합니다.
void setPageTitle(String title) {
  html.document.title = title;
}

/// 웹 브라우저의 meta description을 동적으로 변경합니다.
void setPageMeta(String description) {
  final meta = html.document.querySelector('meta[name="description"]');
  if (meta != null) {
    meta.setAttribute('content', description);
  }
}
