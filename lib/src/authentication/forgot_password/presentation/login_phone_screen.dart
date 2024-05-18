import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/app_text.dart';
import '../../../../helper/custom_button.dart';
import '../../../../helper/custom_text_field.dart';
import '../../../../helper/hide_keybaord.dart';
import '../../../../routes/route_name.dart';
import '../../../widgets/shimmer_box.dart';
import '../../country_code/countdown_otp_provider.dart';
import '../../sign_in/controller/signin_controller.dart';
import '../../sign_up/presentation/widget/country_code_picker/build_country_picker.dart';
import '../../sign_up/presentation/widget/country_code_picker/countries.dart';
import '../controller/forgot_password_controller.dart';

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({super.key});

  @override
  State<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  final signinCon = Get.put(SignInController());
  final newForgotController = Get.put(NewForgotController());
  final otpCon = Get.put(OTPController());
  _init() {
    signinCon.countryCode.value = countryList[35];
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                      Text("Welcome".tr,
                          style: AppText.titleLarge!.copyWith(
                              fontSize: 35, fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Please enter your phone number!".tr,
                        style: AppText.titleSmall!.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Obx(
                        () => Row(
                          children: [
                            if (signinCon.countryCode.value.name != '')
                              IgnorePointer(
                                child: BuildCountryPicker(
                                  onSelected: (val) {
                                    signinCon.countryCode.value = val;
                                    setState(() {});
                                  },
                                  initCountry: signinCon.countryCode.value,
                                ),
                              )
                            else
                              const ShimmerBox(width: 110, height: 49),
                            const SizedBox(width: 15),
                            Expanded(
                              child: CustomTextField(
                                textInputType: TextInputType.phone,
                                hindText: "XXX-XXX-XXX",
                                hintStyle: AppText.bodyMedium!.copyWith(
                                  letterSpacing: 1,
                                  color: Colors.grey,
                                ),
                                valueStyle: AppText.titleSmall!.copyWith(
                                  letterSpacing: 1,
                                ),
                                onChange: (value) {
                                  newForgotController.phoneNumber.value = value;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 70),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have account?'.tr,
                            style: AppText.bodySmall!.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 16.5),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Get.offAndToNamed(Routes.signup);
                            },
                            child: Text(
                              'Register'.tr,
                              style: TextStyle(
                                  fontFamily: 'Kantumruy',
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(Routes.signin);
                          },
                          child: Text(
                            'Login account'.tr,
                            style: TextStyle(
                                fontFamily: 'Kantumruy',
                                fontSize: 16.5,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: CustomButton(
                    title: 'Continue'.tr,
                    onPressed: () {
                      if (newForgotController.phoneNumber.value.isNotEmpty) {
                        unit();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void unit() {
    newForgotController.onSendOtp(
      onCounting: () {
        otpCon.changeIndex();
      },
    );
    Timer(const Duration(seconds: 2), () {
      Get.offAndToNamed(Routes.verifyOtp);
    });
  }
}
