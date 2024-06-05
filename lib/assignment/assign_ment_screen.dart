import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/craete_account_screen.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.blue,
              size: 30,
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "See What's happening in the world right now.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 2,
                  color: Colors.grey.shade400,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://image.similarpng.com/very-thumbnail/2020/06/Logo-google-icon-PNG.png",
                      scale: 24,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Continue with Google",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 2,
                  color: Colors.grey.shade400,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.apple,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Continue with Apple",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.grey.shade400,
                  height: 1,
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("or"),
                ),
                Expanded(
                    child: Container(
                  color: Colors.grey.shade400,
                  height: 1,
                )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => _onCreateAccountTap(context),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: const TextSpan(
                    text: "Have an account already? ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
