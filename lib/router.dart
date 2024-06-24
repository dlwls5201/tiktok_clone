import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/user/user_profile_screen.dart';

import 'assignment/thread/screens/activity/thread_activity_screen.dart';
import 'assignment/thread/screens/home/thread_home_screen.dart';
import 'assignment/thread/screens/privacy/thread_privacy_screen.dart';
import 'assignment/thread/screens/profile/thread_profile_screen.dart';
import 'assignment/thread/screens/search/thrad_search_screen.dart';
import 'assignment/thread/screens/settings/thread_settings_screen.dart';
import 'assignment/thread/screens/thread_main_navigation_screen.dart';
import 'features/main_navigation/main_navigation_screen.dart';

final router = GoRouter(
  initialLocation: ThreadMainNavigationScreen.routeURL,
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
      routes: [
        GoRoute(
          name: UsernameScreen.routeName,
          path: UsernameScreen.routeURL,
          builder: (context, state) => const UsernameScreen(),
          routes: [
            GoRoute(
              name: EmailScreen.routeName,
              path: EmailScreen.routeURL,
              builder: (context, state) {
                final args = state.extra as EmailScreenArgs;
                return EmailScreen(username: args.username);
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.pathParameters['username'];
        final tab = state.uri.queryParameters["show"];
        return UserProfileScreen(
          username: username ?? "",
          tab: tab ?? "",
        );
      },
    ),
    GoRoute(
      name: MainNavigationScreen.routeName,
      path: MainNavigationScreen.routeURL,
      builder: (context, state) => const MainNavigationScreen(),
    ),

    /**
     * Thread
     */
    GoRoute(
        name: ThreadMainNavigationScreen.routeName,
        path: ThreadMainNavigationScreen.routeURL,
        builder: (context, state) => const ThreadMainNavigationScreen(),
        routes: [
          GoRoute(
            name: ThreadHomeScreen.routeName,
            path: ThreadHomeScreen.routeURL,
            builder: (context, state) => ThreadHomeScreen(),
          ),
          GoRoute(
            name: ThreadSearchScreen.routeName,
            path: ThreadSearchScreen.routeURL,
            builder: (context, state) => const ThreadSearchScreen(),
          ),
          GoRoute(
            name: ThreadActivityScreen.routeName,
            path: ThreadActivityScreen.routeURL,
            builder: (context, state) => const ThreadActivityScreen(),
          ),
          GoRoute(
            name: ThreadProfileScreen.routeName,
            path: ThreadProfileScreen.routeURL,
            builder: (context, state) => const ThreadProfileScreen(),
          ),
          GoRoute(
              name: ThreadSettingsScreen.routeName,
              path: ThreadSettingsScreen.routeURL,
              builder: (context, state) => const ThreadSettingsScreen(),
              routes: [
                GoRoute(
                  name: ThreadPrivacyScreen.routeName,
                  path: ThreadPrivacyScreen.routeURL,
                  builder: (context, state) => const ThreadPrivacyScreen(),
                ),
              ]),
        ]),
  ],
);
