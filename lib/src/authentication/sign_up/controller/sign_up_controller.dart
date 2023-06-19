import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/cores/utils/loading_dialoge.dart';
import 'package:goo_rent/cores/utils/loading_helper.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/authentication/sign_up/data/register_model.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/country.dart';

class SignUpController extends GetxController {
  ///Firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  ///Object
  final countryCode = Country().obs;
  final apiHelper = ApiHelper();
  final registerData = RegisterModel().obs;

  /// Variable
  final isShowPass = true.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final userNameController = TextEditingController().obs;
  final verificationId = ''.obs;
  final otpCode = ''.obs;

  ///
  ///Condiction
  bool get isDisabelSignup =>
      phoneNumber.value != '' && phoneNumber.value.length > 7;

  /// Firebase Signup
  Future<void> onCreateAccount() async {
    BaseDialogLoading.show();
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+855${phoneNumber.value}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await firebaseAuth
            .signInWithCredential(credential)
            .then((value) => BaseDialogLoading.dismiss());
      },
      codeAutoRetrievalTimeout: (String verifyId) {
        verificationId.value = verifyId;
        BaseDialogLoading.dismiss();
      },
      codeSent: (String verifyId, int? forceResendingToken) {
        verificationId.value = verifyId;
        BaseDialogLoading.dismiss();
        Get.toNamed(Routes.verifyOtp);
      },
      verificationFailed: (FirebaseAuthException error) {
        BaseDialogLoading.dismiss();

        BaseToast.showErorrBaseToast(
            error.message ?? 'Something went wrong!'.tr);
      },
    );
  }

  Future<dynamic> onVerifyOTP({required String code}) async {
    BaseDialogLoading.show();
    var credential = await firebaseAuth
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: code,
      ),
    )
        .then((value) {
      BaseToast.showSuccessBaseToast('Verified OTP successfully!');
      BaseDialogLoading.dismiss();
      Get.toNamed(Routes.createPassword);
    }).onError((error, stackTrace) {
      BaseToast.showErorrBaseToast('Something went wrong!');
      BaseDialogLoading.dismiss();
    });
    BaseDialogLoading.dismiss();
    return credential;
  }

  /// Method
  Future<void> onRegister() async {
    KeyboardHeper.hideKeyborad();
    phoneNumber.value = phoneNumber.value.trim();
    var body = {
      'username': userNameController.value.text,
      'password': password.value,
      'phone': phoneNumber.value,
    };
    try {
      await apiHelper
          .onRequest(
              url: '/register',
              methode: METHODE.post,
              isAuthorize: false,
              body: body)
          .then((value) async {
        registerData.value = RegisterModel.fromJson(value['data']);
        BaseToast.showSuccessBaseToast(
            'Your account has been created successfully!');
        await LocalStorage.writeToken(registerData.value.token!);
        Get.offAllNamed(Routes.home);
      });
    } catch (e) {
      BaseToast.showErorrBaseToast(e.toString());
    }
  }
}
