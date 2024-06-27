import 'package:flutter/widgets.dart';

class ThreadConfig extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleIsDartMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}