import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:goo_rent/cores/constant/app_string.dart';

class LocalStorage {
  static final GetStorage box = GetStorage();

  /// Locale [Languages]
  static Future<void> writeLocale(String locale) async {
    await box.write(AppString.locale, locale);
  }

  static Future<String> readLocale() async {
    String locale = box.read(AppString.locale) ?? '';
    return locale;
  }

  /// Token [User_Token]
  static Future<void> writeToken(String token) async {
    await box.write(AppString.token, token);
  }

  static Future<String?> readToken() async {
    var token = await box.read(AppString.token);
    return token ?? '';
  }
}
