import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goo_rent/cores/constant/app_text.dart';

class CustomDropDownButtonWidget extends StatelessWidget {
  const CustomDropDownButtonWidget(
      {Key? key,
      this.hintText = "",
      this.svgSrc = 'assets/icons/location.svg',
      required this.itemList,
      this.iconOnClick = 'assets/icons/arrow-up-337-svgrepo-com.svg',
      this.icon = "assets/icons/arrow-down-338-svgrepo-com.svg",
      this.iconWidget,
      this.onChangedServices})
      : super(key: key);
  final String hintText;
  final String svgSrc;
  final String iconOnClick;
  final String icon;
  final List<String> itemList;
  final Icon? iconWidget;
  final Function(String?)? onChangedServices;

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    return StatefulBuilder(builder: (context, setStateArea) {
      return Container(
        decoration: const BoxDecoration(),
        child: DropdownButtonHideUnderline(
          child: Row(
            children: [
              //  AssetImage("")
              Expanded(
                child: DropdownButton2(
                  disabledHint: Row(
                    children: [
                      SvgPicture.asset(
                        svgSrc,
                        width: 25,
                        height: 25,
                        color: Colors.red,
                      ),
                    ],
                  ),

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

                  ///
                  hint: Row(
                    children: [
                      SvgPicture.asset(
                        svgSrc,
                        width: 25,
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(hintText,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppText.bodySmall),
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
                                  style: AppText.bodySmall,
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
                      onChangedServices!(value);
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
                    // color: Colors.white,
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
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
