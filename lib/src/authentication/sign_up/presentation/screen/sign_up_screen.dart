import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/utils/custom_text_field.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/build_country_picker.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/countries.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';

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
                              signUpCon.phoneNumber.value = value;
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have ave an account? ',
                          style: AppText.bodySmall,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.offAndToNamed(Routes.signin);
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Obx(
                () => CustomButton(
                  title: 'Sign Up',
                  onPressed: signUpCon.isDisabelSignup
                      ? () async => await signUpCon.onCreateAccount()
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
