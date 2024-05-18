import 'dart:ui';

import 'package:get/get.dart';

import '../../../../helper/api_helper.dart';
import '../../../../helper/hide_keybaord.dart';
import '../../../../helper/loading_dialoge.dart';
import '../model/otp_model.dart';

class NewForgotController extends GetxController {
  final apiHelper = ApiHelper();
  final isStatePassWord = false.obs;
  final isConfroimPassword = false.obs;
  final isCheckRouteOtp = false.obs;
  final otpCode = "".obs;
  // ============================================= Use for forgot password ==============================================
  final phoneNumber = ''.obs;
  bool get isEnableSignin => phoneNumber.value.length > 7;
  final otpModel = OtpModel().obs;
  Future<void> onSendOtp({VoidCallback? onCounting}) async {
    KeyboardHeper.hideKeyborad();
    phoneNumber.value = phoneNumber.value.trim();
    //  var notificationKey = await LocalStorage.readToken();
    var body = {
      'm_prefix': '855',
      'phone': phoneNumber.value,
      'event': "reset_password",
      'lang': "kh",
    };
    try {
      await apiHelper
          .onRequest(
              url: '/send-sms',
              methode: METHODE.post,
              isAuthorize: true,
              body: body)
          .then((value) async {
        if (onCounting != null) {
          onCounting;
        }
        otpModel.value = OtpModel.fromJson(value["data"]);
        BaseToast.showSuccessBaseToast(
            'Your account has been created successfully!');
        print(
            "====================== testing sms =============================");
      });
    } catch (e) {}
  }
}
