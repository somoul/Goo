import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';
import 'package:goo_rent/cores/utils/custom_text_field.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/authentication/sign_up/controller/sign_up_controller.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);
  static const String routeName = '/create_password_screen';

  @override
  Widget build(BuildContext context) {
    var signupCon = Get.put(SignUpController());
    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                      Text(
                        "Create a new password".tr,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(
                        () => CustomTextField(
                          suffixIcon: IconButton(
                            onPressed: () => signupCon.isShowPass.value =
                                !signupCon.isShowPass.value,
                            icon: Icon(signupCon.isShowPass.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          obscureText: signupCon.isShowPass.value,
                          textInputType: TextInputType.visiblePassword,
                          hindText: "Please enter password".tr,
                          valueStyle:
                              AppText.titleSmall!.copyWith(letterSpacing: 1),
                          onChange: (val) {
                            signupCon.password.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => SizedBox(
                      height: 50,
                      child: CustomButton(
                        title: 'Confirm'.tr,
                        onPressed: signupCon.password.value.length < 4
                            ? null
                            : () => Get.toNamed(Routes.createName),
                      ),
                    ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
