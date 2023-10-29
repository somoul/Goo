// import 'package:flutter/material.dart';
// 
// import 'package:get/get.dart';
// import 'package:goo_rent/cores/constant/app_constant.dart';
// import 'package:goo_rent/cores/constant/app_text.dart';
// import 'package:goo_rent/cores/utils/custom_button.dart';
// import 'package:goo_rent/cores/utils/hide_keybaord.dart';
// import 'package:goo_rent/src/authentication/sign_up/controller/sign_up_controller.dart';

// class CreateNameScreen extends StatelessWidget {
//   CreateNameScreen({Key? key}) : super(key: key);
//   static const String routeName = '/create_name_screen';
//   final nameCon = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     var signupCon = Get.put(SignUpController());
//     return GestureDetector(
//       onTap: () => KeyboardHeper.hideKeyborad(),
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
//           child: StatefulBuilder(builder: (context, setState) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 120.h,
//                       ),
//                       const Text(
//                         "What is your name?",
//                         style: TextStyle(
//                             fontSize: 30, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 30),
//                       TextFormField(
//                         controller: signupCon.userNameController.value,
//                         cursorColor: AppConstant.kPrimaryColor,
//                         cursorRadius: const Radius.circular(10),
//                         cursorHeight: 20,
//                         cursorWidth: 2,
//                         keyboardType: TextInputType.name,
//                         style: AppText.bodyMedium,
//                         onChanged: (val) {
//                           setState(() {});
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 10),
//                           suffixIcon: Obx(
//                             () => IconButton(
//                                 icon: Icon(
//                                     signupCon.userNameController.value.text !=
//                                             ''
//                                         ? Icons.cancel
//                                         : null),
//                                 onPressed: () {
//                                   signupCon.userNameController.value.clear();
//                                   setState(() {});
//                                 }),
//                           ),
//                           hintStyle:
//                               AppText.bodyMedium!.copyWith(color: Colors.grey),
//                           hintText: "Please enter your name",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide: const BorderSide(
//                               color: AppConstant.kPrimaryColor,
//                               width: 1,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide: const BorderSide(
//                               color: Colors.grey,
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Obx(() => CustomButton(
//                     title: 'Confirm'.tr,
//                     onPressed: signupCon.userNameController.value.text == ''
//                         ? null
//                         : () => signupCon.onRegister()))
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
