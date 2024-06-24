import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/thread/screens/profile/thread_profile_screen.dart';
import 'package:tiktok_clone/assignment/thread/screens/search/thrad_search_screen.dart';

import 'activity/thread_activity_screen.dart';
import 'home/thread_home_screen.dart';
import 'home/widgets/thread_nav_tab.dart';
import 'new_thread/new_thread_bottom_sheet.dart';

class ThreadMainNavigationScreen extends StatefulWidget {
  static const routeURL = "/thread";
  static const routeName = "threadMain";

  const ThreadMainNavigationScreen({super.key});

  @override
  State<ThreadMainNavigationScreen> createState() => _ThreadMainNavigationScreenState();
}

class _ThreadMainNavigationScreenState extends State<ThreadMainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNewThreadTap() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const NewThreadBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Visibility(
            visible: _selectedIndex == 0,
            child: ThreadHomeScreen(),
          ),
          Visibility(
            visible: _selectedIndex == 1,
            child: const ThreadSearchScreen(),
          ),
          Visibility(
            visible: _selectedIndex == 3,
            child: const ThreadActivityScreen(),
          ),
          Visibility(
            visible: _selectedIndex == 4,
            child: const ThreadProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: Row(
                  children: [
                    ThreadNavTab(
                      isSelected: _selectedIndex == 0,
                      icon: FontAwesomeIcons.house,
                      onTap: () => _onTap(0),
                    ),
                    ThreadNavTab(
                      isSelected: _selectedIndex == 1,
                      icon: FontAwesomeIcons.magnifyingGlass,
                      onTap: () => _onTap(1),
                    ),
                    ThreadNavTab(
                      isSelected: false,
                      icon: FontAwesomeIcons.squareCheck,
                      onTap: _onNewThreadTap,
                    ),
                    ThreadNavTab(
                      isSelected: _selectedIndex == 3,
                      icon: FontAwesomeIcons.heart,
                      onTap: () => _onTap(3),
                    ),
                    ThreadNavTab(
                      isSelected: _selectedIndex == 4,
                      icon: FontAwesomeIcons.user,
                      onTap: () => _onTap(4),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
