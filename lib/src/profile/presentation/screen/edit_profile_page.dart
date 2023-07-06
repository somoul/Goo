import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/src/home/widget/buttom_sheet_default.dart';
import 'package:goo_rent/src/profile/presentation/screen/edit_info.dart';

class EditProfilePage extends StatefulWidget {
  static const String routeName = '/edit_profile_page';

  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int _currentGender = 2;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.white),
                  shape: BoxShape.circle),
              child: InkWell(
                onTap: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => CupertinoActionSheet(
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
                            style: AppText.titleSmall!
                                .copyWith(color: AppConstant.kPrimaryColor),
                          ),
                        ),
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("From Gallery".tr,
                              style: AppText.titleSmall!
                                  .copyWith(color: AppConstant.kPrimaryColor)),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel".tr,
                            style:
                                AppText.titleSmall!.copyWith(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/icons/person.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                        right: 5,
                        bottom: 0,
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xff246BFD),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.edit,
                                color: Colors.white, size: 22)))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildCardWidget(
                labelName: "Name".tr,
                contentName: "ហម ហុី",
                onTap: () {
                  Get.to(() =>
                      const ProfileInfoPage(title: 'Change Name', value: ''));
                }),
            _buildCardWidget(
                labelName: "Phone Number".tr,
                contentName: "+(855)0887821785",
                onTap: () {
                  Get.to(() => const ProfileInfoPage(
                      title: 'Change Phone Number', value: ''));
                }),
            _buildCardWidget(
                labelName: "Email".tr,
                contentName: "horm@gmail.com",
                onTap: () {
                  Get.to(() => const ProfileInfoPage(
                      title: 'Change Email Address', value: ''));
                }),
            _buildCardWidget(
                labelName: "Telegram".tr,
                contentName: "@hormhy",
                onTap: () {
                  Get.to(() => const ProfileInfoPage(
                      title: 'Change Telegram', value: ''));
                }),
            _buildCardWidget(
                labelName: "Address".tr,
                contentName: "ភ្នំពេញថ្មី សង្កាត់ឈូកមាស ខណ្ឌសែនសុខ",
                onTap: () {
                  Get.to(() => const ProfileInfoPage(
                      title: 'Change Address', value: ''));
                }),
            _buildCardWidget(
                labelName: "Date Of Birth".tr,
                contentName: "December 27,1998",
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (bulder) {
                        return Dialog(
                          insetPadding:
                              const EdgeInsets.symmetric(horizontal: 6 * 3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Choose Date of Birth".tr,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.arrow_back)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 8.0 * 4),
                                child: Divider(),
                              ),
                              CalendarDatePicker2(
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(
                                  firstDayOfWeek: 0,
                                  controlsTextStyle:
                                      const TextStyle(fontSize: 24),
                                  weekdayLabels: [
                                    'Sun',
                                    'Mon',
                                    'Tue',
                                    'Wed',
                                    'Thu',
                                    'Fri',
                                    'Sat'
                                  ],
                                  calendarType: CalendarDatePicker2Type.single,
                                  selectedDayTextStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                  selectedDayHighlightColor: Colors.blue[800],
                                  // customModePickerButtonIcon: const SizedBox(),
                                ),
                                value: [DateTime.now()],
                              ),
                              const SizedBox(
                                height: 20,
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
                                          style: ElevatedButton.styleFrom(
                                              // backgroundColor:
                                              //     Colors.grey.shade200,
                                              ),
                                          onPressed: () {},
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
                                          onPressed: () {},
                                          child: Text(
                                            "Okay".tr,
                                          )),
                                    ))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16 * 2,
                              ),
                            ],
                          ),
                        );
                      });
                }),
            _buildCardWidget(
                labelName: "Gender".tr,
                contentName: "Male",
                onTap: () {
                  showBottomSheetDefault(
                      context: context,
                      widget: StatefulBuilder(builder: (context, setStateSex) {
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8.0 * 2),
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Male".tr,
                                      ),
                                      _currentGender == 1
                                          ? const Icon(
                                              CupertinoIcons.checkmark,
                                              color: Color(0xff21A6F8),
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Female".tr,
                                      ),
                                      _currentGender == 2
                                          ? const Icon(CupertinoIcons.checkmark,
                                              color: Color(0xff21A6F8))
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Something else".tr,
                                      ),
                                      _currentGender == 3
                                          ? const Icon(CupertinoIcons.checkmark,
                                              color: Color(0xff21A6F8))
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
            //   return _buildCardWidget(
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
    );
  }

  _buildCardWidget(
      {required String labelName,
      required String contentName,
      required void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelName,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      contentName,
                      overflow: TextOverflow.visible,
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
            const Divider(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
