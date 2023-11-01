import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/post_property/presentation/screens/select_photo.dart';

import 'package:goo_rent/helper/custom_text_field.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/utils/hide_keybaord.dart';

class RentStepTwo extends StatelessWidget {
  const RentStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        backgroundColor: const Color(0xfff9f9f9),
        appBar: AppBar(
          backgroundColor: const Color(0xfff9f9f9),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(Icons.clear, color: Colors.black),
              )),
          title: Text('Rent'.tr, style: AppText.bodyLarge),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: 'Price'.tr,
                      hindText: 'Enter price'.tr,
                      textInputType: TextInputType.number,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 10),
                        child: Text(' | Month'.tr,
                            style: const TextStyle(color: Colors.grey)),
                      ),
                      onChange: (val) {},
                    ),
                    CustomTextField(
                      labelText: 'Size'.tr,
                      hindText: 'Enter size'.tr,
                      textInputType: TextInputType.number,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 10, right: 10),
                        child: Text(
                          ' | Square metre'.tr,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      onChange: (val) {},
                    ),
                    CustomTextField(
                      labelText: 'Address'.tr,
                      hindText: 'Enter address'.tr,
                      textInputType: TextInputType.number,
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(13),
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/image/marker_android.png',
                          color: Colors.grey,
                        ),
                      ),
                      onChange: (val) {},
                    ),
                    CustomTextField(
                      labelText: 'Room types'.tr,
                      hindText: 'Select room types'.tr,
                      textInputType: TextInputType.number,
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(13),
                        width: 20,
                        height: 20,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                      onChange: (val) {},
                    ),
                    CustomTextField(
                      labelText: 'Area'.tr,
                      hindText: 'Select area'.tr,
                      textInputType: TextInputType.number,
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(13),
                        width: 20,
                        height: 20,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                      onChange: (val) {},
                    ),
                    CustomTextField(
                      labelText: 'Floor'.tr,
                      hindText: 'Enter floor'.tr,
                      textInputType: TextInputType.number,
                      onChange: (val) {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 30),
              child: CustomButton(
                title: 'Continue'.tr,
                onPressed: () {
                  Get.to(const SelectPhotoScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
