import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/Gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/pasword_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not valid";
    }
    return null;
  }

  void _onScaffoldTab() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PasswordScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTab,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
                "What is your email?",
              ),
              Gaps.v16,
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailValid(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v28,
              GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                      title: "Next",
                      disabled: _email.isEmpty || _isEmailValid() != null)),
            ],
          ),
        ),
      ),
    );
  }
}