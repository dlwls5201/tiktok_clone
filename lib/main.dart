import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/assignment/thread/common/thread_config.dart';
import 'package:tiktok_clone/features/videos/repos/playback_config_repo.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/router.dart';

import 'constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //TODO prevent locate screen
  /*await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );*/

  // 라우터 이동 시, web url 변경 할 수 있게 해주는 함수
  GoRouter.optionURLReflectsImperativeAPIs = true;

  final preferences = await SharedPreferences.getInstance();
  final repository = PlaybackConfigRepository(preferences);

  runApp(
    MultiProvider(
      providers: [
        /*ChangeNotifierProvider(
          create: (context) => VideoConfig(),
        ),*/
        ChangeNotifierProvider(
          create: (context) => ThreadConfig(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlaybackConfigViewModel(repository),
        ),
      ],
      child: const TikTokApp(),
    ),
  );
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThreadConfig>(
      builder: (BuildContext context, threadProvider, Widget? child) {
        return MaterialApp.router(
          title: 'Tiktok clone',
          //: ThemeMode.system,
          themeMode: threadProvider.isDarkMode ? ThemeMode.dark : ThemeMode.system,
          routerConfig: router,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: const Color(0xFFE9435A),
            splashColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size18,
                fontWeight: FontWeight.w600,
              ),
            ),
            tabBarTheme: TabBarTheme(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.shade500,
              indicatorColor: Colors.black,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color(0xFFE9435A),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.grey.shade900,
            ),
            primaryColor: const Color(0xFFE9435A),
            appBarTheme: AppBarTheme(
              surfaceTintColor: Colors.black,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600,
              ),
              actionsIconTheme: IconThemeData(
                color: Colors.grey.shade100,
              ),
              iconTheme: IconThemeData(
                color: Colors.grey.shade100,
              ),
            ),
            tabBarTheme: TabBarTheme(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey.shade700,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color(0xFFE9435A),
            ),
          ),
        );
      },
    );
  }
}
