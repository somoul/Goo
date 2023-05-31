import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
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
                            builder: (context, setState) => BuildCountryPicker(
                              onSelected: (val) {
                                signinCon.countryCode.value = val;
                                setState(() {});
                              },
                              initCountry: signinCon.countryCode.value,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              maxLines: 1,
                              maxLength: 15,
                              cursorHeight: 25,
                              textAlignVertical: TextAlignVertical.center,
                              style: AppText.bodyMedium!
                                  .copyWith(letterSpacing: 1),
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintStyle: AppText.bodyMedium!.copyWith(
                                    color: Colors.grey, letterSpacing: 1),
                                counterText: "",
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
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
                              onChanged: (val) {
                                signinCon.phoneNumber.value = val;
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      Obx(
                        () => TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          cursorHeight: 25,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: AppText.bodyMedium!.copyWith(letterSpacing: 1),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: signinCon.isShowPass.value,
                          // obscuringCharacter: '*',
                          decoration: InputDecoration(
                            hintStyle: AppText.bodyMedium!
                                .copyWith(color: Colors.grey, letterSpacing: 1),
                            suffixIcon: IconButton(
                              icon: Icon(signinCon.isShowPass.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () => signinCon.isShowPass.value =
                                  !signinCon.isShowPass.value,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            hintText: "Please create password",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          onChanged: (val) {
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
              ),
              CustomButton(
                title: 'Sign in',
                // isOutline: false,
                onPressed: () => signinCon.onLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
