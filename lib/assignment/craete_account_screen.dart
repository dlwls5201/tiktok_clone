import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/signup_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  bool isShowDate = false;
  bool isCompleteName = false;
  bool isCompleteEmail = false;
  bool isCompleteDate = false;

  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
    _nameController.addListener(
      () {
        final text = _nameController.text;
        setState(() {
          isCompleteName = text.isNotEmpty;
        });
      },
    );
    _emailController.addListener(
      () {
        final text = _emailController.text;
        setState(() {
          isCompleteEmail = text.isNotEmpty;
        });
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    setState(() {
      isCompleteDate = true;
    });
  }

  void _onSubmitTap() {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String date = _birthdayController.text;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignupScreen(
          name: name,
          email: email,
          date: date,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 70,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    suffixText: isCompleteName ? "✅" : "",
                    hintText: "Name",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixText: isCompleteEmail ? "✅" : "",
                    hintText: "Email",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                isShowDate
                    ? TextField(
                        enabled: false,
                        controller: _birthdayController,
                        decoration: InputDecoration(
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
                      )
                    : GestureDetector(
                        onTap: () => {
                          setState(() {
                            isShowDate = true;
                          })
                        },
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: "Date of birth",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                isShowDate
                    ? SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                          maximumDate: initialDate,
                          initialDateTime: initialDate,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: _setTextFieldDate,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: _onSubmitTap,
              child: Container(
                decoration: BoxDecoration(
                  color: isCompleteDate ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
