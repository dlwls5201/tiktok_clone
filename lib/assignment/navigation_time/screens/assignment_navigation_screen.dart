import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/navigation_time/widgets/assignment_nav_tab_widget.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import 'assignment_thread_home_screen.dart';

class AssignmentNavigationScreen extends StatefulWidget {
  const AssignmentNavigationScreen({super.key});

  @override
  State<AssignmentNavigationScreen> createState() =>
      _AssignmentNavigationScreenState();
}

class _AssignmentNavigationScreenState
    extends State<AssignmentNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Visibility(
            visible: _selectedIndex == 0,
            child: AssignmentThreadHomeScreen(),
          ),
          Visibility(
            visible: _selectedIndex == 1,
            child: Center(
              child: Text(
                "Screen #$_selectedIndex",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _selectedIndex == 2,
            child: Center(
              child: Text(
                "Screen #$_selectedIndex",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _selectedIndex == 3,
            child: Center(
              child: Text(
                "Screen #$_selectedIndex",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _selectedIndex == 4,
            child: Center(
              child: Text(
                "Screen #$_selectedIndex",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                    AssignmentNavTab(
                      isSelected: _selectedIndex == 0,
                      icon: FontAwesomeIcons.house,
                      onTap: () => _onTap(0),
                    ),
                    AssignmentNavTab(
                      isSelected: _selectedIndex == 1,
                      icon: FontAwesomeIcons.magnifyingGlass,
                      onTap: () => _onTap(1),
                    ),
                    AssignmentNavTab(
                      isSelected: _selectedIndex == 2,
                      icon: FontAwesomeIcons.squareCheck,
                      onTap: () => _onTap(2),
                    ),
                    AssignmentNavTab(
                      isSelected: _selectedIndex == 3,
                      icon: FontAwesomeIcons.heart,
                      onTap: () => _onTap(3),
                    ),
                    AssignmentNavTab(
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
