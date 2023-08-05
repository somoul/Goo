import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/utils/custom_text_field.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/authentication/sign_in/controller/signin_controller.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/build_country_picker.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/countries.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signinCon = Get.put(SignInController());
    signinCon.countryCode.value = countryList[35];

    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.padding, vertical: 30),
          child: Column(
            children: [
              Expanded(
                  child: Obx(
                () => signinCon.isLoging.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.2),
                            Text(
                              "Welcome",
                              style: AppText.titleLarge!.copyWith(fontSize: 24),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Enter phone number and password to login",
                              style: AppText.titleSmall,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                StatefulBuilder(
                                  builder: (context, setState) => IgnorePointer(
                                    child: BuildCountryPicker(
                                      onSelected: (val) {
                                        signinCon.countryCode.value = val;
                                        setState(() {});
                                      },
                                      initCountry: signinCon.countryCode.value,
                                    ),
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
                                      signinCon.phoneNumber.value = value;
                                    },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => CustomTextField(
                                suffixIcon: IconButton(
                                  onPressed: () => signinCon.isShowPass.value =
                                      !signinCon.isShowPass.value,
                                  icon: Icon(signinCon.isShowPass.value
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                                obscureText: signinCon.isShowPass.value,
                                textInputType: TextInputType.visiblePassword,
                                hindText: "Please enter password",
                                valueStyle: AppText.titleSmall!
                                    .copyWith(letterSpacing: 1),
                                onChange: (val) {
                                  signinCon.password.value = val;
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have account? ',
                                  style: AppText.bodySmall,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.offAndToNamed(Routes.signup);
                                    },
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
              )),
              Obx(
                () => CustomButton(
                  title: 'Sign In',
                  onPressed:
                      signinCon.isEnableSignin || signinCon.isLoging.value
                          ? () async {
                              // KeyboardHeper.hideKeyborad();
                              await signinCon.onLogin();
                            }
                          : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
