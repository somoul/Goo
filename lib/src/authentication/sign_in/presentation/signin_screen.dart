import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/main_page.dart';
import 'package:goo_rent/src/authentication/sign_in/controller/signin_controller.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/build_country_picker.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/countries.dart';
import 'package:get/get.dart';
import 'package:goo_rent/helper/custom_text_field.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
import 'package:goo_rent/utils/hide_keybaord.dart';

import '../../../../routes/route_name.dart';
import '../../forgot_password/controller/forgot_password_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final signinCon = Get.put(SignInController());
  final newForgotController = Get.put(NewForgotController());
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
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.padding, vertical: 30),
          child: Column(
            children: [
              Expanded(
                  child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                      Text("Welcome".tr,
                          style: AppText.titleLarge!.copyWith(
                              fontSize: 34, fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Enter phone number and password to login".tr,
                        style: AppText.titleSmall!.copyWith(
                            fontSize: 16.5, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Row(
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
                                signinCon.phoneNumber.value = value;
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      Obx(
                        () => CustomTextField(
                          suffixIcon: IconButton(
                            onPressed: () => signinCon.isShowPass.value =
                                !signinCon.isShowPass.value,
                            icon: Icon(
                              signinCon.isShowPass.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black26,
                            ),
                          ),
                          obscureText: signinCon.isShowPass.value,
                          textInputType: TextInputType.visiblePassword,
                          hindText: "Please enter password".tr,
                          valueStyle:
                              AppText.titleSmall!.copyWith(letterSpacing: 1),
                          onChange: (val) {
                            signinCon.password.value = val;
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have account?'.tr,
                            style: AppText.bodySmall!.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              newForgotController.isCheckRouteOtp.value = false;
                              Get.offAndToNamed(Routes.signup);
                            },
                            child: Text(
                              'Register'.tr,
                              style: TextStyle(
                                  fontFamily: 'Kantumruy',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            newForgotController.isCheckRouteOtp.value = true;
                            Get.offAndToNamed(Routes.forloginphone);
                          },
                          child: Text(
                            'Forgot password'.tr,
                            style: TextStyle(
                                fontFamily: 'Kantumruy',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Obx(
                () => SafeArea(
                  top: false,
                  child: CustomButton(
                    title: 'Sign In'.tr,
                    onPressed:
                        signinCon.isEnableSignin || signinCon.isLoging.value
                            ? () async {
                                KeyboardHeper.hideKeyborad();
                                await signinCon.onLogin().then((value) async {
                                  if (value != null) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                        builder: (BuildContext context) {
                                          return const MainPage();
                                        },
                                      ),
                                      (_) => true,
                                    );
                                  }
                                });
                              }
                            : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
