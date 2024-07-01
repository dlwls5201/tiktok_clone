import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/assignment/thread/screens/authentication/thread_sign_up_screen.dart';
import 'package:tiktok_clone/constants/Gaps.dart';

import '../../../../constants/sizes.dart';
import '../../../../features/authentication/view_models/login_view_mode.dart';
import '../../../../features/authentication/widgets/form_button.dart';

class ThreadLoginScreen extends ConsumerStatefulWidget {
  static const routeName = "threadLogin";
  static const routeURL = "/thread_login";

  const ThreadLoginScreen({super.key});

  @override
  ConsumerState<ThreadLoginScreen> createState() => _ThreadLoginScreenState();
}

class _ThreadLoginScreenState extends ConsumerState<ThreadLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onLoginTap() {
    final currentState = _formKey.currentState;
    if (currentState != null) {
      if (currentState.validate()) {
        currentState.save();
        ref.read(loginProvider.notifier).login(
              formData["email"]!,
              formData["password"]!,
              context,
            );
        // context.goNamed(InterestScreen.routeName);
      }
    }
  }

  void _onSignupTap() {
    context.pushNamed(ThreadSignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Gaps.v80,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "https://i.namu.wiki/i/V-exl1sMCq28grTqHjeaJTA9_X86ce2QDpC8wCtF1kI0HIhOsiYyiQPAmAkZxa5icS894UdU07lIvI--jjV1Jg.webp",
                        fit: BoxFit.cover,
                        width: Sizes.size80,
                        height: Sizes.size80,
                      ),
                    ),
                    Gaps.v80,
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Please write your email";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["email"] = newValue;
                        }
                      },
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                    Gaps.v16,
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Please write your password";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["password"] = newValue;
                        }
                      },
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                    Gaps.v16,
                    GestureDetector(
                      onTap: _onLoginTap,
                      child: FormButton(
                        title: "Log in",
                        disabled: ref.watch(loginProvider).isLoading,
                      ),
                    ),
                    const SizedBox(height: 160),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: _onSignupTap,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: Sizes.size8),
                                child: Text(
                                  "Create new account",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gaps.v16,
                        Text(
                          "Meta",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
