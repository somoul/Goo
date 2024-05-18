import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/authentication/country_code/countdown_otp_provider.dart';
import 'package:goo_rent/src/authentication/sign_up/controller/sign_up_controller.dart';

import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/hide_keybaord.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../routes/route_name.dart';
import '../../../forgot_password/controller/forgot_password_controller.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final newForgotController = Get.put(NewForgotController());
  // static const String routeName = '/verification_otp_screen';
  final otpCon = Get.put(OTPController());
  final signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: StatefulBuilder(builder: (context, setStateSignIn) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 120),
                        const Text(
                          "Verification OTP",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        5.gap,
                        const Text(
                          "Enter the 6 OTP code sent to +(855)887821785 by SMS",
                          style: TextStyle(fontSize: 14),
                        ),
                        30.gap,
                        Center(
                          child: SizedBox(
                            width: 290,
                            child: Obx(
                              () => PinCodeTextField(
                                length: 6,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                enabled: otpCon.index != 0,
                                autoFocus: true,
                                keyboardType: TextInputType.number,
                                enablePinAutofill: true,
                                textStyle: AppText.titleLarge!.copyWith(
                                    color: otpCon.index != 0
                                        ? Colors.black
                                        : Colors.grey[600]),

                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  disabledColor: Colors.grey.shade200,
                                  activeColor: Colors.blue.shade200,
                                  inactiveColor: Colors.grey.shade400,
                                  inactiveFillColor: Colors.transparent,
                                  borderWidth: 1.2,
                                  selectedColor: Colors.blue.shade400,
                                  activeFillColor: Colors.transparent,
                                  selectedFillColor: Colors.transparent,
                                ),
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                backgroundColor: Colors.transparent,
                                enableActiveFill: true,
                                cursorColor: Colors.blue.shade300,
                                // errorAnimationController: errorController,
                                // controller: textEditingController,
                                onCompleted: (value) {},
                                onChanged: (value) {
                                  _onOtpCode(value);
                                  // signUpController.otpCode.value = value;
                                },
                                beforeTextPaste: (text) {
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                                appContext: context,
                              ),
                            ),
                          ),
                        ),
                        50.gap,
                        otpCon.index != 0
                            ? Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Duration in "),
                                    Obx(
                                      () => Text(
                                        "00:${otpCon.index < 10 ? "0${otpCon.index}" : otpCon.index}",
                                        style: AppText.bodyMedium!.copyWith(
                                            // color: AppConstant.kPrimaryColor,
                                            ),
                                      ),
                                    ),
                                    // Text("Duration in "),
                                    // Consumer<OTPCountdownProvider>(
                                    //   builder: (context, countdown, _) {
                                    //     return Text(
                                    //         "00:${countdown.index < 10 ? "0${countdown.index}" : countdown.index}");
                                    //   },
                                    // )
                                  ],
                                ),
                              )
                            : Container(),
                        Center(
                            child: Text(
                          "Didn't get code?",
                          style: TextStyle(color: Colors.blue.shade300),
                        )),
                        Center(
                            child: TextButton(
                                onPressed: () {
                                  _onRequestOTP();
                                },
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Re-send code",
                                    style:
                                        TextStyle(color: Colors.blue.shade300),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ),
                // Obx(
                //   () =>
                SafeArea(
                  top: false,
                  child: CustomButton(
                      title: 'Confirm',
                      onPressed: () {
                        Get.offAndToNamed(Routes.newforgotpassword);
                      }
                      //  signUpController.otpCode.value.length < 6
                      //     ? null
                      //     : () async {
                      //         if (newForgotController.isCheckRouteOtp.value) {
                      //           Get.offAndToNamed(Routes.newforgotpassword);
                      //         } else {
                      //           signUpController.onRegister();
                      //         }
                      //       }
                      ),
                  // ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  _onConfirm() {
    // if (newForgotController.isCheckRouteOtp.value) {
    //   Get.offAndToNamed(Routes.newforgotpassword);
    // } else {
    //   signUpController.onRegister();
    // }
  }

  _onRequestOTP() {
    newForgotController.isCheckRouteOtp.value
        ? newForgotController.onSendOtp(
            onCounting: () {
              otpCon.changeIndex();
            },
          )
        : signUpController.onRequestOTP(
            onCounting: () {
              otpCon.changeIndex();
            },
          );
  }

  _onOtpCode(String otpCode) {
    if (newForgotController.isCheckRouteOtp.value) {
      newForgotController.otpCode.value = otpCode;
    } else {
      signUpController.otpCode.value = otpCode;
    }
  }
}
