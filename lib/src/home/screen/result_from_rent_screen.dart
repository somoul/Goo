// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:goo_rent/src/home/screen/home_screen.dart';
// import 'package:goo_rent/src/home/widget/buttom_sheet_menu_result_from_rent.dart';
// import 'package:goo_rent/src/home/widget/custom_card_rent_widget.dart';

// class ResultFromRentScreen extends StatefulWidget {
//   const ResultFromRentScreen({Key? key}) : super(key: key);
//   static const String routeName = '/result_from_rent_screen';

//   @override
//   State<ResultFromRentScreen> createState() => _ResultFromRentScreenState();
// }

// class _ResultFromRentScreenState extends State<ResultFromRentScreen> {
//   bool isCheckAction = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 30,
//         backgroundColor: Colors.white,
//         title: const Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               'លទ្ធផល',
//               // style:
//               //     GoogleFonts.kantumruy(color: Colors.black, fontSize: 18),
//             ),
//             Text(
//               'បន្ទប់ជួល',
//               // style: GoogleFonts.kantumruy(
//               //     color: Colors.black,
//               //     fontSize: 22,
//               //     fontWeight: FontWeight.bold)
//             ),
//           ],
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10),
//             decoration: BoxDecoration(
//                 color: Colors.grey.shade50,
//                 borderRadius: BorderRadius.circular(20)),
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isCheckAction = true;
//                     });
//                   },
//                   icon: SvgPicture.asset(
//                     "assets/icons/category.svg",
//                     color: isCheckAction == true ? Colors.blue : Colors.black,
//                   ),
//                   // icon: Icon(
//                   //   Icons.add,
//                   //   color:
//                   //       isCheckAction == true ? Colors.blue : Colors.black,
//                   // )
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isCheckAction = false;
//                     });
//                   },
//                   icon: SvgPicture.asset(
//                     "assets/icons/pause.svg",
//                     color: isCheckAction == false ? Colors.blue : Colors.black,
//                   ),
//                   // icon: Icon(
//                   //   Icons.local_activity,
//                   //   color:
//                   //       isCheckAction == false ? Colors.blue : Colors.black,
//                   // )
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               showBottomSheetResultFromRent(context: context);
//             },
//             icon: Image.asset(
//               "assets/icons/image_45.png",
//               width: 30,
//               height: 30,
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         color: Colors.grey.shade200,
//         child: isCheckAction
//             ? _customCategoriesLayout()
//             : _customCategoriesListLayout(),
//       ),
//     );
//   }
// }

// _customCategoriesLayout() => ListView(
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.white),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Image.asset(
//                     "assets/icons/room99.png",
//                   ),
//                   Positioned(
//                       left: 15,
//                       top: 15,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         height: 30,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.white,
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 10,
//                               height: 10,
//                               decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0XFFFF808C)),
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               'NEW LISTING',
//                               // style: GoogleFonts.kantumruy(
//                               //   color: Colors.black,
//                               // ),
//                             )
//                           ],
//                         ),
//                       )),
//                   Positioned(
//                       right: 15,
//                       bottom: 15,
//                       child: FloatingActionButton.small(
//                         //<-- SEE HERE
//                         backgroundColor: Colors.white,
//                         onPressed: () {},
//                         child: Image.asset(
//                           "assets/icons/love.png",
//                           height: 20,
//                         ),
//                       )),
//                 ],
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   textBaseline: TextBaseline.ideographic,
//                   children: [
//                     const Text(
//                       "\$900 / ខែ",
//                       // style: GoogleFonts.kantumruy(
//                       //     color: const Color(0xFF21A6F8), fontSize: 20),
//                     ),
//                     const Text(
//                       "ផ្ទះសម្រាប់ជួលនៅអូឡាំពិជ",
//                       // style: GoogleFonts.kantumruy(fontSize: 18),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                                 "assets/icons/circle-five-line.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "1342m",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/icons/single-bed.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "5",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/icons/shower-head.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "4",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/icons/car1.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "4",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.white),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Image.asset(
//                     "assets/icons/room99.png",
//                   ),
//                   Positioned(
//                       left: 15,
//                       top: 15,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         height: 30,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.white,
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 10,
//                               height: 10,
//                               decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0XFFFF808C)),
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               'NEW LISTING',
//                               // style: GoogleFonts.kantumruy(
//                               //   color: Colors.black,
//                               // ),
//                             )
//                           ],
//                         ),
//                       )),
//                   Positioned(
//                       right: 15,
//                       bottom: 15,
//                       child: FloatingActionButton.small(
//                         //<-- SEE HERE
//                         backgroundColor: Colors.white,
//                         onPressed: () {},
//                         child: Image.asset(
//                           "assets/icons/love.png",
//                           height: 20,
//                         ),
//                       )),
//                 ],
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   textBaseline: TextBaseline.ideographic,
//                   children: [
//                     const Text(
//                       "\$900 / ខែ",
//                       // style: GoogleFonts.kantumruy(
//                       //     color: const Color(0xFF21A6F8), fontSize: 20),
//                     ),
//                     const Text(
//                       "ផ្ទះសម្រាប់ជួលនៅអូឡាំពិជ",
//                       // style: GoogleFonts.kantumruy(fontSize: 18),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                                 "assets/icons/circle-five-line.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "1342m",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/icons/single-bed.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "5",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/icons/shower-head.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "4",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/icons/car1.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "4",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.white),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Image.asset(
//                     "assets/icons/room99.png",
//                   ),
//                   Positioned(
//                       left: 15,
//                       top: 15,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         height: 30,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.white,
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 10,
//                               height: 10,
//                               decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0XFFFF808C)),
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               'NEW LISTING',
//                               // style: GoogleFonts.kantumruy(
//                               //   color: Colors.black,
//                               // ),
//                             )
//                           ],
//                         ),
//                       )),
//                   Positioned(
//                       right: 15,
//                       bottom: 15,
//                       child: FloatingActionButton.small(
//                         //<-- SEE HERE
//                         backgroundColor: Colors.white,
//                         onPressed: () {},
//                         child: Image.asset(
//                           "assets/icons/love.png",
//                           height: 20,
//                         ),
//                       )),
//                 ],
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   textBaseline: TextBaseline.ideographic,
//                   children: [
//                     const Text(
//                       "\$900 / ខែ",
//                       // style: GoogleFonts.kantumruy(
//                       //     color: const Color(0xFF21A6F8), fontSize: 20),
//                     ),
//                     const Text(
//                       "ផ្ទះសម្រាប់ជួលនៅអូឡាំពិជ",
//                       // style: GoogleFonts.kantumruy(fontSize: 18),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                                 "assets/icons/circle-five-line.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "1342m",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/icons/single-bed.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "5",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/icons/shower-head.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "4",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset("assets/icons/car1.svg"),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "4",
//                               // style: GoogleFonts.kantumruy(fontSize: 12),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         )
//       ],
//     );

// _customCategoriesListLayout() => Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0 * 2),
//       child: ListView(
//         physics: const BouncingScrollPhysics(),
//         children: [
//           ...listTypeOfRent.map((e) => CustomCardRentWidget(
//                 imageSrc: e.imageSrc,
//                 typeName: e.typeName,
//                 location: e.location,
//                 sizeRent: e.sizeRent,
//                 horizontal: 0,
//                 code: e.code,
//                 priceOfRent: e.priceOfRent,
//                 iconOfCard: e.iconCard,
//               )),
//           ...listTypeOfRent.map((e) => CustomCardRentWidget(
//                 imageSrc: e.imageSrc,
//                 typeName: e.typeName,
//                 location: e.location,
//                 sizeRent: e.sizeRent,
//                 horizontal: 0,
//                 code: e.code,
//                 priceOfRent: e.priceOfRent,
//                 iconOfCard: e.iconCard,
//               )),
//         ],
//       ),
//     );
