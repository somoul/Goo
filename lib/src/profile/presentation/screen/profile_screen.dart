import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/utils/context_provider.dart';
import 'package:goo_rent/cores/utils/custom_button.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/profile/presentation/screen/components/custom_item_button.dart';
import 'package:goo_rent/src/profile/presentation/screen/components/custom_listile.dart';
import 'package:goo_rent/src/profile/presentation/screen/edit_profile_page.dart';
import 'package:goo_rent/src/profile/presentation/screen/problem_page.dart';
import 'package:goo_rent/src/profile/presentation/screen/real_estate_page.dart';

import 'package:share_plus/share_plus.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.white),
                    shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/icons/person.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("SOTH MENGHOUR",
                      style: AppText.bodyMedium!
                          .copyWith(color: Colors.white, fontSize: 16)
                      //style: TextStyle(color: Colors.white),
                      ),
                  Text(
                    "${'ID'.tr}: 09999",
                    style: AppText.bodySmall!.copyWith(
                        color: Colors.white.withOpacity(0.6), fontSize: 14),
                  )
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.grey,
                  shape: const StadiumBorder(),
                  backgroundColor:
                      AppConstant.kPrimaryColor, // Background color
                ),
                onPressed: () {
                  Get.to(() => const EditProfilePage());
                },
                child: Text(
                  'Edit'.tr,
                  style: AppText.titleSmall,
                ),
              )
            ]),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 20),
                // CustomListile(
                //   title: 'Dark Mode'.tr,
                //   onTap: null,
                //   leadingAsset: 'assets/icons/Darks.png',
                //   trailing: StyledSwitch(
                //     onToggled: (bool isToggled) {},
                //   ),
                // ),
                // CustomListile(
                //     title: 'Notification'.tr,
                //     onTap: () {},
                //     leadingAsset: 'assets/icons/notifications.png'),

                CustomListile(
                  title: 'Share'.tr,
                  leadingAsset: 'assets/icons/share.png',
                  onTap: () async {
                    await onShare(context);
                  },
                ),
                CustomListile(
                    title: 'Security'.tr,
                    onTap: () {},
                    leadingAsset: 'assets/icons/Security.png'),
                CustomListile(
                    title: 'Change Language'.tr,
                    onTap: onShowChangeLanguage,
                    leadingAsset: 'assets/icons/lange.png'),
                CustomListile(
                    title: 'About Us'.tr,
                    onTap: () {},
                    leadingAsset: 'assets/icons/About.png'),
                CustomListile(
                  title: 'Logout'.tr,
                  onTap: () => _onLogout(context),
                  leadingAsset: 'assets/icons/Security.png',
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        left: AppConstant.padding,
        right: AppConstant.padding,
        bottom: AppConstant.padding - 8,
        top: 150,
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppConstant.padding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomItemButton(
                    onTap: () {
                      Get.to(() => const RealEstatePage());
                    },
                    title: 'property'.tr,
                    iconAsset: 'assets/icons/home168.png',
                  ),
                  CustomItemButton(
                    onTap: () {
                      Get.to(() => const ProblemPage());
                    },
                    title: 'problem'.tr,
                    iconAsset: 'assets/icons/chating.png',
                  ),
                  CustomItemButton(
                    onTap: () {
                      // Get.to(() => const ProblemPage());
                    },
                    title: 'history'.tr,
                    iconAsset: 'assets/icons/mybookmak.png',
                  ),
                  CustomItemButton(
                    onTap: () {
                      // Get.to(() => const ProblemPage());
                    },
                    title: 'favorite'.tr,
                    iconAsset: 'assets/icons/save.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ]));
  }
}

_onLogout(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      actionsPadding: const EdgeInsets.all(15),
      title: Text(
        'Logout',
        style: AppText.titleMedium,
      ),
      content: const Text(
        'Your account will logout unless you login again. Are you sure to logout?',
        textAlign: TextAlign.justify,
      ),
      actions: [
        const SizedBox(height: 10),
        SizedBox(
          height: 35,
          child: Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 70,
                child: CustomButton(
                  title: 'Cancel'.tr,
                  isOutline: true,
                  onPressed: () => Get.back(),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 80,
                child: CustomButton(
                  title: 'Ok'.tr,
                  onPressed: () async {
                    await LocalStorage.removeToken();
                    Get.back();
                    Get.offAllNamed(Routes.signin);
                  },
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

onShowChangeLanguage() {
  var langCode = Get.locale?.languageCode ?? 'km';

  showModalBottomSheet(
    context: ContextProvider.context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8),
      ),
    ),
    builder: (context) => Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      height: 180,
      child: Column(
        children: langList
            .asMap()
            .entries
            .map(
              (e) => Column(
                children: [
                  if (e.key == 1) const Divider(height: 0),
                  InkWell(
                    onTap: () async {
                      if (e.key == 0) {
                        await onUpdateLanguage(isKhmer: true);
                      } else {
                        await onUpdateLanguage(isKhmer: false);
                      }
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Row(
                        children: [
                          Text(
                            e.value['name'],
                            style: AppText.titleSmall,
                          ),
                          const Spacer(),
                          langCode != e.value['code']
                              ? const SizedBox()
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
  );
}

List<Map<String, dynamic>> langList = [
  {
    'name': 'ភាសាខ្មែរ',
    'code': 'km',
  },
  {
    'name': 'English',
    'code': 'en',
  },
];

Future<void> onUpdateLanguage({bool isKhmer = true}) async {
  if (isKhmer) {
    var locale = const Locale('km', 'KH');
    Get.updateLocale(locale);
    await LocalStorage.writeLocale('km');
    Get.back();
  } else {
    var locale = const Locale('en', 'US');
    Get.updateLocale(locale);
    await LocalStorage.writeLocale('en');

    Get.back();
  }
}

onShare(BuildContext context) async {
  final box = context.findRenderObject() as RenderBox?;
  await Share.share("This is contents",
      subject: "Share App",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
}
