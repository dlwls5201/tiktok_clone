import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/onboarding/interest_screen.dart';

import 'assignment/thread/screens/thread_main_navigation_screen.dart';
import 'common/widgets/main_navigation/main_navigation_screen.dart';
import 'features/inbox/activity_screen.dart';
import 'features/inbox/chat_detail_screen.dart';
import 'features/inbox/chats_screen.dart';
import 'features/videos/video_recording_screen.dart';

final router = GoRouter(
  //initialLocation: SignUpScreen.routeURL,
  //initialLocation: "/home",
  initialLocation: ThreadMainNavigationScreen.routeURL,
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestScreen.routeName,
      path: InterestScreen.routeURL,
      builder: (context, state) => const InterestScreen(),
    ),
    GoRoute(
      name: MainNavigationScreen.routeName,
      path: "/:tab(home|discover|inbox|profile)",
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      name: ActivityScreen.routeName,
      path: ActivityScreen.routeURL,
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      name: ChatsScreen.routeName,
      path: ChatsScreen.routeURL,
      builder: (context, state) => const ChatsScreen(),
      routes: [
        GoRoute(
          name: ChatDetailScreen.routeName,
          path: ChatDetailScreen.routeURL,
          builder: (context, state) {
            final chatId = state.pathParameters["chatId"]!;
            return ChatDetailScreen(chatId: chatId);
          },
        ),
      ],
    ),
    GoRoute(
      name: VideoRecordingScreen.routeName,
      path: VideoRecordingScreen.routeURL,
      //builder: (context, state) => const VideoRecordingScreen(),
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        child: const VideoRecordingScreen(),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          final position = Tween(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: position,
            child: child,
          );
        },
      ),
    ),

    //assignment
    GoRoute(
      name: ThreadMainNavigationScreen.routeName,
      path: ThreadMainNavigationScreen.routeURL,
      builder: (context, state) => const ThreadMainNavigationScreen(),
    ),
  ],
);
