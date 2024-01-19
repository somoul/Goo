import 'dart:io';
import 'dart:io' as io;
import 'dart:convert';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/enum/select_image.dart';
import 'package:goo_rent/helper/context_provider.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:image_picker/image_picker.dart';

// Future<SelectPhotoOption>
Future _showSelectPhotoDialog() async {
  return await showCupertinoModalPopup(
    context: ContextProvider.context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Text(
        "Choose Image".tr,
        style: AppText.titleMedium,
      ),
      actions: SelectPhotoOption.values.asMap().entries.map(
        (option) {
          var title = option.value.title.tr;
          if (option.key == 2) {
            return CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Get.back(result: option.value.source);
                // Navigator.pop(context, option.value);
              },
              child: Text(
                title,
                style: AppText.titleSmall!.copyWith(color: Colors.red),
              ),
            );
          }
          return CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              // Navigator.pop(context, option.value);
              Get.back(result: option.value.source);
            },
            child: Text(
              title,
              style: AppText.titleSmall!
                  .copyWith(color: AppConstant.kPrimaryColor),
            ),
          );
        },
      ).toList(),
    ),
  );
}

Future _pickImage(ImageSource imageSource) async {
  try {
    final file = await ImagePicker().pickImage(source: imageSource);
    if (file != null) {
      return File(file.path);
    }
    return null;
  } catch (_) {}
}

Future<File?> pickImageGetFile() async {
  var imageSource = await _showSelectPhotoDialog();
  if (imageSource != null) {
    return await _pickImage(imageSource);
  }
  return null;
}

Future<String?> pickFileGetBase64() async {
  var file = await pickImageGetFile();
  if (file != null) {
    var bytes = file.readAsBytesSync();
    final base64String = base64Encode(bytes);
    print('__________${base64String}_________');
    return base64Encode(bytes);
  } else {
    return null;
  }
}

onShowChangeLanguage(
    {VoidCallback? onSelected, bool barrierDismissible = false}) async {
  List<Map<String, dynamic>> langList = [
    {
      'name': 'ភាសាខ្មែរ',
      'code': 'km',
      'icon': 'assets/image/ic_cam.png',
    },
    {
      'name': 'English',
      'code': 'en',
      'icon': 'assets/image/ic_en.png',
    },
  ];

  showDialog(
    context: ContextProvider.context,
    barrierDismissible: barrierDismissible,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      titlePadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      contentPadding: const EdgeInsets.all(0),
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
            color: AppConstant.kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Center(
          child: Text(
            'Choose Language'.tr,
            style:
                AppText.titleSmall!.copyWith(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 160,
        child: Column(
          children: langList
              .asMap()
              .entries
              .map(
                (e) => Column(
                  children: [
                    if (e.key == 1)
                      Divider(
                        height: 0,
                        thickness: 0.5,
                        color: Colors.grey[300],
                      ),
                    InkWell(
                      onTap: () async {
                        if (e.key == 0) {
                          await onUpdateLanguage(isKhmer: true);
                        } else {
                          await onUpdateLanguage(isKhmer: false);
                        }
                        if (onSelected != null) {
                          onSelected();
                        }
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        child: Row(
                          children: [
                            Image.asset(
                              e.value['icon'],
                              width: 30,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              e.value['name'],
                              style: AppText.titleSmall,
                            ),
                            const Spacer(),
                            langCode != e.value['code']
                                ? 0.gap
                                //  Icon(
                                //     Icons.circle_outlined,
                                //     color: Colors.grey[400],
                                //   )
                                : const Icon(
                                    Icons.check_circle,
                                    color: AppConstant.kPrimaryColor,
                                  )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    ),
  );
}

Future<String?> showAppDatePicker() async {
  String? date;
  return await showDialog(
    context: ContextProvider.context,
    builder: (bulder) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 6 * 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Choose Date of Birth".tr,
                        style: AppText.titleSmall,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0 * 4),
                  child: Divider(),
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2WithActionButtonsConfig(
                    firstDayOfWeek: 0,
                    controlsTextStyle: AppText.titleSmall,
                    weekdayLabels: [
                      'Sun'.tr,
                      'Mon'.tr,
                      'Tue'.tr,
                      'Wed'.tr,
                      'Thu'.tr,
                      'Fri'.tr,
                      'Sat'.tr
                    ],
                    calendarType: CalendarDatePicker2Type.single,
                    selectedDayTextStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    selectedDayHighlightColor: Colors.blue[800],
                    dayTextStyle: AppText.bodyMedium,
                  ),
                  onValueChanged: (value) {
                    setState(() {
                      date = value[0].toString();
                    });

                    // _profileController.editUserModel.value.gender =
                    //     value[0].toString();
                  },
                  value: [DateTime.now()],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0 * 4),
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {
                              Get.back(result: null);
                            },
                            // _profileController.editUserModel.value.dob == null
                            //     ? null
                            //     : () {
                            //         _profileController
                            //                 .editUserModel.value.dob =
                            //             _profileController
                            //                 .editUserModel.value.dob;
                            //         Get.back();
                            //       },
                            child: Text(
                              "Cancel".tr,
                              style: AppText.titleSmall!
                                  .copyWith(color: Colors.white),
                            )),
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.back(result: date);
                            },
                            child: Text(
                              "Ok".tr,
                              style: const TextStyle(color: Colors.white),
                            )),
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 16 * 2),
              ],
            );
          },
        ),
      );
    },
  );
}
