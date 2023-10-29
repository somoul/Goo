import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/helper/date_time.dart';
import 'package:goo_rent/cores/helper/dialog.dart';
import 'package:goo_rent/cores/utils/context_provider.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';
import 'package:goo_rent/cores/utils/custom_text_field.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/build_country_picker.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/countries.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/sign_out_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpCon = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.padding, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const SizedBox(height: 80),
                    Text("Create Account".tr,
                        style: AppText.titleLarge!.copyWith(fontSize: 30)),
                    const SizedBox(height: 30),
                    Text('Enter Phone Number'.tr),
                    const SizedBox(height: 5),
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
                            // hintStyle: const TextStyle(
                            //   letterSpacing: 1,
                            //   color: Colors.grey,
                            // ),
                            // valueStyle: const TextStyle(
                            //   letterSpacing: 1,
                            // ),
                            onChange: (value) {
                              signUpCon.phoneNumber.value = value;
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('Enter Password'.tr),
                    const SizedBox(height: 5),
                    Obx(
                      () => CustomTextField(
                        suffixIcon: IconButton(
                          onPressed: () => signUpCon.isShowPass.value =
                              !signUpCon.isShowPass.value,
                          icon: Icon(signUpCon.isShowPass.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        obscureText: signUpCon.isShowPass.value,
                        textInputType: TextInputType.visiblePassword,
                        hindText: "Please enter password".tr,
                        onChange: (val) {
                          signUpCon.password.value = val;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Enter Firstname'.tr),
                    const SizedBox(height: 5),
                    Obx(
                      () => TextFormField(
                        controller: signUpCon.firstName.value,
                        cursorColor: AppConstant.kPrimaryColor,
                        cursorRadius: const Radius.circular(10),
                        cursorHeight: 20,
                        cursorWidth: 2,
                        keyboardType: TextInputType.name,
                        style: AppText.bodyMedium,
                        onChanged: (val) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          // suffixIcon: signUpCon.firstName.value.text == ''
                          //     ? const Text('')
                          //     : IconButton(
                          //         icon: const Icon(Icons.cancel),
                          //         onPressed: () {
                          //           signUpCon.firstName.value.clear();
                          //           // setState(() {});
                          //         },
                          //       ),
                          hintStyle:
                              AppText.bodyMedium!.copyWith(color: Colors.grey),
                          hintText: "Enter first name".tr,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: AppConstant.kPrimaryColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Enter Last Name'.tr),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 46,
                      child: TextFormField(
                        controller: signUpCon.lastName.value,
                        cursorColor: AppConstant.kPrimaryColor,
                        cursorRadius: const Radius.circular(10),
                        cursorHeight: 20,
                        cursorWidth: 2,
                        keyboardType: TextInputType.name,
                        style: AppText.bodyMedium,
                        onChanged: (val) {
                          // setState(() {});
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          // suffixIcon: Obx(
                          //   () => IconButton(
                          //       icon: Icon(signUpCon.lastName.value.text != ''
                          //           ? Icons.cancel
                          //           : null),
                          //       onPressed: () {
                          //         signUpCon.lastName.value.clear();
                          //         // setState(() {});
                          //       }),
                          // ),
                          hintStyle:
                              AppText.bodyMedium!.copyWith(color: Colors.grey),
                          hintText: "Please enter your name".tr,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: AppConstant.kPrimaryColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          _chooseDOB();
                        },
                        child: CustomTextField(
                          labelText: 'Select Date of Birth'.tr,
                          isSelection: true,
                          initSelectionValue: signUpCon.dob.value == ''
                              ? null
                              : AppDateTime.getDate(signUpCon.dob.value),
                          textInputType: TextInputType.phone,
                          hindText: "Date of Birth",
                          hintStyle: AppText.bodyMedium!.copyWith(
                            letterSpacing: 1,
                            color: Colors.grey,
                          ),
                          valueStyle: AppText.titleSmall!.copyWith(
                            letterSpacing: 1,
                          ),
                          onChange: (value) {
                            // signUpCon.phoneNumber.value = value;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have ave an account?',
                          style: AppText.bodySmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAndToNamed(Routes.signin);
                          },
                          child: const Text('Login'),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Obx(
                () => SafeArea(
                  top: false,
                  child: CustomButton(
                    title: 'Sign Up',
                    onPressed: signUpCon.isDisabelSignup
                        ? ()
                            // {
                            //   Get.toNamed(Routes.verifyOtp);
                            // }
                            async =>
                            await signUpCon.onRequestOTP()
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

  _chooseDOB() {
    var temp = signUpCon.dob.value;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (bulder) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 6 * 3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Choose Date of Birth".tr,
                        style: AppText.titleSmall,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0 * 4),
                  child: Divider(),
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2WithActionButtonsConfig(
                    firstDayOfWeek: 0,
                    controlsTextStyle: AppText.titleSmall,
                    weekdayLabels: [
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat'
                    ],
                    currentDate: DateTime.parse(signUpCon.dob.value != ''
                        ? signUpCon.dob.value
                        : DateTime.now().toString()),
                    calendarType: CalendarDatePicker2Type.single,
                    selectedDayTextStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    selectedDayHighlightColor: Colors.blue[800],
                    dayTextStyle: AppText.bodyMedium,
                  ),
                  onValueChanged: (value) {
                    signUpCon.dob.value = temp = value[0].toString();
                  },
                  value: [DateTime.now()],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0 * 4),
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {
                              signUpCon.dob.value = temp;
                              Get.back();
                            },
                            child: Text(
                              "Cancel".tr,
                              style: AppText.titleSmall!
                                  .copyWith(color: Colors.white),
                            )),
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              "Ok".tr,
                              style: const TextStyle(color: Colors.white),
                            )),
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 16 * 2),
              ],
            ),
          );
        });
  }
}
