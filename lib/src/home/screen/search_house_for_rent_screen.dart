import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/controler/search_rent_controler/search_controler.dart';
import 'package:goo_rent/src/home/presentation/screen/map_screen.dart';
import 'package:goo_rent/src/home/screen/custom_default_butom_sheet.dart';
import 'package:goo_rent/src/home/screen/search_type_screen.dart';

import '../../../../cores/constant/app_constant.dart';
import '../../../../cores/constant/app_text.dart';

import '../widget/custom_butomsheet_type_of_rent.dart';
import '../widget/custom_rangevalue_widget.dart';

class SearchRentScreen extends StatefulWidget {
  const SearchRentScreen({super.key});

  @override
  State<SearchRentScreen> createState() => _SearchRentScreenState();
}

class _SearchRentScreenState extends State<SearchRentScreen> {
  // final MediaQueryData mediaQueryData = MediaQuery.of(context);
  final homeController = Get.put(HomeController());
  final searchTypeController = Get.put(SearchTypeController());
  String? address;
  @override
  void initState() {
    super.initState();

    homeController.startSlider = 0;
    homeController.endSlider = 100;
  }

  @override
  Widget build(BuildContext context) {
    // int indexTapber = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT91omWX-gLTKP4Iy-Dun_iq1RoSjKR7-adJ8yUe74p6njj7ndyYsTuhLNVcFlB8sFs4IE&usqp=CAU'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 120),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchTypeScreen()),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 0.8, color: Colors.grey[300]!),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/image/search.svg'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Search Rent Property".tr,
                                    style: AppText.bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  Expanded(
                                    child: Text("Search".tr,
                                        textAlign: TextAlign.end,
                                        style: AppText.bodySmall!.copyWith(
                                            color: AppConstant.kPrimaryColor)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: AppConstant.paddingLarge, bottom: 5),
                            child: Text(
                              "Address".tr,
                              style: AppText.titleSmall,
                            ),
                          ),
                          CustomContentTextField(
                              value: address,
                              leftIcon: "assets/icons/location.svg",
                              //"assets/icons/location.svg",
                              nameTextField: "Choose Address".tr,
                              rightsIcons: "assets/icons/ic_vector.svg",
                              onTap: () async {
                                var result = await Get.to(const MapScreen());
                                if (result != null) {
                                  address = result;
                                  setState(() {});
                                }
                              }),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: AppConstant.paddingLarge, bottom: 5),
                            child: Text(
                              "Rent Type".tr,
                              style: AppText.titleSmall,
                            ),
                          ),
                          CustomContentTextField(
                            leftIcon: "assets/icons/location.svg",
                            value: searchTypeController.typeSearchRent.value,
                            nameTextField: "Choose Property Types".tr,
                            // rightsIcons: "assets/icons/ic_vector.svg",

                            onTap: () async {
                              var propertyType = await _onSelectPropertyType();
                              searchTypeController.typeSearchRent.value =
                                  propertyType;
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Price".tr,
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
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
            child: CustomButton(
              onPressed: () {},
              title: "Search".tr,
              isOutline: false,
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _onSelectPropertyType() async {
    var result = await customBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                // color: const Color.fromARGB(255, 201, 109, 109),
                decoration: const BoxDecoration(
                    color: Color(0xffF9F9F9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Choose Property Types",
                      style: AppText.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listType.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: CustomItemButtomsheet(
                          title: listType[index],
                        ),
                        onTap: () => Navigator.pop(context, listType[index]),
                      );
                      // return null;
                    }),
              )
            ],
          ),
        );
      },
    );
    return result;
  }
}

class CustomContentTextField extends StatelessWidget {
  final String? leftIcon;
  final String? nameTextField;
  final String? rightsIcons;
  final String? value;
  final Function()? onTap;

  const CustomContentTextField(
      {super.key,
      required this.leftIcon,
      this.nameTextField,
      this.rightsIcons,
      this.value,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.8, color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            leftIcon == null
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      leftIcon!,
                      height: 20,
                      color: AppConstant.kPrimaryColor,
                    ),
                  ),
            Expanded(
              child: Text(
                value != null && value != '' ? '$value' : nameTextField ?? '',
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
                style: AppText.bodySmall!.copyWith(
                  color:
                      value != null && value != '' ? Colors.black : Colors.grey,
                ),
              ),
            ),
            const SizedBox(width: 5),
            rightsIcons == null
                ? const SizedBox()
                : SvgPicture.asset(
                    rightsIcons!,
                    // "assets/icons/search.png",
                    height: 14,
                    color: Colors.grey[400],
                  ),
          ],
        ),
      ),
    );
  }
}
