import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/cores/constant/appconstant.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_drop_down_button_widget.dart';
import 'custom_rangevalue_widget.dart';

void showBottomSheetFunction({required BuildContext context}) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetScreen(),
        );
      });
}

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    bool isRentForHome = true;
    return AnimatedPadding(
      duration: kThemeAnimationDuration,
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "តើលោកអ្នកកំពុងត្រូវការជួលអ្វី?",
                style: GoogleFonts.kantumruy(
                    color: const Color(0xFF21A6F8), fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           setStateButtonSheet(() {
              //             priceCheck = true;
              //           });
              //         },
              //         child: Container(
              //           margin: const EdgeInsets.symmetric(vertical: 10),
              //           height: 40,
              //           decoration: BoxDecoration(
              //               color: priceCheck == true
              //                   ? AppConstant.kPrimaryColor.withOpacity(0.2)
              //                   : Colors.grey.shade100),
              //           alignment: Alignment.center,
              //           child: Text(
              //             "តម្លៃមធ្យម",
              //             style: GoogleFonts.kantumruy(
              //                 color: priceCheck == true
              //                     ? AppConstant.kPrimaryColor
              //                     : Colors.black),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           setStateButtonSheet(() {
              //             priceCheck = false;
              //           });
              //         },
              //         child: Container(
              //             margin: const EdgeInsets.symmetric(vertical: 10),
              //             height: 40,
              //             decoration: BoxDecoration(
              //                 color: priceCheck == false
              //                     ? AppConstant.kPrimaryColor.withOpacity(0.2)
              //                     : Colors.grey.shade100),
              //             alignment: Alignment.center,
              //             child: Text(
              //               "តម្លៃខ្ពស់",
              //               style: GoogleFonts.kantumruy(
              //                   color: priceCheck == false
              //                       ? AppConstant.kPrimaryColor
              //                       : Colors.black),
              //             )),
              //       ),
              //     ),
              //   ],
              // ),
              StatefulBuilder(builder: (context, setStateRent) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setStateRent(() {
                            isRentForHome = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isRentForHome == true
                                ? AppConstant.kPrimaryColor.withOpacity(0.2)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "សម្រាប់លំនៅដ្ធាន",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16,
                                color: isRentForHome == true
                                    ? AppConstant.kPrimaryColor
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setStateRent(() {
                            isRentForHome = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isRentForHome == false
                                ? AppConstant.kPrimaryColor.withOpacity(0.2)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "សម្រាប់អាជីវកម្ម",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16,
                                color: isRentForHome == false
                                    ? AppConstant.kPrimaryColor
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),

                    // Expanded(
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade200),
                    //       onPressed: () {},
                    //       child: const Text(
                    //         "សម្រាប់លំនៅដ្ធាន",
                    //         style: TextStyle(color: Colors.white),
                    //       )),
                    // ),
                    // const SizedBox(
                    //   width: 16,
                    // ),
                    // Expanded(
                    //   child: ElevatedButton(
                    //       onPressed: () {},
                    //       child: const Text(
                    //         "សម្រាប់អាជីវកម្ម",
                    //         style: TextStyle(color: Colors.white),
                    //       )),
                    // ),
                  ],
                );
              }),

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  style: GoogleFonts.kantumruy(fontSize: 22),
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.kantumruy(
                        fontSize: 14.sp, color: const Color(0XFFDADADA)),
                    hintText: "បញ្ចូលទីតាំងរបស់អ្នកត្រូវជួល",
                    contentPadding: const EdgeInsets.all(0),
                    suffixIcon: IconButton(
                        onPressed: () {
                          // GoRouter.of(context)
                          //     .push(BuildAddressScreen.routeName);
                        },
                        icon: const Icon(Icons.arrow_forward_ios_sharp)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(
                          'assets/icons/location.svg',
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                    errorBorder: _getDecoreOutLineBorderTextField(),
                    focusedBorder: _getDecoreOutLineBorderTextField(),
                    focusedErrorBorder: _getDecoreOutLineBorderTextField(),
                    disabledBorder: _getDecoreOutLineBorderTextField(),
                    enabledBorder: _getDecoreOutLineBorderTextField(),
                    border: _getDecoreOutLineBorderTextField(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   height: 50,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: "ជ្រើសរើសប្រភេទជួលអ្នកត្រូវការ",
              //       prefixIcon: Icon(Icons.add),
              //       suffixIcon: Icon(Icons.arrow_forward_ios_sharp),
              //       errorBorder: _getDecoreOutLineBorderTextField(),
              //       focusedBorder: _getDecoreOutLineBorderTextField(),
              //       focusedErrorBorder: _getDecoreOutLineBorderTextField(),
              //       disabledBorder: _getDecoreOutLineBorderTextField(),
              //       enabledBorder: _getDecoreOutLineBorderTextField(),
              //       border: _getDecoreOutLineBorderTextField(),
              //     ),
              //   ),
              // ),
              const CustomDropDownButtonWidget(
                iconWidget: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.grey,
                ),
                hintText: 'ជ្រើសរើសប្រភេទជួលអ្នកត្រូវការ',
                svgSrc: 'assets/icons/home3.svg',
                itemList: [
                  'បន្ទប់ជួល',
                  'ផ្ទះជួល',
                  'ខុនដូរជួរ',
                  'អាផាតមិនជួល',
                  'វីឡាជួល',
                  'ភូមិគ្រិះជួល',
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "កំណត់តម្លៃដែលអ្នកចង់ស្វែងរក",
                style: GoogleFonts.kantumruy(fontSize: 16),
              ),
              const CustomRangeValueWidget(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: ElevatedButton(
                    onPressed: () {
                      // GoRouter.of(context).push(ResultFromRentScreen.routeName);
                    },
                    child: Text(
                      "ចាប់ផ្តើមស្វែងរក",
                      style: GoogleFonts.kantumruy(
                          color: Colors.white, fontSize: 16),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_getDecoreOutLineBorderTextField() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.grey.shade300),
  );
}
