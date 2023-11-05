import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/helper/dialog.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/helper/local_storage.dart';
import 'package:goo_rent/src/authentication/sign_in/presentation/screen/signin_screen.dart';
import 'package:goo_rent/src/favorite/pages/favorite_list_page.dart';
import 'package:goo_rent/src/profile/controller/profile_controller.dart';
import 'package:goo_rent/src/profile/presentation/screen/components/custom_item_button.dart';
import 'package:goo_rent/src/profile/presentation/screen/components/custom_listile.dart';
import 'package:goo_rent/src/profile/presentation/screen/edit_profile_page.dart';
import 'package:goo_rent/src/profile/presentation/screen/problem_page.dart';
import 'package:goo_rent/src/profile/presentation/screen/real_estate_page.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(
        children: [
          Obx(
            () => profileController.isLoadingProfile.value
                ? const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : Container(
                    height: 200,
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.5, color: Colors.white),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: profileController.userModel.value.avatar !=
                                      null
                                  ? CachedNetworkImageProvider(profileController
                                          .userModel.value.avatar ??
                                      '')
                                  : const AssetImage('assets/image/profile.png')
                                      as ImageProvider,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  '${profileController.userModel.value.firstName} ${profileController.userModel.value.lastName}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppText.bodyMedium!.copyWith(
                                      color: Colors.white, fontSize: 16)),
                              Text(
                                "${'ID'.tr}: ${profileController.userModel.value.id}",
                                style: AppText.bodySmall!.copyWith(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomListile(
                  title: 'Share'.tr,
                  leadingAsset: 'assets/icons/share.png',
                  onTap: () async {
                    await onShare(context);
                  },
                ),
                CustomListile(
                    title: 'About Us'.tr,
                    onTap: () {},
                    leadingAsset: 'assets/icons/About.png'),
                CustomListile(
                    title: 'Edit Account'.tr,
                    onTap: () => Get.to(
                          () => const EditProfilePage(),
                        ),
                    leadingAsset: 'assets/icons/Security.png'),
                CustomListile(
                  title: 'Change Language'.tr,
                  onTap: () {
                    onShowChangeLanguage(barrierDismissible: true);
                  },
                  leadingAsset: 'assets/icons/lange.png',
                  trailing:
                      langCode != 'en' ? Text('Khmer'.tr) : Text('English'.tr),
                ),
                CustomListile(
                  title: 'Logout'.tr,
                  leadingSize: 38,
                  onTap: () => _onLogout(context),
                  leadingAsset: 'assets/icons/logout.png',
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
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomItemButton(
                    onTap: () {
                      Get.to(() => const RealEstatePage());
                    },
                    title: 'Property'.tr,
                    iconAsset: 'assets/icons/home168.png',
                  ),
                  CustomItemButton(
                    onTap: () {
                      Get.to(() => const ProblemPage());
                    },
                    title: 'Problem'.tr,
                    iconAsset: 'assets/icons/chating.png',
                  ),
                  CustomItemButton(
                    onTap: () {
                      // Get.to(() => const ProblemPage());
                    },
                    title: 'History'.tr,
                    iconAsset: 'assets/icons/mybookmak.png',
                  ),
                  CustomItemButton(
                    onTap: () {
                      Get.to(() => const FavoriteListPage());
                    },
                    title: 'Favorite'.tr,
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

  _onLogout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        actionsPadding: const EdgeInsets.all(15),
        title: Text(
          'Logout'.tr,
          style: AppText.titleMedium,
        ),
        content: Text(
          'Your account will logout unless you login again. Are you sure to logout?'
              .tr,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          const SizedBox(height: 10),
          SizedBox(
            height: 35,
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: 75,
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
                      Get.back();
                      profileController.logout().then((value) async {
                        await LocalStorage.removeToken();
                        Get.offAll(const SignInScreen());
                      });
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
}
