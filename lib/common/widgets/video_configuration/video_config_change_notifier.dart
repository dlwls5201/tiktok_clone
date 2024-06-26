import 'package:flutter/widgets.dart';

class VideoConfigChangeNotifier extends ChangeNotifier {
  bool autoMute = true;

  void toggleMuted() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfigChangeNotifier = VideoConfigChangeNotifier();
