import 'package:flutter/widgets.dart';

class TypeListIndexProvider extends ChangeNotifier {
  int get index => _index;
  int _index = 0;
  changeIndex(int index) async {
    _index = index;
    notifyListeners();
  }
}
