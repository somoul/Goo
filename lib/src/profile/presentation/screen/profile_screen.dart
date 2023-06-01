import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/src/profile/presentation/screen/components/custom_item_button.dart';
import 'package:goo_rent/src/profile/presentation/screen/components/custom_listile.dart';
import 'package:goo_rent/src/profile/presentation/screen/edit_profile_page.dart';
import 'package:goo_rent/src/profile/presentation/screen/problem_page.dart';
import 'package:goo_rent/src/profile/presentation/screen/real_estate_page.dart';
import 'package:goo_rent/src/profile/presentation/widget/custom_toggle_button.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  Text(
                    "SOTH MENGHOUR",
                    style: GoogleFonts.kantumruy(
                        color: Colors.white, fontSize: 16),
                    //style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "ID:09999",
                    style: GoogleFonts.kantumruy(
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
                  'កែប្រែ',
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
                CustomListile(
                  title: 'មុខងារងងិត',
                  onTap: () {},
                  leadingAsset: 'assets/icons/Darks.png',
                  trailing: StyledSwitch(
                    onToggled: (bool isToggled) {},
                  ),
                ),
                CustomListile(
                    title: 'ការជូនដំណឹង',
                    onTap: () {},
                    leadingAsset: 'assets/icons/notifications.png'),
                CustomListile(
                    title: 'ការជូនដំណឹង',
                    onTap: () {},
                    leadingAsset: 'assets/icons/About.png'),
                CustomListile(
                  title: 'ការចែករំលែក',
                  leadingAsset: 'assets/icons/share.png',
                  onTap: () async {
                    await onShare(context);
                  },
                ),
                CustomListile(
                    title: 'សុវត្ថិភាព',
                    onTap: () {},
                    leadingAsset: 'assets/icons/Security.png'),
                CustomListile(
                    title: 'ប្តូភាសា',
                    onTap: () {},
                    leadingAsset: 'assets/icons/lange.png'),
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
                    title: 'អចលនទ្រព្យ',
                    iconAsset: 'assets/icons/home168.png',
                  ),
                  CustomItemButton(
                    onTap: () {
                      Get.to(() => const ProblemPage());
                    },
                    title: 'បញ្ហា',
                    iconAsset: 'assets/icons/chating.png',
                  ),
                  CustomItemButton(
                    onTap: () {
                      // Get.to(() => const ProblemPage());
                    },
                    title: 'កំណត់ត្រា',
                    iconAsset: 'assets/icons/mybookmak.png',
                  ),
                  CustomItemButton(
                    onTap: () {
                      // Get.to(() => const ProblemPage());
                    },
                    title: 'រក្សាទុក',
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

onShare(BuildContext context) async {
  final box = context.findRenderObject() as RenderBox?;
  await Share.share("text",
      subject: "subject",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
}
