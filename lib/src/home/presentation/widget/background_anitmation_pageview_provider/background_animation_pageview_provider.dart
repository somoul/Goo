import 'dart:async';

import 'package:flutter/widgets.dart';

class BackgroundAnimationPageViewProvider extends ChangeNotifier {
  int get index => _index;
  int _index = 0;
  BackgroundAnimationPageViewProvider() {
    int i = 0;
    Timer.periodic(const Duration(seconds: 1), (_) {
      if (i > 5) {
        i = 0;
      }
      _index = i++;
      notifyListeners();
    });
  }
}
