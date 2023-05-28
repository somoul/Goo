import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_rent/cores/constant/appconstant.dart';
import 'package:goo_rent/src/profile/presentation/widget/custom_toggle_button.dart';
import 'package:goo_rent/src/profile/presentation/widget/show_buttom_sheet_share.dart';
import 'package:google_fonts/google_fonts.dart';

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
              InkWell(
                onTap: () {
                  // GoRouter.of(context).push('/edit_profile_page');
                },
                child: Container(
                  width: 80,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.lightBlueAccent.withOpacity(0.8)),
                  child: Text(
                    "កែប្រែ",
                    style: GoogleFonts.kantumruy(
                        fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
              children: [
                SizedBox(
                  height: 65,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/Darks.png',
                        height: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "មុខងារ Dark",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      const Spacer(),
                      StyledSwitch(
                        onToggled: (bool isToggled) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 65,
                  child: InkWell(
                    onTap: () {
                      // GoRouter.of(context).push(NotificationScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/notifications.png',
                          height: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "ការជូនដំណឹង",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 65,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/About.png',
                        height: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "អំពីយើង",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showBottomSheetShare(
                        context: context,
                        widget: SizedBox(
                            height: 300,
                            child: Column(
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0 * 2),
                                  child: Text(
                                    "Share",
                                    style: GoogleFonts.kantumruy(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0 * 3),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Wrap(
                                  children: socialMedialList
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0 * 2,
                                                vertical: 10),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  e.imgSrc,
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  e.nameApp,
                                                  style:
                                                      GoogleFonts.kantumruy(),
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                )
                              ],
                            )));
                  },
                  child: SizedBox(
                    height: 65,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/share.png',
                          height: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "ការចែករំលែក",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 65,
                  child: InkWell(
                    onTap: () {
                      // GoRouter.of(context).push(EditProfilePage.routeName);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/Security.png',
                          height: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "សុវត្ថិភាព",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // GoRouter.of(context).push(MultipleLanguageScreen.routeName);
                  },
                  child: SizedBox(
                    height: 65,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/lange.png',
                          height: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "ប្តូភាសា",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        const Spacer(),
                        Text(
                          "ខ្មែរ",
                          style: GoogleFonts.kantumruy(fontSize: 14.sp),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      // GoRouter.of(context).push('/real_estate_page');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/home168.png',
                          height: 50,
                        ),
                        const Text("អចលនទ្រព្យខ្ញុំ")
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // GoRouter.of(context).push('/problem_pages');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/chating.png',
                          height: 50,
                        ),
                        const Text("បញ្ហា")
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/mybookmak.png',
                        height: 50,
                      ),
                      const Text("កំណត់ត្រា")
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/save.png',
                          height: 50,
                        ),
                        const Text("រក្សាទុក")
                      ],
                    ),
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

List<SocialMedia> socialMedialList = [
  const SocialMedia(
      imgSrc: "assets/image2/square_facebook.png", nameApp: "FaceBook"),
  const SocialMedia(
      imgSrc: "assets/icons/instagrames.png", nameApp: "Instagram"),
  const SocialMedia(imgSrc: "assets/icons/tiktok.png", nameApp: "TikTok"),
  const SocialMedia(imgSrc: "assets/icons/yahoo.png", nameApp: "Telegram"),
  const SocialMedia(imgSrc: "assets/icons/whatapps.png", nameApp: "WhatsApp"),
  const SocialMedia(imgSrc: "assets/icons/likes.png", nameApp: "Messager"),
  const SocialMedia(imgSrc: "assets/icons/twitters.png", nameApp: "Twintter"),
  const SocialMedia(imgSrc: "assets/icons/chatss.png", nameApp: "WeChat"),
];

class SocialMedia {
  final String imgSrc;
  final String nameApp;

  const SocialMedia({required this.imgSrc, required this.nameApp});
}
// List<SettingUser> _settingUserList = [
//   const SettingUser(
//       iconSrc: 'assets/icons/Group34692.svg',
//       settingName: 'ការផ្លាស់ប្តូរគណនី'),
//   const SettingUser(
//       iconSrc: 'assets/icons/Loccation.svg', settingName: 'អាស្រ័យដ្ធាន'),
//   const SettingUser(
//       iconSrc: 'assets/icons/comment.svg',
//       settingName: 'ដោះស្រាយបញ្ហារបស់លោកអ្នក'),
//   const SettingUser(
//       iconSrc: 'assets/icons/checktrue.svg',
//       settingName: 'គោលការណ៏ នឹង អំពីយើង'),
// ];

class SettingUser {
  final String iconSrc;
  final String settingName;

  const SettingUser({required this.iconSrc, required this.settingName});
}
