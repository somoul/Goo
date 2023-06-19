import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/src/home/widget/buttom_sheet_default.dart';
import 'package:goo_rent/src/profile/presentation/screen/modified_page.dart';
import 'package:goo_rent/src/profile/presentation/widget/buttom_sheet_edit_profile_photo.dart';
import 'package:google_fonts/google_fonts.dart';

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
          'myAccount'.tr,
          style: AppText.titleMedium!.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.white),
                  shape: BoxShape.circle),
              child: InkWell(
                onTap: () {
                  showBottomEditProfilePhoto(
                      context: context,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            "chooseImage".tr,
                            style: GoogleFonts.kantumruy(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "takePhoto".tr,
                            style: GoogleFonts.kantumruy(
                                fontSize: 20, color: const Color(0xFF21A6F8)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "fromGallery".tr,
                            style: GoogleFonts.kantumruy(
                                fontSize: 20, color: const Color(0xFF21A6F8)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 6,
                            thickness: 10,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "cancel".tr,
                            style: GoogleFonts.kantumruy(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ));
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
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xff246BFD),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildCardWidget(
                labelName: "name".tr,
                contentName: "ហម ហុី",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => ModifiedPage(
                        modifyField: ModifyField(
                            appBarTitle: 'changeName'.tr, textField: 'ហម ហុី'),
                      ),
                    ),
                  );

                  //   GoRouter.of(context).push('/modified_page',
                  //       extra: const ModifyField(
                  //           appBarTitle: "ប្តូរឈ្មោះ", textField: "ហម ហុី"));
                }),
            _buildCardWidget(
                labelName: "phoneNumber".tr,
                contentName: "+(855)0887821785",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => ModifiedPage(
                        modifyField: ModifyField(
                            appBarTitle: 'changePhoneNumber'.tr,
                            textField: '+(855)0887821785'),
                      ),
                    ),
                  );

                  // GoRouter.of(context).push('/modified_page',
                  //     extra: ModifyField(
                  //         appBarTitle: "ប្តូរលេខទូរស័ព្ទ",
                  //         textField: "+(855)0887821785"));
                }),
            _buildCardWidget(
                labelName: "email".tr,
                contentName: "horm@gmail.com",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => ModifiedPage(
                        modifyField: ModifyField(
                            appBarTitle: 'changeEmail'.tr,
                            textField: 'horm@gmail.com'),
                      ),
                    ),
                  );

                  // GoRouter.of(context).push('/modified_page',
                  //     extra: ModifyField(
                  //         appBarTitle: "ប្តូរអុីម៉ែល",
                  //         textField: "horm@gmail.com"));
                }),
            _buildCardWidget(
                labelName: "telegram".tr,
                contentName: "@hormhy",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => ModifiedPage(
                        modifyField: ModifyField(
                            appBarTitle: 'changeTelegram'.tr,
                            textField: '@hormhy'),
                      ),
                    ),
                  );
                }),
            _buildCardWidget(
                labelName: "address".tr,
                contentName: "ភ្នំពេញថ្មី សង្កាត់ឈូកមាស ខណ្ឌសែនសុខ",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => ModifiedPage(
                        modifyField: ModifyField(
                            appBarTitle: 'changeAddress'.tr,
                            textField: 'ភ្នំពេញថ្មី សង្កាត់ឈូកមាស ខណ្ឌសែនសុខ'),
                      ),
                    ),
                  );
                }),
            _buildCardWidget(
                labelName: "dateOfBirth".tr,
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
                                      "chooseDateOfBirth".tr,
                                      style:
                                          GoogleFonts.kantumruy(fontSize: 18),
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
                                            "cancel".tr,
                                            style: GoogleFonts.kantumruy(
                                                fontSize: 16)
                                            // style: TextStyle(fontSize: 16)

                                            ,
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
                                            "set".tr,
                                            style: GoogleFonts.kantumruy(
                                                color: Colors.white,
                                                fontSize: 16),
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
                labelName: "gender".tr,
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
                                "setGender".tr,
                                style: GoogleFonts.kantumruy(
                                    fontSize: 22, fontWeight: FontWeight.bold),
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
                                        "male".tr,
                                        style:
                                            GoogleFonts.kantumruy(fontSize: 16),
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
                                        "female".tr,
                                        style:
                                            GoogleFonts.kantumruy(fontSize: 16),
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
                                        "somethingElse".tr,
                                        style:
                                            GoogleFonts.kantumruy(fontSize: 16),
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
                      style: GoogleFonts.kantumruy(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      contentName,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.kantumruy(fontSize: 18),
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
