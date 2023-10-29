import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/helper/dialog.dart';
import 'package:goo_rent/cores/utils/extension/num.dart';
import 'package:goo_rent/cores/utils/extension/widget.dart';
import 'package:goo_rent/cores/utils/image_builder.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';
import 'package:goo_rent/routes/route_name.dart';

// // import 'package:flutter/material.dart';

// // class SplashScreen extends StatelessWidget {
// //   const SplashScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       body: Center(
// //         child: CircularProgressIndicator(),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:goo_rent/cores/utils/local_storage.dart';
// import 'package:goo_rent/routes/route_name.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//   static const String routeName = '/';

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// enum BestTutorSite { khmer, english, china, korea }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   // late AnimationController controller;
//   void onCheckUser() async {
//     // Get.offAllNamed(Routes.home);
//     var tokenKey = await LocalStorage.readToken();
//     print('Token -> $tokenKey');
//     if (tokenKey != '' && tokenKey != null) {
//       Get.offAllNamed(Routes.home);
//     } else {
//       Get.offAllNamed(Routes.signin);
//     }
//   }

//   @override
//   void initState() {
//     Timer(const Duration(seconds: 2), () {
//       // onCheckUser();
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     // controller.dispose();
//     super.dispose();
//   }

//   int currentLanguage = 1;
//   bool test = false;

//   @override
//   void didChangeDependencies() {
//     // Timer(const Duration(seconds: 2), () async {
//     // Get.to(() => const MainPage());
//     // Navigator.pushNamedAndRemoveUntil(
//     //     context,
//     //     EnvProvider.config.name != EnvProvider.flavor.name
//     //         ? WrongConfigPage.routName
//     //         : '/',
//     //         (route) => false);
//     // test = await showBottomEditProfilePhotoSplash(
//     //     context: context,
//     //     widget: WillPopScope(
//     //       onWillPop: () async {
//     //         return false;
//     //       },
//     //       child: SizedBox(
//     //         height: MediaQuery.of(context).size.height,
//     //         child: Column(
//     //           children: [
//     //             const SizedBox(
//     //               height: 40,
//     //             ),
//     //             Container(
//     //               height: 180,
//     //               alignment: Alignment.center,
//     //               color: const Color(0xff21A6F8),
//     //               child: SvgPicture.asset("assets/image2/Logo.svg"),
//     //             ),
//     //             Expanded(
//     //               child: Container(
//     //                 decoration: const BoxDecoration(
//     //                     color: Colors.white,
//     //                     borderRadius: BorderRadius.only(
//     //                         topLeft: Radius.circular(20),
//     //                         topRight: Radius.circular(20))),
//     //                 child: Stack(
//     //                   children: [
//     //                     Positioned(
//     //                         bottom: 0,
//     //                         child: Image.asset(
//     //                           "assets/image2/logo3.png",
//     //                           fit: BoxFit.cover,
//     //                         )),
//     //                     StatefulBuilder(builder: (context, setStateLanguage) {
//     //                       return Column(
//     //                         crossAxisAlignment: CrossAxisAlignment.start,
//     //                         children: [
//     //                           const Padding(
//     //                             padding: EdgeInsets.all(8.0 * 2),
//     //                             child: Text("ជ្រើសរើសភាសា"),
//     //                           ),
//     //                           ListTile(
//     //                             onTap: () {
//     //                               setStateLanguage(() {
//     //                                 _site = BestTutorSite.khmer;
//     //                               });
//     //                               Navigator.pop(context, true);
//     //                             },
//     //                             leading: Image.asset(
//     //                               "assets/icons/kh.png",
//     //                               width: 50,
//     //                             ),
//     //                             title: const Text(
//     //                               "Khmer",
//     //                             ),
//     //                             trailing: Radio(
//     //                               value: BestTutorSite.khmer,
//     //                               groupValue: _site,
//     //                               onChanged: (BestTutorSite? value) {},
//     //                               // onChanged: (BestTutorSite? value) {
//     //                               //
//     //                               //
//     //                               // },
//     //                             ),
//     //                           ),
//     //                           const Divider(),
//     //                           ListTile(
//     //                             onTap: () {
//     //                               setStateLanguage(() {
//     //                                 _site = BestTutorSite.english;
//     //                               });
//     //                               Navigator.pop(context, true);
//     //                             },
//     //                             leading: Image.asset(
//     //                               "assets/icons/english.png",
//     //                               width: 50,
//     //                             ),
//     //                             title: const Text("English"),
//     //                             trailing: Radio(
//     //                               value: BestTutorSite.english,
//     //                               groupValue: _site,
//     //                               onChanged: (BestTutorSite? value) {
//     //                                 // setStateLanguage(() {
//     //                                 //   _site = value!;
//     //                                 // });
//     //                                 // Navigator.pop(context);
//     //                               },
//     //                             ),
//     //                           ),
//     //                           const Divider(),
//     //                           ListTile(
//     //                             onTap: () {
//     //                               setStateLanguage(() {
//     //                                 _site = BestTutorSite.china;
//     //                               });
//     //                               Navigator.pop(context, true);
//     //                             },
//     //                             leading: Image.asset(
//     //                               "assets/icons/china.png",
//     //                               width: 50,
//     //                             ),
//     //                             title: const Text("China"),
//     //                             trailing: Radio(
//     //                               value: BestTutorSite.china,
//     //                               groupValue: _site,
//     //                               onChanged: (BestTutorSite? value) {
//     //                                 setStateLanguage(() {
//     //                                   _site = value!;
//     //                                 });
//     //                                 Navigator.pop(context, true);
//     //                               },
//     //                             ),
//     //                           ),
//     //                           const Divider(),
//     //                           ListTile(
//     //                             onTap: () {
//     //                               setStateLanguage(() {
//     //                                 _site = BestTutorSite.korea;
//     //                               });
//     //                               Navigator.pop(context, true);
//     //                             },
//     //                             leading: Image.asset(
//     //                               "assets/icons/korea.png",
//     //                               width: 50,
//     //                             ),
//     //                             title: const Text("Korea"),
//     //                             trailing: Radio(
//     //                               value: BestTutorSite.korea,
//     //                               groupValue: _site,
//     //                               onChanged: (BestTutorSite? value) {},
//     //                             ),
//     //                           ),
//     //                           const Divider(),
//     //                         ],
//     //                       );
//     //                     }),
//     //                   ],
//     //                 ),
//     //               ),
//     //             ),
//     //           ],
//     //         ),
//     //       ),
//     //     ));
//     // if (test) {
//     //   controller.forward();
//     //   setState(() {});
//     //   //showAlertDialog(context: context);
//     // }
//     // });
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff21A6F8),
//       // body: Center(
//       //   child: Text('Loading...'),
//       // )
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child:
//                 //  test
//                 //     ? Column(
//                 //         mainAxisAlignment: MainAxisAlignment.center,
//                 //         children: [
//                 //           SvgPicture.asset("assets/image2/logoG.svg"),
//                 //           const SizedBox(
//                 //             height: 15,
//                 //           ),
//                 //           SizedBox(
//                 //             width: MediaQuery.of(context).size.width / 2.2,
//                 //             child: LinearProgressIndicator(
//                 //               value: controller.value,
//                 //               color: Colors.white,
//                 //               backgroundColor: Colors.white.withOpacity(0.5),
//                 //               semanticsLabel: 'Linear progress indicator',
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       )
//                 //     :
//                 SvgPicture.asset("assets/image2/Logo.svg"),
//           ),
//           Positioned(
//             bottom: 0,
//             child: Image.asset(
//               "assets/image2/logo1.png",
//               fit: BoxFit.cover,
//               width: MediaQuery.of(context).size.width,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   showBottomEditProfilePhotoSplash(
//       {required BuildContext context, required Widget widget}) async {
//     final test = await showModalBottomSheet<bool>(
//         barrierColor: Colors.transparent,
//         backgroundColor: Colors.transparent,
//         isDismissible: false,
//         enableDrag: false,
//         isScrollControlled: true,
//         context: context,
//         builder: (context) {
//           return widget;
//         });
//     return test;
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? tokenKey;
  String langCode = '';
  bool loading = true;
  void onCheckUser() async {
    tokenKey = await LocalStorage.readToken();
    langCode = await LocalStorage.readLocale();
    // ignore: avoid_print
    print('Token >  $tokenKey');
    if (tokenKey != '' && tokenKey != null) {
      Get.offAllNamed(Routes.home);
    } else if (langCode == '') {
      setState(() {
        loading = false;
      });
      onShowChangeLanguage(onSelected: () {
        Get.offAllNamed(Routes.signin);
      });
    } else {
      Get.offAllNamed(Routes.signin);
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      onCheckUser();
    });
    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  int currentLanguage = 1;
  bool test = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21A6F8),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ImageBuilder(width: 100, height: 100)
                  .asset('assets/image/app_logo.png')
                  .pt(25),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Center(
                  child: const Text(
                    'Power by Goo Cambodia',
                    style: TextStyle(color: Colors.white),
                  ).px(20),
                ),
                15.gap,
                if (loading)
                  const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white60,
                      strokeWidth: 2,
                      backgroundColor: AppConstant.kPrimaryColor,
                    ),
                  ).pb(20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
