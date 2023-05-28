// import 'package:flutter/material.dart';
//
// void showBottomSheetDefault(
//     {required BuildContext context}) {
//   int _currentGender = 1;
//   showModalBottomSheet(
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         // <-- SEE HERE
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(25.0),
//         ),
//       ),
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0*2),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("ភេទ"),
//               Divider(),
//               InkWell(
//                 onTap: (){
//
//                     _currentGender = 1;
//                 },
//                 child: SizedBox(
//                   height: 80,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("ប្រុស"),
//                       _currentGender == 1 ? Icon(CupertinoIcons.airplane) : SizedBox()
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(),
//               InkWell(
//                 onTap: (){
//                     _currentGender = 2;
//                 },
//                 child: SizedBox(height: 80,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("ស្រី"),
//                       _currentGender == 2 ? Icon(CupertinoIcons.airplane) : SizedBox()
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(),
//               SizedBox(height: 40,)
//             ],
//           ),
//         );
//       });
// }
