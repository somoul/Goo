import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_text_field.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/src/post_property/presentation/screens/rent_step_2_.dart';
import 'package:goo_rent/src/post_property/presentation/widgets/step_1_mixin.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

import 'package:goo_rent/utils/hide_keybaord.dart';

class RentStepOne extends StatefulWidget {
  const RentStepOne({super.key});

  @override
  State<RentStepOne> createState() => _RentStepOneState();
}

class _RentStepOneState extends State<RentStepOne> with StepOneMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardHeper.hideKeyborad(),
      child: Scaffold(
        backgroundColor: const Color(0xfff9f9f9),
        appBar: AppBar(
          title: Text('Request Rent'.tr),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  children: [
                    CustomTextField(
                      labelText: 'Title'.tr,
                      hindText: 'Enter title'.tr,
                      onChange: (val) => controller.title.value = val,
                    ).px(15),
                    10.gap,
                    CustomTextField(
                      labelText: 'Location'.tr,
                      hindText: 'Select location'.tr,
                      onChange: (val) => controller.title.value = val,
                    ).px(15),
                    10.gap,
                    CustomTextField(
                      labelText: 'Price/Month'.tr,
                      hindText: 'Enter price'.tr,
                      onChange: (val) => controller.title.value = val,
                    ).px(15),
                    15.gap,
                    buildUploadImages(),
                    10.gap,
                    CustomTextField(
                      labelText: 'Additional Information'.tr,
                      hindText: 'Enter additional information'.tr,
                      maxLines: 7,
                      textInputAction: TextInputAction.done,
                      onChange: (val) =>
                          controller.additionalInformation.value = val,
                    ).px(15),
                  ],
                )),
                Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 30, top: 20),
                  child: Obx(
                    () => CustomButton(
                      onPressed: controller.title.value == ''
                          ? null
                          : () async {
                              await controller.getAccessories();
                              await _onShowSelectAccessory();
                            },
                      title: 'Continue'.tr,
                    ),
                  ),
                )
              ],
            ),
            Obx(
              () => controller.uploading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  _onShowSelectAccessory() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          height: 650,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10), right: Radius.circular(10))),
          child: Column(
            children: [
              Expanded(
                  child: Obx(
                () => controller.isLoadAccessory.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Row(children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'Accessories',
                                  style: AppText.titleMedium,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(Icons.clear)))
                          ]),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            itemCount: controller.accessoryData.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 10,
                              // childAspectRatio: 2 / 2.9,
                              mainAxisExtent: 100,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (!selectedList.contains(
                                      controller.accessoryData[index])) {
                                    selectedList
                                        .add(controller.accessoryData[index]);
                                  } else {
                                    selectedList.remove(
                                        controller.accessoryData[index]);
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1,
                                          color: selectedList.contains(
                                                  controller
                                                      .accessoryData[index])
                                              ? AppConstant.kPrimaryColor
                                              : Colors.transparent)),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 5),
                                      Container(
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200]!,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                            controller.accessoryData[index]
                                                    .icon ??
                                                '',
                                            width: 30),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        controller.accessoryData[index].name ??
                                            "",
                                        style: AppText.bodySmall,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ), //_buildAccessoryItem(accessoryList[index]),
                              );
                            },
                          )
                        ],
                      ),
              )),
              Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 30, top: 20),
                child: CustomButton(
                  onPressed: selectedList.isEmpty
                      ? null
                      : () {
                          KeyboardHeper.hideKeyborad();
                          Get.back();
                          Get.to(const RentStepTwo());
                        },
                  title: 'Continue'.tr,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
