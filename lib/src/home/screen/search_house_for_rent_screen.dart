import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/screen/search_type_screen.dart';

import '../../../../cores/constant/app_constant.dart';
import '../../../../cores/constant/app_text.dart';
import '../../../../cores/utils/custom_button.dart';

import '../controler/animation_background_banner_provider/home_controller.dart';
import '../controler/search_rent_controler/search_controler.dart';
import '../widget/custom_butomsheet_type_of_rent.dart';
import '../widget/custom_rangevalue_widget.dart';

class SearchRentScreen extends StatelessWidget {
  const SearchRentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final homeController = Get.put(HomeController());
    final searchTypeController = Get.put(SearchTypeController());

    homeController.startSlider = 0;
    homeController.endSlider = 100;

    int indexTapber = 0;
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.paddingLarge,
              vertical: AppConstant.paddingLarge + 30),
          // padding: const EdgeInsets.only(
          //     left: AppConstant.paddingMedium,
          //     right: AppConstant.paddingMedium),
          child: CustomButton(
            onPressed: () {},
            title: "ចាប់ផ្តើមស្វែងរក",
            isOutline: false,
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                navigator?.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: Text("ស្វែងរក",
              style: AppText.titleMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 152,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTssFrcwen4UCJcOixuoZtOIlDRHr1yF1buHwXUfqkXbw&s'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 120),
                      GestureDetector(
                        onTap: () {
                          print("======== show test =======");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchTypeScreen()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xffEEEEEE),
                                    blurRadius: 1,
                                    spreadRadius: 0.5,
                                    offset: Offset(0.5, 0.5))
                              ]),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/search.png",
                                height: 20,
                                color: AppConstant.kPrimaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "ស្វែងអចលនាទ្រព្យជួល",
                                style: AppText.bodySmall!.copyWith(
                                    color: const Color(0xffB3B3B3),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              Expanded(
                                child: Text("ស្វែងរក",
                                    textAlign: TextAlign.end,
                                    style: AppText.bodyMedium!.copyWith(
                                        color: AppConstant.kPrimaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: AppConstant.paddingLarge,
                            bottom: AppConstant.paddingSmall),
                        child: Text(
                          "ទីតាំង",
                          style: AppText.titleSmall,
                        ),
                      ),
                      CustomContentTextField(
                        leftIcon: "assets/icons/location.svg",
                        //"assets/icons/location.svg",
                        nameTextField: "ជ្រើសរើសទីតាំង",
                        rightsIcons: "assets/icons/ic_vector.svg",
                        colorText: const Color(0xffB3B3B3),
                        onTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: AppConstant.paddingLarge,
                            bottom: AppConstant.paddingSmall),
                        child: Text(
                          "ប្រភេទជួល",
                          style: AppText.titleSmall,
                        ),
                      ),
                      CustomContentTextField(
                          leftIcon: "assets/icons/location.svg",
                          nameTextField:
                              searchTypeController.typeSearchRent.value != ""
                                  ? searchTypeController.typeSearchRent.value
                                  : "ជ្រើសរើសទីតាំង",
                          rightsIcons: "assets/icons/ic_vector.svg",
                          colorText:
                              searchTypeController.typeSearchRent.value != ""
                                  ? Colors.black
                                  : const Color(0xffB3B3B3),
                          onTap: () {
                            customButtomSheetTypeOfRent(
                                context: context,
                                onTap: (String type) {
                                  searchTypeController.typeSearchRent.value =
                                      type;
                                });
                          }),
                      Text(
                        "តម្លៃ",
                        style: AppText.titleSmall,
                      ),
                      const SizedBox(
                        height: 95,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 50,
                          ),
                          child: CustomRangeValueWidget(
                              // onDragging: (handlerIndex, lowerValue, upperValue) {
                              //   if (handlerIndex == 0) {
                              //     valueSlider.first = lowerValue;
                              //     print("=====================slider 1   :$lowerValue ");
                              //   } else {
                              //     valueSlider.last = upperValue;
                              //     print("=====================slider 2   :$upperValue ");
                              //   }
                              // },
                              // valueSlider: valueSlider,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomContentTextField extends StatelessWidget {
  final String leftIcon;
  final String nameTextField;
  final String rightsIcons;
  final Function()? onTap;
  final Color colorText;
  const CustomContentTextField(
      {super.key,
      required this.leftIcon,
      required this.nameTextField,
      required this.rightsIcons,
      required this.colorText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: double.infinity,
        height: 58,
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xffEEEEEE),
                  blurRadius: 1,
                  spreadRadius: 0.5,
                  offset: Offset(0.5, 0.5))
            ]),
        child: Row(
          children: [
            SvgPicture.asset(
              leftIcon,
              // "assets/icons/search.png",
              height: 20,
              color: AppConstant.kPrimaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              nameTextField,
              // "ស្វែងអចលនាទ្រព្យជួល",
              style: AppText.bodySmall!.copyWith(
                  color: colorText,

                  ///const Color(0xffB3B3B3),
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            SvgPicture.asset(
              rightsIcons,
              // "assets/icons/search.png",
              height: 20,
              color: AppConstant.kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
