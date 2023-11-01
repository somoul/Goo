import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_text_field.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/src/post_property/controller/post_property_controller.dart';
import 'package:goo_rent/src/post_property/data/accessory_model.dart';
import 'package:goo_rent/src/post_property/presentation/screens/rent_step_2_.dart';

import 'package:goo_rent/utils/hide_keybaord.dart';

class RentStepOne extends StatefulWidget {
  const RentStepOne({super.key});

  @override
  State<RentStepOne> createState() => _RentStepOneState();
}

class _RentStepOneState extends State<RentStepOne> {
  final _postPropertyController = Get.put(PostPropertyController());
  List<AccessoryModel> selectedList = [];
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
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              children: [
                CustomTextField(
                  labelText: 'Title'.tr,
                  hindText: 'Enter title'.tr,
                  onChange: (val) => _postPropertyController.title.value = val,
                ),
                CustomTextField(
                  labelText: 'Additional Information'.tr,
                  hindText: 'Enter additional information'.tr,
                  maxLines: 7,
                  textInputAction: TextInputAction.done,
                  onChange: (val) =>
                      _postPropertyController.additionalInformation.value = val,
                )
              ],
            )),
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 30, top: 20),
              child: Obx(
                () => CustomButton(
                  onPressed: _postPropertyController.title.value == ''
                      ? null
                      : () async {
                          await _postPropertyController.getAccessories();
                          await _onShowSelectAccessory();
                        },
                  title: 'Continue'.tr,
                ),
              ),
            )
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
                      () => _postPropertyController.isLoadAccessory.value
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
                                  itemCount: _postPropertyController
                                      .accessoryData.length,
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
                                            _postPropertyController
                                                .accessoryData[index])) {
                                          selectedList.add(
                                              _postPropertyController
                                                  .accessoryData[index]);
                                        } else {
                                          selectedList.remove(
                                              _postPropertyController
                                                  .accessoryData[index]);
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: selectedList.contains(
                                                        _postPropertyController
                                                                .accessoryData[
                                                            index])
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
                                                  _postPropertyController
                                                          .accessoryData[index]
                                                          .icon ??
                                                      '',
                                                  width: 30),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              _postPropertyController
                                                      .accessoryData[index]
                                                      .name ??
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
            ));
  }
}
