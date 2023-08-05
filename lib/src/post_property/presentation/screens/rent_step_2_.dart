import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';

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
      ),
    );
  }
}
