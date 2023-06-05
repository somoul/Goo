import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/src/authentication/country_code/countdown_otp_provider.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/screen/create_passwrod_screen.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);
  static const String routeName = '/verification_otp_screen';

  @override
  Widget build(BuildContext context) {
    bool checkValiDateOTPExisting = false;
    final otpCon = Get.put(OTPController());

    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: StatefulBuilder(builder: (context, setStateSignIn) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120.h,
                      ),
                      const Text(
                        "Verification OTP",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
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
                      PinCodeTextField(
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.transparent,
                          disabledColor: Colors.transparent,
                          activeColor: Colors.blue.shade100,
                          inactiveColor: Colors.grey.shade300,
                          inactiveFillColor: Colors.transparent,
                          borderWidth: 2,
                          selectedColor: Colors.blue.shade100,
                          selectedFillColor: Colors.transparent,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        // controller: textEditingController,
                        onCompleted: (v) {
                          setStateSignIn(() {
                            checkValiDateOTPExisting = true;
                          });
                        },
                        onChanged: (value) {
                          if (value.length < 6) {
                            setStateSignIn(() {
                              checkValiDateOTPExisting = false;
                            });
                          }
                        },
                        beforeTextPaste: (text) {
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                        appContext: context,
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
                                  "00:${otpCon.index < 10 ? "0${otpCon.index}" : otpCon.index}"),
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
                SizedBox(
                  height: 50,
                  child: CustomButton(
                    title: 'Verify',
                    onPressed: () {
                      Get.to(() => const CreatePasswordScreen());
                    },
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
