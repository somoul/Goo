import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/post_property/presentation/widgets/step_1_mixin.dart';
import 'package:goo_rent/src/post_property/presentation/widgets/step_2_mixin.dart';
import 'package:goo_rent/utils/extension/edge_insets.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

class ReviewSubmit extends StatefulWidget {
  const ReviewSubmit({super.key});

  @override
  State<ReviewSubmit> createState() => _ReviewSubmitState();
}

class _ReviewSubmitState extends State<ReviewSubmit>
    with Step1Mixin, Step2Mixin {
  bool get hideKeyborad => MediaQuery.of(context).viewInsets.bottom == 0.0;
  final DraggableScrollableController _sheetcontroller =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        closekeyboard();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff9f9f9),
        appBar: AppBar(
          title: Text('Review Form'.tr),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ...postController.fieldListStep1.asMap().entries.map(
                    (fColum) {
                      if ((fColum.value.rowField?.length ?? 0) <= 2 &&
                          fColum.value.rowField != null) {
                        return Row(
                          children: [
                            ...fColum.value.rowField!.asMap().entries.map(
                              (fRow) {
                                // bool notSelect = !fRow.value.isSelect;
                                if (fRow.value.isDisplay) {
                                  return Expanded(
                                    child: textField(
                                      ///Local check
                                      maxLines: fRow.value.maxLines,
                                      keyboardType: fRow.value.getInputType,
                                      // onSelect: notSelect
                                      //     ? null
                                      //     : () => _onSelectLocation(
                                      //         columKey: fColum.key, rowKey: fRow.key),
                                      suffix: fRow.value.suffixAsset == null
                                          ? null
                                          : ClipRRect(
                                              borderRadius: 8.borderRadius,
                                              child: ImageBuilder().asset(
                                                  fRow.value.suffixAsset ?? ''),
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

                  //       ////
                  //       ///
                  //       ///
                  //       ///
                  //       /// Step 2 all fields

                  if (postController.fieldListStep2.isNotEmpty)
                    ...postController.fieldListStep2.asMap().entries.map(
                      (fColum) {
                        return Row(
                          children: [
                            ...fColum.value.rowField!.asMap().entries.map(
                              (fRow) {
                                if (fRow.value.value is bool) {
                                  return radioButton(
                                    context,
                                    label: fRow.value.label ?? '',
                                    value: fRow.value.checkBoolean,
                                    onTop: () {
                                      setState(() {
                                        fRow.value.value = !fRow.value.value;
                                      });
                                    },
                                  );
                                }

                                TextEditingController controller = fRow
                                    .value.controller as TextEditingController;

                                if (controller.text.isNotEmpty) {
                                  return Expanded(
                                    child: textField(
                                      ///Local check
                                      // maxLines: fRow.value.maxLines,
                                      keyboardType: fRow.value.getInputType,

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
                      },
                    ).toList(),
                  //       ////
                  //       ///
                  //       ///
                  //       ///
                  //       ///
                  //       /// Step 1 fields bottom Description
                  ...postController.fieldListStep1.asMap().entries.map(
                    (fColum) {
                      if ((fColum.value.rowField?.length ?? 0) <= 2 &&
                          fColum.value.rowField != null) {
                        return Row(
                          children: [
                            ...fColum.value.rowField!.asMap().entries.map(
                              (fRow) {
                                TextEditingController controller = fRow
                                    .value.controller as TextEditingController;
                                if (!fRow.value.isDisplay &&
                                    controller.text.isNotEmpty) {
                                  return Expanded(
                                    child: textField(
                                      ///Local check
                                      maxLines: fRow.value.maxLines,
                                      keyboardType: fRow.value.getInputType,
                                      suffix: fRow.value.suffixAsset == null
                                          ? null
                                          : ClipRRect(
                                              borderRadius: 8.borderRadius,
                                              child: ImageBuilder().asset(
                                                  fRow.value.suffixAsset ?? ''),
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
            ),
            if (hideKeyborad)
              Container(
                margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 16 + MediaQuery.of(context).padding.bottom),
                width: double.infinity,
                child: CustomButton(
                  title: 'Submit'.tr,
                  onPressed: _showTermAndCondiction,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showTermAndCondiction() {
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
          shouldCloseOnMinExtent: false,
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
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Please Read Terms and Conditions'.tr,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ).px(16).pt(25),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding:
                            16.py.pb(MediaQuery.paddingOf(context).bottom + 16),
                        controller: scrollController,
                        child: SizedBox(
                          width: double.infinity,
                          child: Builder(
                            builder: (context) {
                              return Column(
                                children: [
                                  const Divider(height: 0),
                                  15.gap,
                                  Text("termCondictionContent".tr,
                                      style: AppText.bodyMedium),
                                  15.gap,
                                  Text(
                                    "10\$",
                                    style: AppText.titleLarge!.copyWith(
                                      color: AppConstant.kPrimaryColor,
                                      fontSize: 35,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          AppConstant.kPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    "When customer use use our App".tr,
                                    style: AppText.bodySmall!
                                        .copyWith(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                  20.gap,
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Promotion".tr,
                                      style: AppText.titleMedium!.copyWith(
                                        color: AppConstant.kPrimaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            AppConstant.kPrimaryColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  4.gap,
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'promotionContent'.tr,
                                    ),
                                  )
                                ],
                              ).px(16);
                            },
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      title: 'Confirm'.tr,
                      onPressed: () {
                        Get.back();
                      },
                    ).px(16),
                    12.gap,
                    CustomButton(
                      title: 'Deny'.tr,
                      isOutline: true,
                      onPressed: () {
                        Get.back();
                      },
                    ).px(16),
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
