import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/src/authentication/country_code/countdown_otp_provider.dart';
import 'package:goo_rent/src/authentication/sign_up/controller/sign_up_controller.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);
  // static const String routeName = '/verification_otp_screen';

  @override
  Widget build(BuildContext context) {
    final otpCon = Get.put(OTPController());
    final signUpController = Get.put(SignUpController());

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
                        SizedBox(
                          height: 120.h,
                        ),
                        const Text(
                          "Verification OTP",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Enter the 6 OTP code sent to +(855)887821785 by SMS",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
                                  onChanged: (value) =>
                                      signUpController.otpCode.value = value,
                                  beforeTextPaste: (text) {
                                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                    return true;
                                  },
                                  appContext: context,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Didn't get code?",
                                  style: TextStyle(color: Colors.blue.shade300),
                                ))),
                        Center(
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
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() => CustomButton(
                      title: 'Confirm',
                      onPressed: signUpController.otpCode.value.length < 6
                          ? null
                          : () async => await signUpController.onVerifyOTP(
                              code: signUpController.otpCode.value),
                    ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
