import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/home/data/slide_categorie_model/slide_categorie_model.dart';
import 'package:goo_rent/src/home/presentation/screen/map_screen.dart';
import 'package:goo_rent/src/post_property/presentation/screens/rent_step_2_.dart';
import 'package:goo_rent/src/post_property/presentation/widgets/step_1_mixin.dart';
import 'package:goo_rent/src/post_property/presentation/widgets/step_2_mixin.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

import 'package:goo_rent/utils/hide_keybaord.dart';

class RentStepOne extends StatefulWidget {
  const RentStepOne({super.key});

  @override
  State<RentStepOne> createState() => _RentStepOneState();
}

class _RentStepOneState extends State<RentStepOne> with Step1Mixin, Step2Mixin {
  final _formKeyStep1 = GlobalKey<FormState>();
  bool get hideKeyborad => MediaQuery.of(context).viewInsets.bottom == 0.0;
  final DraggableScrollableController _sheetcontroller =
      DraggableScrollableController();

  void _initValue() {
    postController.fieldListStep1.clear();
    for (ColumField field in postController.tempStep1) {
      postController.fieldListStep1.add(
        ColumField(
          rowField: [
            if ((field.rowField?.isNotEmpty ?? false) &&
                field.rowField != null &&
                (field.rowField?.length ?? 0) <= 2)
              ...field.rowField!.map(
                (rowField) {
                  rowField.controller = _getValue(rowField.value);
                  return rowField;
                },
              ).toList(),
          ],
        ),
      );
    }

    setState(() {});
  }

  dynamic _getValue(value) {
    if (value is bool) {
      return value;
    } else {
      return TextEditingController(text: value.toString());
    }
  }

  @override
  void initState() {
    _initValue();
    super.initState();
  }

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
                    child: Form(
                  key: _formKeyStep1,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    children: [
                      ...postController.fieldListStep1.asMap().entries.map(
                        (fColum) {
                          if ((fColum.value.rowField?.length ?? 0) <= 2 &&
                              fColum.value.rowField != null) {
                            return Row(
                              children: [
                                ...fColum.value.rowField!.asMap().entries.map(
                                  (fRow) {
                                    bool notSelect = !fRow.value.isSelect;
                                    if (fRow.value.isDisplay) {
                                      return Expanded(
                                        child: textField(
                                          ///Local check
                                          maxLines: fRow.value.maxLines,
                                          keyboardType: fRow.value.getInputType,
                                          onSelect: notSelect
                                              ? null
                                              : () => _onSelectLocation(
                                                  columKey: fColum.key,
                                                  rowKey: fRow.key),
                                          suffix: fRow.value.suffixAsset == null
                                              ? null
                                              : ClipRRect(
                                                  borderRadius: 8.borderRadius,
                                                  child: ImageBuilder().asset(
                                                      fRow.value.suffixAsset ??
                                                          ''),
                                                ).px(10),

                                          ///From API
                                          field: fRow.value,
                                          onChange: (val) {
                                            setState(() {});
                                          },
                                        )
                                            .pr(fRow.key == 0 ? 8 : 0)
                                            .pl(fRow.key == 1 ? 8 : 0),
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                ).toList(),
                              ],
                            ).px(16);
                          }

                          return const SizedBox();
                        },
                      ).toList(),
                      buildUploadImages().px(16),
                      10.gap,
                      ...postController.fieldListStep1.asMap().entries.map(
                        (fColum) {
                          if ((fColum.value.rowField?.length ?? 0) <= 2 &&
                              fColum.value.rowField != null) {
                            return Row(
                              children: [
                                ...fColum.value.rowField!.asMap().entries.map(
                                  (fRow) {
                                    bool notSelect = !fRow.value.isSelect;
                                    if (!fRow.value.isDisplay) {
                                      return Expanded(
                                        child: textField(
                                          ///Local check
                                          maxLines: fRow.value.maxLines,
                                          keyboardType: fRow.value.getInputType,
                                          onSelect: notSelect
                                              ? null
                                              : () => _onSelectLocation(
                                                  columKey: fColum.key,
                                                  rowKey: fRow.key),
                                          suffix: fRow.value.suffixAsset == null
                                              ? null
                                              : ClipRRect(
                                                  borderRadius: 8.borderRadius,
                                                  child: ImageBuilder().asset(
                                                      fRow.value.suffixAsset ??
                                                          ''),
                                                ).px(10),

                                          ///From API
                                          field: fRow.value,
                                          onChange: (val) {
                                            setState(() {});
                                          },
                                        )
                                            .pr(fRow.key == 0 ? 8 : 0)
                                            .pl(fRow.key == 1 ? 8 : 0),
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                ).toList(),
                              ],
                            ).px(16);
                          }

                          return const SizedBox();
                        },
                      ).toList(),
                    ],
                  ),
                )),
                if (hideKeyborad)
                  Obx(() => Container(
                        color: Colors.grey[100],
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 30, top: 20),
                        child: CustomButton(
                          onPressed: postController.imageList.length == 1
                              ? null
                              : _onNext,
                          title: 'Continue'.tr,
                        ),
                      ))
              ],
            ),
            Obx(
              () => postController.uploading.value
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

  _onNext() async {
    closekeyboard();
    if (_formKeyStep1.currentState!.validate()) {
      if (postController.accessoryData.isEmpty) {
        await postController.getAccessories(showLoading: true);
      }
      await _onShowSelectAccessory();
    }
  }

  _onSelectLocation({required int columKey, required int rowKey}) {
    Get.to(
      MapScreen(
        onSelected: (late, long, location) {
          Get.back();
          setState(
            () {
              postController.fieldListStep1[columKey].rowField![rowKey]
                  .controller = TextEditingController(text: location);
            },
          );
        },
      ),
    );
  }

  _onShowSelectAccessory() {
    closekeyboard();
    if (postController.selectedList.isNotEmpty) {
      Get.to(const RentStepTwo());
    } else {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        isScrollControlled: true,
        isDismissible: false,
        builder: (context) {
          return DraggableScrollableSheet(
            controller: _sheetcontroller,
            expand: false,
            snap: true,
            initialChildSize: .70,
            minChildSize: .70,
            maxChildSize: 1,
            snapSizes: const [.70],
            // shouldCloseOnMinExtent: false,
            builder: (context, scrollController) {
              return Container(
                margin: MediaQuery.paddingOf(context).top.pt,
                color: Colors.transparent,
                child: Material(
                  color: Colors.white,
                  elevation: 8,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 4,
                        margin: 10.pt,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Icon(Icons.clear),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Accessories'.tr,
                          style: AppText.titleMedium,
                        ).px(16),
                      ),
                      Expanded(child: StatefulBuilder(
                        builder: (context, setState) {
                          return GridView.builder(
                            shrinkWrap: false,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            itemCount: postController.accessoryData.length,
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
                                  if (!postController.selectedList.contains(
                                      postController.accessoryData[index])) {
                                    postController.selectedList.add(
                                        postController.accessoryData[index]);
                                  } else {
                                    postController.selectedList.remove(
                                        postController.accessoryData[index]);
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
                                          color: postController.selectedList
                                                  .contains(postController
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
                                            postController.accessoryData[index]
                                                    .icon ??
                                                '',
                                            width: 30),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        postController
                                                .accessoryData[index].name ??
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
                          );
                        },
                      )),
                      Obx(
                        () => CustomButton(
                          onPressed: postController.selectedList.isEmpty
                              ? null
                              : () {
                                  Get.back();
                                  Get.to(const RentStepTwo());
                                },
                          title: 'Continue'.tr,
                        ).px(16),
                      ),
                      (MediaQuery.paddingOf(context).bottom + 16).gap
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }
  }

  //   return showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => StatefulBuilder(
  //       builder: (context, setState) => Container(
  //         height: 650,
  //         width: double.infinity,
  //         decoration: const BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.horizontal(
  //                 left: Radius.circular(10), right: Radius.circular(10))),
  //         child: Column(
  //           children: [
  //             Expanded(
  //               child: Obx(
  //                 () => postController.isLoadAccessory.value
  //                     ? const Center(
  //                         child: CircularProgressIndicator(),
  //                       )
  //                     : Column(
  //                         children: [
  //                           Row(children: [
  //                             Expanded(
  //                               child: Padding(
  //                                 padding: const EdgeInsets.only(left: 20),
  //                                 child: Text(
  //                                   'Accessories',
  //                                   style: AppText.titleMedium,
  //                                 ),
  //                               ),
  //                             ),
  //                             IconButton(
  //                                 onPressed: () => Get.back(),
  //                                 icon: Container(
  //                                     padding: const EdgeInsets.all(10),
  //                                     child: const Icon(Icons.clear)))
  //                           ]),
  //                           GridView.builder(
  //                             shrinkWrap: true,
  //                             physics: const NeverScrollableScrollPhysics(),
  //                             padding: const EdgeInsets.symmetric(
  //                                 horizontal: 15, vertical: 15),
  //                             itemCount: postController.accessoryData.length,
  //                             gridDelegate:
  //                                 const SliverGridDelegateWithFixedCrossAxisCount(
  //                               crossAxisCount: 4,
  //                               crossAxisSpacing: 8,
  //                               mainAxisSpacing: 10,
  //                               // childAspectRatio: 2 / 2.9,
  //                               mainAxisExtent: 100,
  //                             ),
  //                             itemBuilder: (context, index) {
  //                               return InkWell(
  //                                 onTap: () {
  //                                   if (!selectedList.contains(
  //                                       postController.accessoryData[index])) {
  //                                     selectedList.add(
  //                                         postController.accessoryData[index]);
  //                                   } else {
  //                                     selectedList.remove(
  //                                         postController.accessoryData[index]);
  //                                   }
  //                                   setState(() {});
  //                                 },
  //                                 child: Container(
  //                                   padding: const EdgeInsets.symmetric(
  //                                       horizontal: 4),
  //                                   decoration: BoxDecoration(
  //                                       color: Colors.transparent,
  //                                       borderRadius: BorderRadius.circular(10),
  //                                       border: Border.all(
  //                                           width: 1,
  //                                           color: selectedList.contains(
  //                                                   postController
  //                                                       .accessoryData[index])
  //                                               ? AppConstant.kPrimaryColor
  //                                               : Colors.transparent)),
  //                                   child: Column(
  //                                     children: [
  //                                       const SizedBox(height: 5),
  //                                       Container(
  //                                         padding: const EdgeInsets.all(14),
  //                                         decoration: BoxDecoration(
  //                                           color: Colors.grey[200]!,
  //                                           shape: BoxShape.circle,
  //                                         ),
  //                                         child: Image.network(
  //                                             postController
  //                                                     .accessoryData[index]
  //                                                     .icon ??
  //                                                 '',
  //                                             width: 30),
  //                                       ),
  //                                       const SizedBox(height: 4),
  //                                       Text(
  //                                         postController
  //                                                 .accessoryData[index].name ??
  //                                             "",
  //                                         style: AppText.bodySmall,
  //                                         overflow: TextOverflow.ellipsis,
  //                                         maxLines: 1,
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ), //_buildAccessoryItem(accessoryList[index]),
  //                               );
  //                             },
  //                           )
  //                         ],
  //                       ),
  //               ),
  //             ),
  //             Container(
  //               color: Colors.grey[100],
  //               padding: const EdgeInsets.only(
  //                   left: 15, right: 15, bottom: 30, top: 20),
  //               child: CustomButton(
  //                 onPressed: selectedList.isEmpty
  //                     ? null
  //                     : () {
  //                         KeyboardHeper.hideKeyborad();
  //                         Get.back();
  //                         Get.to(const RentStepTwo());
  //                       },
  //                 title: 'Continue'.tr,
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
}
