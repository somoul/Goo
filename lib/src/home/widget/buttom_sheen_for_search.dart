import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';

import '../../../cores/constant/app_text.dart';
import '../../../cores/utils/custom_button.dart';
import '../controler/animation_background_banner_provider/home_controller.dart';

import 'custom_drop_down_button_widget.dart';
import 'custom_rangevalue_widget.dart';

void showBottomSheetFunction({required BuildContext context}) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return const BottomSheetScreen();
      });
}

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final homeController = Get.put(HomeController());
    homeController.startSlider = 0;
    homeController.endSlider = 100;

    int indexTapber = 0;
    return AnimatedPadding(
      duration: kThemeAnimationDuration,
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StatefulBuilder(builder: (context, setStateRent) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setStateRent(() {
                          // isRentForHome = true;
                          indexTapber = 0;
                          // controllerBusiness.text = "";
                        });
                      },
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        // topRight: Radius.circular(25),
                      ),
                      child: Container(
                        height: 65,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: indexTapber == 0
                              ? AppConstant.kPrimaryColor
                              : const Color(0xffBFBFBF),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            // topRight: Radius.circular(25),
                          ),
                        ),
                        child: Text(
                          "សម្រាប់លំនៅដ្ធាន",
                          style: AppText.bodyMedium!.copyWith(
                              fontSize: 16,
                              color: indexTapber == 0
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setStateRent(() {
                          indexTapber = 1;
                          // controllerHome.text = "";
                        });
                      },
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        // topRight: Radius.circular(25),
                      ),
                      child: Container(
                        height: 65,
                        // padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: indexTapber == 1
                              ? AppConstant.kPrimaryColor
                              : const Color(0xffBFBFBF),
                          borderRadius: const BorderRadius.only(
                            // topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Text(
                          "សម្រាប់អាជីវកម្ម",
                          style: AppText.bodyMedium!.copyWith(
                              fontSize: 16,
                              color: indexTapber == 1
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            Padding(
                padding: const EdgeInsets.only(
                  left: AppConstant.paddingMedium,
                  top: AppConstant.paddingMedium,
                  right: AppConstant.paddingLarge,
                  bottom: AppConstant.paddingLarge + 25,
                ),
                child: CustomScrenBottomSheet(
                  onChangedLocation: (value) {
                    homeController.textLocationHome.value = value;
                  },
                  onChangedServices: (value) {
                    homeController.textServiceHome.value = value;
                    print("=========================vale :$value==========");
                  },
                  valuePrice: "adsf",
                  itemList: const [
                    'បន្ទប់ជួល',
                    'ផ្ទះជួល',
                    'ខុនដូរជួរ',
                    'អាផាតមិនជួល',
                    'វីឡាជួល',
                    'ភូមិគ្រិះជួល',
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class CustomScrenBottomSheet extends StatelessWidget {
  final Function(String)? onChangedLocation;
  final Function(String)? onChangedServices;

  final String valuePrice;
  final List<String> itemList;
  const CustomScrenBottomSheet({
    super.key,
    required this.onChangedLocation,
    required this.onChangedServices,
    required this.valuePrice,
    required this.itemList,
  });

  @override
  Widget build(BuildContext context) {
    List<double> valueSlider = [0.0, 50.0];
    // final myController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppConstant.paddingMedium),
          child: Text(
            "ទីតាំង",
            style: AppText.titleSmall,
          ),
        ),
        SizedBox(
          height: 50,
          child: TextField(
            enabled: false,
            onChanged: (textConterLocation) {
              // myController.text = "";
              onChangedLocation!(textConterLocation);
            },
            style: AppText.titleMedium!.copyWith(fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintStyle: AppText.titleSmall!
                  .copyWith(fontSize: 14.sp, color: const Color(0XFFDADADA)),
              hintText: "បញ្ចូលទីតាំងរបស់អ្នកត្រូវជួល",
              contentPadding: const EdgeInsets.all(0),
              suffixIcon: IconButton(
                  onPressed: () {
                    // GoRouter.of(context)
                    //     .push(BuildAddressScreen.routeName);
                  },
                  icon: const Icon(Icons.arrow_forward_ios_sharp)),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SvgPicture.asset(
                    'assets/icons/location.svg',
                    width: 16,
                    height: 19,
                  ),
                ),
              ),
              errorBorder: _getDecoreOutLineBorderTextField(),
              focusedBorder: _getDecoreOutLineBorderTextField(),
              focusedErrorBorder: _getDecoreOutLineBorderTextField(),
              disabledBorder: _getDecoreOutLineBorderTextField(),
              enabledBorder: _getDecoreOutLineBorderTextField(),
              border: _getDecoreOutLineBorderTextField(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: AppConstant.paddingMedium,
              bottom: AppConstant.paddingMedium),
          child: Text(
            "សេវាកម្ម",
            style: AppText.titleSmall,
          ),
        ),
        CustomDropDownButtonWidget(
          iconWidget: const Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.grey,
          ),
          hintText: 'ជ្រើសរើសប្រភេទជួលអ្នកត្រូវការ',
          svgSrc: 'assets/icons/home3.svg',
          itemList: itemList,
          onChangedServices: (value) {
            onChangedServices!(value!);
          },
        ),
        const SizedBox(
          height: 20,
        ),
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
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CustomButton(
            onPressed: () {},
            title: "ចាប់ផ្តើមស្វែងរក",
            isOutline: false,
          ),
        ),
      ],
    );
  }
}

_getDecoreOutLineBorderTextField() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.grey.shade300),
  );
}
