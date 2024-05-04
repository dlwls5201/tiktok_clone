import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import 'constants/Gaps.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  //home: Padding(
  //         padding: const EdgeInsets.all(Sizes.size14),
  //         child: Container(
  //           child: Row(children: const [
  //             Text('hello'),
  //             Gaps.h20,
  //             Text('hello'),
  //           ]),
  //         ),
  //       ),
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok clone',
      theme: ThemeData(
        primaryColor: const Color(0xFFE9435A),
        useMaterial3: true,
      ),
      home: const Padding(
        padding: EdgeInsets.all(Sizes.size14),
        child: Row(
          children: [Text("hello"), Gaps.h20, Text("hello")],
        ),
      ),
    );
  }
}
