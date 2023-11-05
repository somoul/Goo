import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:goo_rent/constant/app_string.dart';
// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:flutter/foundation.dart';
// import 'package:primary/data/enum/api.dart';
// import 'package:primary/utils/core/configure.dart';
// import 'package:primary/utils/exceptions/api_error.dart';
// import 'package:primary/utils/exceptions/api_null_data.dart';
// import 'package:primary/utils/exceptions/session_expired.dart';
// import 'package:primary/utils/extensions/stack_trace.dart';
// import 'package:primary/utils/helpers/accessor.dart';
// import 'package:primary/utils/helpers/general.dart';
// import 'package:primary/utils/helpers/serailize.dart';

class LocalStorage {
  static final GetStorage box = GetStorage();

  static Future<void> put({required String storageKey, required value}) async {
    await box.write(storageKey.toString(), value);
  }

  static Future<T?> get<T>(String storageKey) async {
    var value = await box.read(storageKey.toString());
    return value;
  }

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
