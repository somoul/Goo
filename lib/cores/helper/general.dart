import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';
import 'package:share_plus/share_plus.dart';

String getRandomString(int length) {
  final rnd = Random();
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(
        rnd.nextInt(chars.length),
      ),
    ),
  );
}

Future<void> onUpdateLanguage({bool isKhmer = true}) async {
  if (isKhmer) {
    var locale = const Locale('km', 'KH');
    Get.updateLocale(locale);
    await LocalStorage.writeLocale('km');
    Get.back();
  } else {
    var locale = const Locale('en', 'US');
    Get.updateLocale(locale);
    await LocalStorage.writeLocale('en');
    Get.back();
  }
}

onShare(BuildContext context) async {
  final box = context.findRenderObject() as RenderBox?;
  await Share.share("This is contents",
      subject: "Share App",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
}

String get langCode => Get.locale?.languageCode ?? 'km';

Future<String> _getLocal() async {
  return await LocalStorage.readLocale();
}

Future<String> get getLocal => _getLocal();
