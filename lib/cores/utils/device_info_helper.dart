import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceHelper {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  static Future<String> getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo;
    IosDeviceInfo iosDeviceInfo;
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else {
      iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor!;
    }
  }

  static bool isAndroid() => Platform.isAndroid;

  static String platformName() => Platform.isAndroid ? 'Android' : 'iOS';
}
