import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/utils.dart';

import '../../../../../constants/sizes.dart';

class ThreadPersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode(context) ? Colors.black : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black,
        labelColor: isDarkMode(context) ? Colors.white : Colors.black,
        unselectedLabelColor: Colors.grey.shade400,
        labelPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        tabs: const [
          SizedBox(
            height: 47,
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 47,
            child: Text(
              "Replies",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
