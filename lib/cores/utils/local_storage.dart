import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:goo_rent/cores/constant/app_string.dart';

class LocalStorage {
  static final GetStorage _storage = GetStorage();

  static Future<void> writeLocale(String locale) async {
    await _storage.write(AppString.locale, locale);
  }

  static Future<String> readLocale() async {
    var locale = await _storage.read(AppString.locale);
    return locale ?? '';
  }
}
