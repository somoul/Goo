import 'package:flutter/material.dart';

class ProviderArrowDetailsScreen extends ChangeNotifier {
  int get index => _index;
  int _index = 0;
  changeIndex({int index = 0}) async {
    _index = index;
    notifyListeners();
  }
}
