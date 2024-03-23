import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/data/slide_categorie_model/slide_categorie_model.dart';
import 'package:goo_rent/src/post_property/controller/post_property_controller.dart';
import 'package:goo_rent/src/post_property/presentation/screens/review_submit.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/src/post_property/presentation/widgets/step_2_mixin.dart';
import 'package:goo_rent/utils/extension/widget.dart';
import 'package:goo_rent/utils/hide_keybaord.dart';

class RentStepTwo extends StatefulWidget {
  const RentStepTwo({super.key});

  @override
  State<RentStepTwo> createState() => _RentStepTwoState();
}

class _RentStepTwoState extends State<RentStepTwo> with Step2Mixin {
  final controller = Get.put(HomeController());
  final postController = Get.put(PostPropertyController());
  final _formKey = GlobalKey<FormState>();
  bool get hideKeyborad => MediaQuery.of(context).viewInsets.bottom == 0.0;
  bool get _hasFields {
    return controller.selectedCategory.value.columField != null &&
        (controller.selectedCategory.value.columField?.isNotEmpty ?? false);
  }

  void _initValue() {
    if (_hasFields) {
      postController.fieldListStep2.clear();
      for (ColumField field
          in controller.selectedCategory.value.columField ?? []) {
        postController.fieldListStep2.add(
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
    }
    setState(() {});
  }

  bool _has2Radio(List<RowField> list) {
    if (list.length < 2) {
      return true;
    }
    var zero = list.first.value is bool;
    var second = list.last.value is bool;
    return zero && second;
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (postController.fieldListStep2.isNotEmpty)
                        ...postController.fieldListStep2.asMap().entries.map(
                          (fColum) {
                            // if (_has2Radio(fColum.value.rowField!)) {
                            //   return Row(
                            //     children: fColum.value.rowField!
                            //         .map(
                            //           (fRow) => disPlay2Radio(
                            //             context,
                            //             label: fRow.label ?? '',
                            //             value: fRow.checkBoolean,
                            //             onTop: () {
                            //               setState(() {
                            //                 fRow.value.value =
                            //                     !fRow.value.value;
                            //               });
                            //             },
                            //           ),
                            //         )
                            //         .toList(),
                            //   );
                            // }

                            return Row(
                              children: [
                                ...fColum.value.rowField!.asMap().entries.map(
                                  (fRow) {
                                    if (fRow.value.value is bool) {
                                      return Expanded(
                                        child: radioButton(
                                          context,
                                          label: fRow.value.label ?? '',
                                          value: fRow.value.checkBoolean,
                                          onTop: () {
                                            setState(() {
                                              fRow.value.value =
                                                  !fRow.value.value;
                                            });
                                          },
                                        ),
                                      );
                                    }
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
                                  },
                                ).toList(),
                              ],
                            );
                          },
                        ).toList(),
                    ],
                  ),
                ),
              ),
            ),
            if (hideKeyborad)
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 30),
                child: CustomButton(
                  title: 'Continue'.tr,
                  onPressed: _onContinue,
                ),
              )
          ],
        ),
      ),
    );
  }

  _onContinue() {
    if (_formKey.currentState!.validate()) {
      Get.to(const ReviewSubmit());
    }
  }
}
