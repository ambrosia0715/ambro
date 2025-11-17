import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import '../pages/apps_page.dart';
import '../pages/nunchi_game_page.dart';
import '../pages/water_buddy_page.dart';
import '../pages/ongi_page.dart';
import '../pages/privacy_page.dart';
import '../pages/nunchi_privacy_page.dart';
import '../pages/water_buddy_privacy_page.dart';
import '../pages/ongi_privacy_page.dart';
import '../pages/contact_page.dart';
import '../widgets/main_layout.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/apps',
          builder: (context, state) => const AppsPage(),
        ),
        GoRoute(
          path: '/apps/play/nunchi-game',
          builder: (context, state) => const NunchiGamePage(),
        ),
        GoRoute(
          path: '/apps/mate/water-buddy',
          builder: (context, state) => const WaterBuddyPage(),
        ),
        GoRoute(
          path: '/apps/aicent/ongi',
          builder: (context, state) => const OngiPage(),
        ),
        GoRoute(
          path: '/privacy',
          builder: (context, state) => const PrivacyPage(),
        ),
        GoRoute(
          path: '/privacy/nunchi-game',
          builder: (context, state) => const NunchiPrivacyPage(),
        ),
        GoRoute(
          path: '/privacy/water-buddy',
          builder: (context, state) => const WaterBuddyPrivacyPage(),
        ),
        GoRoute(
          path: '/privacy/ongi',
          builder: (context, state) => const OngiPrivacyPage(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactPage(),
        ),
      ],
    ),
  ],
);
