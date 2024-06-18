import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import '../../privacy/thread_privacy_screen.dart';

class ThreadSettingsScreen extends StatelessWidget {
  const ThreadSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
        ),
        children: [
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.userPlus),
            title: Text("Follow and invite friends"),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.solidBell),
            title: Text("Notifications"),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.lock),
            title: const Text("Privacy"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ThreadPrivacyScreen(),
                ),
              );
            },
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.solidCircleUser),
            title: Text("Account"),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.lifeRing),
            title: Text("Help"),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.circleInfo),
            title: Text("about"),
          ),
          ListTile(
            title: const Text(
              "Log out (Android)",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("logout"),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Text("No"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Log out (ios)",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("logout"),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Text("No"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
