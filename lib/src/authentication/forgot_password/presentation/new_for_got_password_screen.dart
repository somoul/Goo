import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/app_constant.dart';
import '../../../../constant/app_text.dart';
import '../../../../helper/custom_button.dart';
import '../../../../helper/custom_text_field.dart';
import '../../../../helper/hide_keybaord.dart';
import '../controller/forgot_password_controller.dart';

class NewForgotPasswordScreen extends StatelessWidget {
  const NewForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newForgotController = Get.put(NewForgotController());
    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.padding, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13),
                      Row(
                        children: [
                          Text("Welcome!".tr,
                              style:
                                  AppText.titleLarge!.copyWith(fontSize: 30)),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                              "${newForgotController.otpModel.value.firstName ?? ""} ${newForgotController.otpModel.value.lastName ?? ""}",
                              style:
                                  AppText.titleLarge!.copyWith(fontSize: 20)),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Text(
                            "Your account number".tr,
                            style: AppText.titleSmall?.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "0${newForgotController.otpModel.value.phone ?? ""}",
                            style: AppText.titleSmall?.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        "Please create your password!".tr,
                        style: AppText.titleSmall!.copyWith(
                            fontSize: 17, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ), //
                      const SizedBox(height: 30),
                      Text(
                        "New password*".tr,
                        style: AppText.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        suffixIcon: IconButton(
                          onPressed: () {
                            newForgotController.isStatePassWord.value !=
                                newForgotController.isStatePassWord.value;
                          },
                          icon: Icon(
                            newForgotController.isStatePassWord.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black26,
                          ),
                        ),
                        obscureText: newForgotController.isStatePassWord.value,
                        textInputType: TextInputType.visiblePassword,
                        hindText: "Please enter password".tr,
                        valueStyle:
                            AppText.titleSmall!.copyWith(letterSpacing: 1),
                        onChange: (val) {
                          // signinCon.password.value = val;
                        },
                      ),

                      const SizedBox(height: 20),
                      Text(
                        "Confirm new password*".tr,
                        style: AppText.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        suffixIcon: IconButton(
                          onPressed: () {
                            newForgotController.isConfroimPassword.value !=
                                newForgotController.isConfroimPassword.value;
                          },
                          icon: Icon(
                            newForgotController.isConfroimPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black26,
                          ),
                        ),
                        obscureText:
                            newForgotController.isConfroimPassword.value,
                        textInputType: TextInputType.visiblePassword,
                        hindText: "Please enter password".tr,
                        valueStyle:
                            AppText.titleSmall!.copyWith(letterSpacing: 1),
                        onChange: (val) {
                          // signinCon.password.value = val;
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )),
              SafeArea(
                top: false,
                child: CustomButton(title: 'Continue'.tr, onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
