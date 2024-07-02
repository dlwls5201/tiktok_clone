import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/constants/Gaps.dart';

import '../../../../constants/sizes.dart';
import '../../../../features/authentication/view_models/login_view_mode.dart';
import '../../../../features/authentication/view_models/signup_view_model.dart';
import '../../../../features/authentication/widgets/form_button.dart';

class ThreadSignUpScreen extends ConsumerStatefulWidget {
  static const routeName = "threadSignUp";
  static const routeURL = "/thread_sign_up";

  const ThreadSignUpScreen({super.key});

  @override
  ConsumerState<ThreadSignUpScreen> createState() => _ThreadSignUpScreenState();
}

class _ThreadSignUpScreenState extends ConsumerState<ThreadSignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSignupTap() {
    final currentState = _formKey.currentState;
    if (currentState != null) {
      if (currentState.validate()) {
        currentState.save();
        final email = formData["email"];
        final password = formData["password"];

        ref.read(signUpForm.notifier).state = {
          "email": email,
          "password": password,
        };
        ref.read(signUpProvider.notifier).signUp(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
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
                      onTap: _onSignupTap,
                      child: FormButton(
                        title: "Sign up",
                        disabled: ref.watch(loginProvider).isLoading,
                      ),
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
