import 'package:flutter/material.dart';
import 'package:goo_rent/cores/utils/context_provider.dart';

class KeyboardHeper {
  static void hideKeyborad() {
    FocusScope.of(ContextProvider.context).unfocus();
  }
}
