import 'dart:async';

import 'package:flutter/material.dart';

class OTPCountdownProvider extends ChangeNotifier {
  int get index => _index;
  int _index = 59;
  Timer? countdownTimer;

  changeIndex({int index = 0}) async {
    var counter = index;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      _index = counter;
      notifyListeners();
      if (counter == 0) {
        _stopTimer();
      }
    });
  }

  void _stopTimer() {
    countdownTimer!.cancel();
  }
}
