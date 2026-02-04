import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import '../pages/about_page.dart';
import '../pages/about_apps_page.dart';
import '../pages/blog_list_page.dart';
import '../pages/blog_post_page.dart';
import '../pages/nunchi_game_page.dart';
import '../pages/water_buddy_page.dart';
import '../pages/pill_ping_page.dart';
import '../pages/ongi_page.dart';
import '../pages/privacy_page.dart';
import '../pages/nunchi_privacy_page.dart';
import '../pages/water_buddy_privacy_page.dart';
import '../pages/pill_ping_privacy_page.dart';
import '../pages/ongi_privacy_page.dart';
import '../pages/contact_page.dart';
import '../widgets/main_layout.dart';

// Helper for NoTransitionPage
Page<dynamic> _noTransitionPage(Widget child) {
  return NoTransitionPage(child: child);
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => _noTransitionPage(const HomePage()),
        ),
        // Blog Categories
        GoRoute(
          path: '/blog/:category',
          pageBuilder: (context, state) {
            final category = state.pathParameters['category']!;
            return _noTransitionPage(BlogListPage(category: category));
          },
          routes: [
            GoRoute(
              path: ':fileName',
              pageBuilder: (context, state) {
                final category = state.pathParameters['category']!;
                final fileName = state.pathParameters['fileName']!;
                return _noTransitionPage(
                    BlogPostPage(category: category, fileName: fileName));
              },
            ),
          ],
        ),
        // About & Apps
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) => _noTransitionPage(const AboutPage()),
        ),
        GoRoute(
          path: '/about/apps',
          pageBuilder: (context, state) =>
              _noTransitionPage(const AboutAppsPage()),
        ),
        GoRoute(
          path: '/apps/play/nunchi-game',
          pageBuilder: (context, state) =>
              _noTransitionPage(const NunchiGamePage()),
        ),
        GoRoute(
          path: '/apps/mate/water-buddy',
          pageBuilder: (context, state) =>
              _noTransitionPage(const WaterBuddyPage()),
        ),
        GoRoute(
          path: '/apps/mate/pill-ping',
          pageBuilder: (context, state) =>
              _noTransitionPage(const PillPingPage()),
        ),
        GoRoute(
          path: '/apps/aicent/ongi',
          pageBuilder: (context, state) => _noTransitionPage(const OngiPage()),
        ),
        // Privacy & Contact
        GoRoute(
          path: '/privacy',
          pageBuilder: (context, state) =>
              _noTransitionPage(const PrivacyPage()),
        ),
        GoRoute(
          path: '/privacy/nunchi-game',
          pageBuilder: (context, state) =>
              _noTransitionPage(const NunchiPrivacyPage()),
        ),
        GoRoute(
          path: '/privacy/water-buddy',
          pageBuilder: (context, state) =>
              _noTransitionPage(const WaterBuddyPrivacyPage()),
        ),
        GoRoute(
          path: '/privacy/pill-ping',
          pageBuilder: (context, state) =>
              _noTransitionPage(const PillPingPrivacyPage()),
        ),
        GoRoute(
          path: '/privacy/ongi',
          pageBuilder: (context, state) =>
              _noTransitionPage(const OngiPrivacyPage()),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) =>
              _noTransitionPage(const ContactPage()),
        ),
      ],
    ),
  ],
);
