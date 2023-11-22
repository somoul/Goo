// import 'package:flutter/material.dart';
// import 'package:goo_rent/constant/app_constant.dart';
// import 'package:goo_rent/src/home/screen/home_screen.dart';
// import 'package:goo_rent/src/home/widget/custom_card_rent_widget.dart';

// class FreeRoomsPage extends StatelessWidget {
//   const FreeRoomsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<TypeOfRent> listTypeOfRent = [
//       const TypeOfRent(
//           imageSrc: 'assets/images/avengers.jpeg',
//           typeName: "បន្ទប់គ្រែពីរ",
//           location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
//           priceOfRent: "១២០ ដុល្លា/១ខែ",
//           sizeRent: 'នៅបាន៤អ្នក',
//           iconCard:
//               IconOfCard(size: '3x5m', stair: '5', status: 'Free', park: '1'),
//           code: 983883),
//       const TypeOfRent(
//           imageSrc: 'assets/images/avengers.jpeg',
//           typeName: "បន្ទប់គ្រែពីរ",
//           location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
//           priceOfRent: "១២០ ដុល្លា/១ខែ",
//           sizeRent: 'នៅបាន៤អ្នក',
//           iconCard:
//               IconOfCard(size: '3x5m', stair: '5', status: 'Free', park: '1'),
//           code: 983883),
//       const TypeOfRent(
//           imageSrc: 'assets/images/avengers.jpeg',
//           typeName: "បន្ទប់គ្រែពីរ",
//           location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
//           priceOfRent: "១២០ ដុល្លា/១ខែ",
//           sizeRent: 'នៅបាន៤អ្នក',
//           iconCard:
//               IconOfCard(size: '3x5m', stair: '5', status: 'Free', park: '1'),
//           code: 983883),
//       const TypeOfRent(
//           imageSrc: 'assets/images/avengers.jpeg',
//           typeName: "បន្ទប់គ្រែពីរ",
//           location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
//           priceOfRent: "១២០ ដុល្លា/១ខែ",
//           sizeRent: 'នៅបាន៤អ្នក',
//           iconCard:
//               IconOfCard(size: '3x5m', stair: '5', status: 'Free', park: '1'),
//           code: 983883),
//       const TypeOfRent(
//           imageSrc: 'assets/images/avengers.jpeg',
//           typeName: "បន្ទប់គ្រែពីរ",
//           location: "ទំហំ ៖ ៤ គុណ ៨ ម៉ែត្រការេ",
//           priceOfRent: "១២០ ដុល្លា/១ខែ",
//           sizeRent: 'នៅបាន៤អ្នក',
//           iconCard:
//               IconOfCard(size: '3x5m', stair: '5', status: 'Free', park: '1'),
//           code: 983883),
//     ];
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: AppConstant.padding),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "បន្ទប់នៅទំនេរ",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             ...listTypeOfRent.map((e) => CustomCardRentWidget(
//                   code: e.code,
//                   iconOfCard: e.iconCard,
//                   imageSrc: e.imageSrc,
//                   typeName: e.typeName,
//                   location: e.location,
//                   sizeRent: e.sizeRent,
//                   priceOfRent: e.priceOfRent,
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
