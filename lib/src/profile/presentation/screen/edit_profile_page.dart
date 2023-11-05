import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/home/widget/buttom_sheet_default.dart';
import 'package:goo_rent/src/profile/controller/profile_controller.dart';
import 'package:goo_rent/src/profile/presentation/screen/edit_info.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int _currentGender = 2;
  final _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            'My Account'.tr,
            style: AppText.titleMedium!.copyWith(color: Colors.white),
          ),
        ),
        body: Obx(
          () => _profileController.isLoadingProfile.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.5, color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup<void>(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoActionSheet(
                                title: Text(
                                  "Choose Image".tr,
                                  style: AppText.titleMedium,
                                ),
                                actions: <CupertinoActionSheetAction>[
                                  CupertinoActionSheetAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Take Photo".tr,
                                      style: AppText.titleSmall!.copyWith(
                                          color: AppConstant.kPrimaryColor),
                                    ),
                                  ),
                                  CupertinoActionSheetAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("From Gallery".tr,
                                        style: AppText.titleSmall!.copyWith(
                                            color: AppConstant.kPrimaryColor)),
                                  ),
                                  CupertinoActionSheetAction(
                                    isDestructiveAction: true,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cancel".tr,
                                      style: AppText.titleSmall!
                                          .copyWith(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: _profileController
                                                .editUserModel.value.avatar !=
                                            null
                                        ? CachedNetworkImageProvider(
                                            _profileController.editUserModel
                                                    .value.avatar ??
                                                '')
                                        : const AssetImage(
                                                'assets/image/profile.png')
                                            as ImageProvider,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 5,
                                bottom: 0,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff246BFD),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: const Icon(Icons.edit,
                                      color: Colors.white, size: 22),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildEditItem(
                          labelName: "Name".tr,
                          contentName:
                              '${_profileController.editUserModel.value.firstName ?? ''}${_profileController.editUserModel.value.firstName != null ? ' ' : ''}${_profileController.editUserModel.value.lastName ?? ''}',
                          onTap: () {
                            Get.to(
                              () => ProfileInfoPage(
                                title: 'Change Name',
                                hint1: 'First name',
                                hint2: 'Last name',
                                value1: _profileController
                                    .editUserModel.value.firstName,
                                value2: _profileController
                                    .editUserModel.value.lastName,
                              ),
                            );
                          }),
                      _buildEditItem(
                          labelName: "Phone Number".tr,
                          contentName:
                              '+${_profileController.editUserModel.value.mPrefix ?? ''}${_profileController.editUserModel.value.phone ?? ''}',
                          onTap: () {
                            Get.to(() => ProfileInfoPage(
                                hint1: 'Phone number'.tr,
                                title: 'Change Phone Number',
                                value1: _profileController
                                    .editUserModel.value.phone));
                          }),
                      _buildEditItem(
                          labelName: "Email".tr,
                          contentName:
                              _profileController.editUserModel.value.email ??
                                  '',
                          onTap: () {
                            Get.to(() => ProfileInfoPage(
                                title: 'Change Email Address',
                                hint1: 'Email address',
                                value1: _profileController
                                    .editUserModel.value.email));
                          }),
                      _buildEditItem(
                          labelName: "Telegram".tr,
                          contentName:
                              _profileController.editUserModel.value.telegram ??
                                  '',
                          onTap: () {
                            Get.to(() => ProfileInfoPage(
                                hint1: 'Telegram',
                                title: 'Change Telegram',
                                value1: _profileController
                                    .editUserModel.value.telegram));
                          }),
                      _buildEditItem(
                          labelName: "Address".tr,
                          contentName:
                              _profileController.editUserModel.value.address ??
                                  '',
                          onTap: () {
                            Get.to(() => ProfileInfoPage(
                                hint1: 'Address',
                                title: 'Change Address',
                                value1: _profileController
                                    .editUserModel.value.address));
                          }),
                      _buildEditItem(
                        labelName: "Date Of Birth".tr,
                        contentName:
                            _profileController.editUserModel.value.address ??
                                '',
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (bulder) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.symmetric(
                                      horizontal: 6 * 3),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
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
                                              icon:
                                                  const Icon(Icons.arrow_back),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0 * 4),
                                        child: Divider(),
                                      ),
                                      CalendarDatePicker2(
                                        config:
                                            CalendarDatePicker2WithActionButtonsConfig(
                                          firstDayOfWeek: 0,
                                          controlsTextStyle: AppText.titleSmall,
                                          weekdayLabels: [
                                            'Sun',
                                            'Mon',
                                            'Tue',
                                            'Wed',
                                            'Thu',
                                            'Fri',
                                            'Sat'
                                          ],
                                          calendarType:
                                              CalendarDatePicker2Type.single,
                                          selectedDayTextStyle: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          selectedDayHighlightColor:
                                              Colors.blue[800],
                                          dayTextStyle: AppText.bodyMedium,
                                        ),
                                        onValueChanged: (value) {
                                          _profileController.editUserModel.value
                                              .gender = value[0].toString();
                                        },
                                        value: [DateTime.now()],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0 * 4),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: SizedBox(
                                              height: 50,
                                              child: ElevatedButton(
                                                  style: ElevatedButton
                                                      .styleFrom(),
                                                  onPressed: _profileController
                                                              .editUserModel
                                                              .value
                                                              .dob ==
                                                          null
                                                      ? null
                                                      : () {
                                                          _profileController
                                                                  .editUserModel
                                                                  .value
                                                                  .dob =
                                                              _profileController
                                                                  .editUserModel
                                                                  .value
                                                                  .dob;
                                                          Get.back();
                                                        },
                                                  child: Text(
                                                    "Cancel".tr,
                                                    style: AppText.titleSmall!
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  )),
                                            )),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                                child: SizedBox(
                                              height: 50,
                                              child: ElevatedButton(
                                                  onPressed: () => Get.back(),
                                                  child: Text(
                                                    "Ok".tr,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16 * 2),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                      _buildEditItem(
                          labelName: "Gender".tr,
                          contentName:
                              _profileController.editUserModel.value.gender ??
                                  '',
                          onTap: () {
                            showBottomSheetDefault(
                                context: context,
                                widget: StatefulBuilder(
                                    builder: (context, setStateSex) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0 * 2),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Divider(
                                            color: Colors.grey.withOpacity(0.5),
                                            height: 10,
                                            thickness: 2,
                                          ),
                                        ),
                                        Text(
                                          "Gender".tr,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setStateSex(() {
                                              _currentGender = 1;
                                            });
                                          },
                                          child: SizedBox(
                                            height: 80,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Male".tr,
                                                ),
                                                _currentGender == 1
                                                    ? const Icon(
                                                        CupertinoIcons
                                                            .checkmark,
                                                        color:
                                                            Color(0xff21A6F8),
                                                      )
                                                    : const SizedBox()
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          height: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setStateSex(() {
                                              _currentGender = 2;
                                            });
                                          },
                                          child: SizedBox(
                                            height: 80,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Female".tr,
                                                ),
                                                _currentGender == 2
                                                    ? const Icon(
                                                        CupertinoIcons
                                                            .checkmark,
                                                        color:
                                                            Color(0xff21A6F8))
                                                    : const SizedBox()
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          height: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setStateSex(() {
                                              _currentGender = 3;
                                            });
                                          },
                                          child: SizedBox(
                                            height: 80,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Something else".tr,
                                                ),
                                                _currentGender == 3
                                                    ? const Icon(
                                                        CupertinoIcons
                                                            .checkmark,
                                                        color:
                                                            Color(0xff21A6F8))
                                                    : const SizedBox()
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          height: 5,
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        )
                                      ],
                                    ),
                                  );
                                }));
                          })
                      // StatefulBuilder(builder: (context,setStateSex){
                      //   return _buildEditItem(
                      //       labelName: "ភេទ",
                      //       contentName: "Male",
                      //       onTap: () {
                      //         showBottomSheetDefault(
                      //             context: context,
                      //             widget: Padding(
                      //               padding: const EdgeInsets.symmetric(horizontal: 8.0*2),
                      //               child: Column(
                      //                 mainAxisSize: MainAxisSize.min,
                      //                 children: [
                      //                   Text("ភេទ"),
                      //                   Divider(),
                      //                   InkWell(
                      //                     onTap: (){
                      //                       setStateSex((){
                      //                         _currentGender = 1;
                      //                       });
                      //                     },
                      //                     child: SizedBox(
                      //                       height: 80,
                      //                       child: Row(
                      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                         children: [
                      //                           Text("ប្រុស"),
                      //                           _currentGender == 1 ? Icon(CupertinoIcons.airplane) : SizedBox()
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Divider(),
                      //                   InkWell(
                      //                     onTap: (){
                      //                       setStateSex((){
                      //                         _currentGender = 2;
                      //                       });
                      //                     },
                      //                     child: SizedBox(height: 80,
                      //                       child: Row(
                      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                         children: [
                      //                           Text("ស្រី"),
                      //                           _currentGender == 2 ? Icon(CupertinoIcons.airplane) : SizedBox()
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Divider(),
                      //                   SizedBox(height: 40,)
                      //                 ],
                      //               ),
                      //             ));
                      //       });
                      // }),
                    ],
                  ),
                ),
        ));
  }

  _buildEditItem(
      {required String labelName,
      required String contentName,
      required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelName,
                      style: AppText.bodyMedium!.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      contentName != ''
                          ? contentName
                          : '${'label_no'.tr}$labelName',
                      overflow: TextOverflow.ellipsis,
                      style: AppText.bodyLarge!.copyWith(
                          // color: contentName != '' ? Colors.black : Colors.grey,
                          ),
                    )
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 16,
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 0)
          ],
        ),
      ),
    );
  }
}
