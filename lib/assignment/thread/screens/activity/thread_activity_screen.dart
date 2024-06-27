import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/assignment/thread/common/thread_config.dart';
import 'package:tiktok_clone/utils.dart';

import '../../../../constants/Gaps.dart';
import '../../../../constants/sizes.dart';
import '../../model/user.dart';

class ThreadActivityScreen extends StatefulWidget {
  static const routeURL = "activity";
  static const routeName = "threadActivity";

  const ThreadActivityScreen({super.key});

  @override
  State<ThreadActivityScreen> createState() => _ThreadActivityScreenState();
}

class _ThreadActivityScreenState extends State<ThreadActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = [
    "All",
    "Replies",
    "Mentions",
    "Sounds",
    "All2",
    "Replies2",
    "Mentions2",
    "Sounds2",
  ];

  late var currentTabLabel = tabs[0];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        currentTabLabel = tabs[_tabController.index];
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      animationDuration: Duration.zero,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text(
            "Activity",
            style: TextStyle(
              fontSize: Sizes.size20,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            dividerHeight: 0,
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            indicator: const BoxDecoration(),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelPadding: const EdgeInsets.only(
              left: Sizes.size8,
            ),
            tabs: [
              for (var tab in tabs)
                Tab(
                  child: Container(
                    width: 120,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                      vertical: Sizes.size10,
                    ),
                    decoration: currentTabLabel == tab
                        ? BoxDecoration(
                            color:
                                isDarkMode(context) || context.read<ThreadConfig>().isDarkMode ? Theme.of(context).primaryColor : Colors.black,
                            borderRadius: BorderRadius.circular(
                              Sizes.size16,
                            ),
                          )
                        : BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              Sizes.size16,
                            ),
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: Sizes.size1,
                            ),
                          ),
                    child: Text(tab),
                  ),
                ),
            ],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: Sizes.size8),
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListView(
                children: [
                  for (final user in SearchUser.values + SearchUser.values)
                    Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            foregroundImage: NetworkImage(
                              user.thumb,
                            ),
                          ),
                          title: Row(
                            children: [
                              Text(
                                user.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Gaps.h6,
                              Text(
                                "4h",
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.isFollow ? "Followed you" : "Mentioned you",
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              user.isFollow
                                  ? Container()
                                  : Column(
                                      children: [
                                        Gaps.v2,
                                        Text(
                                          user.subTitle,
                                          style: const TextStyle(
                                            fontSize: Sizes.size14,
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          trailing: user.isFollow
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        16,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: Sizes.size2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size20,
                                      vertical: Sizes.size6,
                                    ),
                                    child: Text(
                                      "Following",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w400,
                                        fontSize: Sizes.size14,
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        Gaps.v6,
                        Divider(
                          height: 1,
                          thickness: 1,
                          indent: Sizes.size80,
                          endIndent: Sizes.size16,
                          color: Colors.grey.shade200,
                        ),
                      ],
                    ),
                ],
              ),
              for (var tab in tabs.skip(1))
                Tab(
                  child: Center(
                    child: Text(
                      tab,
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
