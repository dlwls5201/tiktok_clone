import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/Gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

import '../../utils.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const routeURL = "/";
  static const routeName = "signUp";

  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    context.goNamed(LoginScreen.routeName);
  }

  void onEmailTap(BuildContext context) {
    context.goNamed(UsernameScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(
                children: [
                  Gaps.v80,
                  const Text(
                    "Sign up for TikTok",
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                    "Create a profile, follow other accounts, make your own videos, and more",
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => onEmailTap(context),
                      child: const AuthButton(
                        icon: FaIcon(FontAwesomeIcons.user),
                        text: "Use email & password",
                      ),
                    ),
                    Gaps.v16,
                    const AuthButton(
                      icon: FaIcon(FontAwesomeIcons.apple),
                      text: "Continue with Apple",
                    )
                  ],
                  if(orientation == Orientation.landscape)
                      Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => onEmailTap(context),
                                child: const AuthButton(
                                  icon: FaIcon(FontAwesomeIcons.user),
                                  text: "Use email & password",
                                ),
                              ),
                            ),
                            Gaps.h16,
                            const Expanded(
                              child: AuthButton(
                                icon: FaIcon(FontAwesomeIcons.apple),
                                text: "Continue with Apple",
                              ),
                            )
                          ],
                      )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            padding: const EdgeInsets.only(
              top: Sizes.size32,
              bottom: Sizes.size32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                  "Already have an account?",
                ),
                Gaps.h5,
                GestureDetector(
                  onTap: () => onLoginTap(context),
                  child: Text(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                    "Log in?",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
