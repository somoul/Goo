import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:goo_rent/constant/app_string.dart';

class LocalStorage {
  static final GetStorage box = GetStorage();

  /// Locale [Languages]
  static Future<void> writeLocale(String locale) async {
    await box.write(AppString.locale, locale);
  }

  static Future<String> readLocale() async {
    String? locale = box.read(AppString.locale);
    return locale ?? '';
  }

  /// Token [User_Token]
  static Future<void> writeToken(String token) async {
    await box.write(AppString.token, token);
  }

  static Future<String?> readToken() async {
    var token = await box.read(AppString.token);
    return token;
  }

  static Future<void> removeToken() async {
    await box.remove(AppString.token);
  }

  /// Locale [NOTIFICATION]
  static Future<void> writeNoficationToken(String key) async {
    await box.write(AppString.notificationKey, key);
  }

  static Future<String?> readNoficationToken() async {
    var key = await box.read(AppString.notificationKey);
    return key;
  }

  static Future<void> removeNoficationToken() async {
    await box.remove(AppString.notificationKey);
  }
}
