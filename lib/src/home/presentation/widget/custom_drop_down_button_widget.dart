import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDownButtonWidget extends StatelessWidget {
  const CustomDropDownButtonWidget({
    Key? key,
    this.hintText = "",
    this.svgSrc = 'assets/icons/location.svg',
    required this.itemList,
    this.iconOnClick = 'assets/icons/arrow-up-337-svgrepo-com.svg',
    this.icon = "assets/icons/arrow-down-338-svgrepo-com.svg",
    this.iconWidget,
  }) : super(key: key);
  final String hintText;
  final String svgSrc;
  final String iconOnClick;
  final String icon;
  final List<String> itemList;
  final Icon? iconWidget;

  @override
  Widget build(BuildContext context) {
    String? selectedValue;

    return StatefulBuilder(builder: (context, setStateArea) {
      return DropdownButtonHideUnderline(
          child: DropdownButton2(
        // icon: SvgPicture.asset(icon,width: 15,height: 15,),
        icon: iconWidget ??
            SvgPicture.asset(
              icon,
              width: 15,
              height: 15,
            ),
        iconOnClick: SvgPicture.asset(
          iconOnClick,
          width: 15,
          height: 15,
        ),
        isExpanded: true,
        hint: Row(
          children: [
            svgSrc.isNotEmpty
                ? SvgPicture.asset(
                    svgSrc,
                    width: 25,
                    height: 25,
                  )
                : const SizedBox(),
            // SizedBox(
            //   width: 5.r,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                hintText,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.kantumruy(
                    fontSize: 14, color: Colors.grey.shade300),
              ),
            ),
          ],
        ),
        items: itemList
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item,
                        style: GoogleFonts.kantumruy(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Divider(
                        height: 1,
                      )
                    ],
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setStateArea(() {
            selectedValue = value as String;
          });
        },
        buttonHeight: 50,
        buttonPadding: const EdgeInsets.only(right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
          ),
          color: Colors.white,
        ),
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownScrollPadding: const EdgeInsets.only(
          right: 10,
        ),
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 4,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ));
    });
  }
}

// import 'package:flutter/material.dart';
// import 'package:goo_rent_mobile/cores/constant/appconstant.dart';
//
// class CustomDropDownButtonWidget extends StatelessWidget {
//   const CustomDropDownButtonWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     String chosenValue = "Android";
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(10)),
//       child: DropdownButtonFormField<String>(
//         decoration: const InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: AppConstant.padding),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10),
//             ),
//           ),
//         ),
//         value: chosenValue,
//         isExpanded: true,
//         iconEnabledColor: Colors.black,
//         items: <String>[
//           'Android',
//           'IOS',
//           'Flutter',
//           'Node',
//           'Java',
//           'Python',
//           'PHP',
//         ].map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(
//               value,
//               style: const TextStyle(color: Colors.black),
//             ),
//           );
//         }).toList(),
//         hint: const Text(
//           "Please choose a langauage",
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//         ),
//         onChanged: (String? value) {
//           chosenValue = value!;
//         },
//       ),
//     );
//   }
// }
