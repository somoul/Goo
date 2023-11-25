import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/controler/search_type_rent_controler/search_controler.dart';
import 'package:goo_rent/src/home/presentation/screen/map_screen.dart';
import 'package:goo_rent/src/home/screen/search_type_screen.dart';
import '../../presentation/controller/map_controller.dart';
import '../../widget/CustomDefaultShimmer.dart';
import '../../widget/custom_butomsheet_type_of_rent.dart';
import '../../widget/custom_rangevalue_widget.dart';

class SearchRentScreen extends StatefulWidget {
  const SearchRentScreen({super.key});

  @override
  State<SearchRentScreen> createState() => _SearchRentScreenState();
}

class _SearchRentScreenState extends State<SearchRentScreen> {
  // final MediaQueryData mediaQueryData = MediaQuery.of(context);
  final homeController = Get.put(HomeController());
  final searchController = Get.put(SearchTypeRentController());
  final _mapCon = Get.put(GMapController());

  String? address;
  @override
  void initState() {
    postFrameCallback(() async {
      await searchController.onPriceRang();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // int indexTapber = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: const [],
        leading: IconButton(
          onPressed: () {
            _mapCon.currentAddress.value = "";
            searchController.textSearchRent.value == "";
            navigator?.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        CustomDefaultShimmer(
                          padding: const EdgeInsets.all(0),
                          heightShimmer: 150,
                          isShimmer: searchController.isLodingSearchTyp.value,
                          child: Container(
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
                                child: CustomDefaultShimmer(
                                  padding: const EdgeInsets.all(0),
                                  heightShimmer: 47,
                                  isShimmer:
                                      searchController.isLodingSearchTyp.value,
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
                                        SvgPicture.asset(
                                            'assets/image/search.svg'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        if (searchController
                                                .textSearchRent.value !=
                                            "")
                                          Text(
                                            searchController
                                                .textSearchRent.value,
                                            style: AppText.bodySmall!.copyWith(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        if (searchController
                                                .textSearchRent.value ==
                                            "")
                                          Text(
                                            "Search Rent Property".tr,
                                            style: AppText.bodySmall!.copyWith(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        Expanded(
                                          child: Text("Search".tr,
                                              textAlign: TextAlign.end,
                                              style:
                                                  AppText.bodySmall!.copyWith(
                                                color:
                                                    AppConstant.kPrimaryColor,
                                                fontSize: 16,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: AppConstant.paddingLarge, bottom: 5),
                                  child: CustomDefaultShimmer(
                                    widthShimmer: 50,
                                    padding: const EdgeInsets.all(0),
                                    isShimmer: searchController
                                        .isLodingSearchTyp.value,
                                    heightShimmer: 20,
                                    child: Text(
                                      "Address".tr,
                                      style: AppText.titleSmall,
                                    ),
                                  )),
                              CustomDefaultShimmer(
                                padding: const EdgeInsets.all(0),
                                isShimmer:
                                    searchController.isLodingSearchTyp.value,
                                heightShimmer: 47,
                                child: CustomContentTextField(
                                    value: _mapCon.currentAddress.value ??
                                        "Address".tr,
                                    leftIcon: "assets/icons/location.svg",
                                    //"assets/icons/location.svg",
                                    nameTextField: "Choose Address".tr,
                                    rightsIcons: "assets/icons/ic_vector.svg",
                                    onTap: () async {
                                      var result =
                                          await Get.to(const MapScreen());
                                      print("==== show 876543555 :$result");

                                      if (result != null) {
                                        address = result;
                                        setState(() {
                                          print("==== show 876543 :$result");
                                        });
                                      }
                                    }),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: AppConstant.paddingLarge, bottom: 5),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: AppConstant.paddingLarge,
                                          bottom: 5),
                                      child: CustomDefaultShimmer(
                                        widthShimmer: 50,
                                        padding: const EdgeInsets.all(0),
                                        isShimmer: searchController
                                            .isLodingSearchTyp.value,
                                        heightShimmer: 20,
                                        child: Text(
                                          "Rent Type".tr,
                                          style: AppText.titleSmall,
                                        ),
                                      ))),
                              CustomDefaultShimmer(
                                padding: const EdgeInsets.all(0),
                                isShimmer:
                                    searchController.isLodingSearchTyp.value,
                                heightShimmer: 47,
                                child: CustomContentTextField(
                                  leftIcon: "assets/icons/home3.svg",
                                  value: searchController.typeSearchRent.value,
                                  nameTextField: "Choose Property Types".tr,
                                  // rightsIcons: "assets/icons/ic_vector.svg",

                                  onTap: () async {
                                    _onSelectPropertyType(context);
                                    setState(() {});
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: AppConstant.paddingLarge, bottom: 5),
                                  child: CustomDefaultShimmer(
                                      widthShimmer: 50,
                                      padding: const EdgeInsets.all(0),
                                      isShimmer: searchController
                                          .isLodingSearchTyp.value,
                                      heightShimmer: 20,
                                      child: Text(
                                        "Price".tr,
                                        style: AppText.titleSmall,
                                      ))),
                              CustomDefaultShimmer(
                                padding: const EdgeInsets.only(top: 20),
                                isShimmer:
                                    searchController.isLodingSearchTyp.value,
                                heightShimmer: 30,
                                child: SizedBox(
                                    height: 95,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 50,
                                      ),
                                      child: CustomRangeValueWidget(
                                        beginPoint:
                                            searchController.startPoint.value,
                                        endPoint:
                                            searchController.endPoint.value,
                                        startRange:
                                            searchController.startSlider.value,
                                        endRange:
                                            searchController.endSlider.value,
                                        onChanged: (values) {
                                          searchController.startSlider.value =
                                              values.start;
                                          searchController.endSlider.value =
                                              values.end;
                                          // rangeValue = values;
                                        },
                                        //
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomDefaultShimmer(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  isShimmer: searchController.isLodingSearchTyp.value,
                  heightShimmer: 50,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 30, top: 20),
                    child: CustomButton(
                      onPressed: () {
                        print("====== 213456");
                        searchController.SearchDataPropertype();
                      },
                      title: "Search".tr,
                      isOutline: false,
                    ),
                  ),
                ),
              ],
            ),
            searchController.isLodingSearchTyp.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 4,
                    ),
                  )
                : const Text("")
          ],
        ),
      ),
    );
  }

  Future _onSelectPropertyType(BuildContext context) async {
    var result = showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Choose Property Types",
                    style: AppText.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ),
                // const SizedBox(height: 16.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeController.listSideBarDataCategorie
                      .length, // Replace with your actual content

                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        child: CustomItemButtomsheet(
                          title: homeController
                              .listSideBarDataCategorie[index].name,
                        ),
                        onTap: () {
                          searchController.typeSearchRent.value = homeController
                              .listSideBarDataCategorie[index].name!;
                          Navigator.pop(context);
                        });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.bodySmall!.copyWith(
                    color: value != null && value != ''
                        ? Colors.grey
                        : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
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
