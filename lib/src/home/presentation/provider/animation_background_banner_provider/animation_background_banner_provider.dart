import 'dart:async';

import 'package:flutter/material.dart';

class AnimationBackgroundBannerProvider extends ChangeNotifier {
  int get index => _currentPage;
  int _currentPage = 0;
  bool _checkIsBiggerThan = true;

  callStartAnimation() async {
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      Timer(const Duration(seconds: 3), () {
        if (_checkIsBiggerThan) {
          _currentPage++;
          if (_currentPage > 4) {
            _checkIsBiggerThan = false;
          }
        } else {
          _currentPage--;
          if (_currentPage < 1) {
            _checkIsBiggerThan = true;
          }
        }
      });
    });
  }
}
