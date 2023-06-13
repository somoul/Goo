import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/src/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/build_country_picker.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/countries.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';

import '../../../../home/presentation/screen/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/sign_out_screen';

  @override
  Widget build(BuildContext context) {
    final signUpCon = Get.put(SignUpController());

    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.padding, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Enter your phone number",
                        style: AppText.titleLarge!.copyWith(fontSize: 24)),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        IgnorePointer(
                          ignoring: true,
                          child: BuildCountryPicker(
                            onSelected: (val) {
                              signUpCon.countryCode.value = val;
                            },
                            initCountry: countryList[35],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            maxLines: 1,
                            maxLength: 15,
                            cursorHeight: 25,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.phone,
                            style: AppText.bodyMedium,
                            onChanged: (val) {
                              signUpCon.phoneNumber.value = val;
                            },
                            decoration: InputDecoration(
                              counterText: "",
                              hintStyle: AppText.bodyMedium!.copyWith(
                                  color: Colors.grey, letterSpacing: 1),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                              hintText: "XXX-XXX-XXX",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // const SizedBox(height: 10),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'Already have ave an account? ',
                    //       style: AppText.bodySmall,
                    //     ),
                    //     TextButton(
                    //         onPressed: () {
                    //           Get.offAndToNamed(Routes.signin);
                    //         },
                    //         child: const Text(
                    //           'Sign in',
                    //           style: TextStyle(
                    //             decoration: TextDecoration.underline,
                    //           ),
                    //         ))
                    //   ],
                    // )
                  ],
                ),
              ),
              CustomButton(
                  title: 'Sign Up',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  }
                  // => Get.toNamed(Routes.verifyOtp),
                  // onPressed: () => signUpCon.onRegister(),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
