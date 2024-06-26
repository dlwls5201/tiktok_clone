import 'package:flutter/widgets.dart';

class VideoConfig2 extends ChangeNotifier {
  bool autoMute = true;

  void toggleMuted() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoConfig2();
