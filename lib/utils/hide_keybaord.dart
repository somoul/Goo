import 'package:flutter/material.dart';

class KeyboardHeper {
  static void hideKeyborad() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
