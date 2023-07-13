import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:goo_rent/cores/utils/local_storage.dart';
// import 'package:goo_rent/routes/route_name.dart';
// import 'package:goo_rent/src/splash/presentation/widgets/show_dialog_ocation.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//   static const String routeName = '/';

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// enum BestTutorSite { khmer, english, china, korea }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController controller;
//   void onCheckUser() async {
//     var tokenKey = await LocalStorage.readToken();
//     if (tokenKey != '') {
//       Get.offAllNamed(Routes.home);
//     } else {
//       Get.offAllNamed(Routes.signin);
//     }
//   }

//   @override
//   void initState() {
//     controller = AnimationController(
//       /// [AnimationController]s can be created with `vsync: this` because of
//       /// [TickerProviderStateMixin].
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     )..addListener(() {
//         setState(() {});
//       });
//     controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         showAlertDialog(context: context);
//       }
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   BestTutorSite _site = BestTutorSite.khmer;
//   int currentLanguage = 1;
//   bool test = false;

//   @override
//   void didChangeDependencies() {
//     Timer(const Duration(seconds: 2), () async {
//       onCheckUser();
//       // Get.to(() => const MainPage());
//       // Navigator.pushNamedAndRemoveUntil(
//       //     context,
//       //     EnvProvider.config.name != EnvProvider.flavor.name
//       //         ? WrongConfigPage.routName
//       //         : '/',
//       //         (route) => false);
//       test = await showBottomEditProfilePhotoSplash(
//           context: context,
//           widget: WillPopScope(
//             onWillPop: () async {
//               return false;
//             },
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Container(
//                     height: 180,
//                     alignment: Alignment.center,
//                     color: const Color(0xff21A6F8),
//                     child: SvgPicture.asset("assets/image2/Logo.svg"),
//                   ),
//                   Expanded(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(20),
//                               topRight: Radius.circular(20))),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                               bottom: 0,
//                               child: Image.asset(
//                                 "assets/image2/logo3.png",
//                                 fit: BoxFit.cover,
//                               )),
//                           StatefulBuilder(builder: (context, setStateLanguage) {
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Padding(
//                                   padding: EdgeInsets.all(8.0 * 2),
//                                   child: Text("ជ្រើសរើសភាសា"),
//                                 ),
//                                 ListTile(
//                                   onTap: () {
//                                     setStateLanguage(() {
//                                       _site = BestTutorSite.khmer;
//                                     });
//                                     Navigator.pop(context, true);
//                                   },
//                                   leading: Image.asset(
//                                     "assets/icons/kh.png",
//                                     width: 50,
//                                   ),
//                                   title: const Text(
//                                     "Khmer",
//                                   ),
//                                   trailing: Radio(
//                                     value: BestTutorSite.khmer,
//                                     groupValue: _site,
//                                     onChanged: (BestTutorSite? value) {},
//                                     // onChanged: (BestTutorSite? value) {
//                                     //
//                                     //
//                                     // },
//                                   ),
//                                 ),
//                                 const Divider(),
//                                 ListTile(
//                                   onTap: () {
//                                     setStateLanguage(() {
//                                       _site = BestTutorSite.english;
//                                     });
//                                     Navigator.pop(context, true);
//                                   },
//                                   leading: Image.asset(
//                                     "assets/icons/english.png",
//                                     width: 50,
//                                   ),
//                                   title: const Text("English"),
//                                   trailing: Radio(
//                                     value: BestTutorSite.english,
//                                     groupValue: _site,
//                                     onChanged: (BestTutorSite? value) {
//                                       // setStateLanguage(() {
//                                       //   _site = value!;
//                                       // });
//                                       // Navigator.pop(context);
//                                     },
//                                   ),
//                                 ),
//                                 const Divider(),
//                                 ListTile(
//                                   onTap: () {
//                                     setStateLanguage(() {
//                                       _site = BestTutorSite.china;
//                                     });
//                                     Navigator.pop(context, true);
//                                   },
//                                   leading: Image.asset(
//                                     "assets/icons/china.png",
//                                     width: 50,
//                                   ),
//                                   title: const Text("China"),
//                                   trailing: Radio(
//                                     value: BestTutorSite.china,
//                                     groupValue: _site,
//                                     onChanged: (BestTutorSite? value) {
//                                       setStateLanguage(() {
//                                         _site = value!;
//                                       });
//                                       Navigator.pop(context, true);
//                                     },
//                                   ),
//                                 ),
//                                 const Divider(),
//                                 ListTile(
//                                   onTap: () {
//                                     setStateLanguage(() {
//                                       _site = BestTutorSite.korea;
//                                     });
//                                     Navigator.pop(context, true);
//                                   },
//                                   leading: Image.asset(
//                                     "assets/icons/korea.png",
//                                     width: 50,
//                                   ),
//                                   title: const Text("Korea"),
//                                   trailing: Radio(
//                                     value: BestTutorSite.korea,
//                                     groupValue: _site,
//                                     onChanged: (BestTutorSite? value) {},
//                                   ),
//                                 ),
//                                 const Divider(),
//                               ],
//                             );
//                           }),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ));
//       if (test) {
//         controller.forward();
//         setState(() {});
//         //showAlertDialog(context: context);
//       }
//     });
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff21A6F8),
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: test
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset("assets/image2/logoG.svg"),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width / 2.2,
//                         child: LinearProgressIndicator(
//                           value: controller.value,
//                           color: Colors.white,
//                           backgroundColor: Colors.white.withOpacity(0.5),
//                           semanticsLabel: 'Linear progress indicator',
//                         ),
//                       ),
//                     ],
//                   )
//                 : SvgPicture.asset("assets/image2/Logo.svg"),
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
