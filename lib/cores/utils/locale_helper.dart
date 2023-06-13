import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';

class LocaleHelper {
  static Future<void> onCheckLanguages() async {
    String localeStr = await LocalStorage.readLocale();
    if (localeStr != '') {
      var locale = Locale(localeStr, '');
      Get.updateLocale(locale);
    } else {
      String localeStr = Get.deviceLocale!.languageCode;
      var locale = Locale(localeStr, '');
      Get.updateLocale(locale);
    }
  }
}
