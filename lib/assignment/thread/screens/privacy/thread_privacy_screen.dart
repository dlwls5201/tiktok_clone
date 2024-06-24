import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/Gaps.dart';

import '../../../../constants/sizes.dart';

class ThreadPrivacyScreen extends StatefulWidget {
  static const routeURL = "privacy";
  static const routeName = "threadPrivacy";

  const ThreadPrivacyScreen({super.key});

  @override
  State<ThreadPrivacyScreen> createState() => _ThreadPrivacyScreenState();
}

class _ThreadPrivacyScreenState extends State<ThreadPrivacyScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Privacy"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size8,
        ),
        child: ListView(
          children: [
            SwitchListTile.adaptive(
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: const Text("Private profile"),
              secondary: const FaIcon(FontAwesomeIcons.lock),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.at),
              title: const Text("Mentions"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Everyone",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h6,
                  FaIcon(
                    FontAwesomeIcons.angleRight,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.bellSlash),
              title: const Text("Muted"),
              trailing: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.grey.shade400,
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.eyeSlash),
              title: const Text("Hidden Words"),
              trailing: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.grey.shade400,
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.userGroup),
              title: const Text("Profiles you follow"),
              trailing: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.grey.shade400,
              ),
            ),
            Container(
              color: Colors.grey.shade200,
              width: double.infinity,
              height: 1,
            ),
            ListTile(
              title: const Text("Other privacy settings"),
              subtitle: Text(
                "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram",
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                color: Colors.grey.shade400,
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.circleXmark),
              title: const Text("Blocked profiles"),
              trailing: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                color: Colors.grey.shade400,
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.heartCircleXmark),
              title: const Text("Hide likes"),
              trailing: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
