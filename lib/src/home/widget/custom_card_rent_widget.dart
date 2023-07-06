import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/src/home/screen/home_screen.dart';
import 'package:goo_rent/src/home/widget/buttom_sheet_default.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardRentWidget extends StatelessWidget {
  const CustomCardRentWidget(
      {Key? key,
      required this.imageSrc,
      required this.typeName,
      required this.location,
      required this.sizeRent,
      required this.priceOfRent,
      this.iconOfCard,
      this.code,
      this.horizontal = 0,
      this.checkAccount = "default"})
      : super(key: key);
  final String imageSrc;
  final String typeName;
  final String location;
  final String sizeRent;
  final String priceOfRent;
  final int? code;
  final IconOfCard? iconOfCard;
  final double horizontal;
  final String checkAccount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: horizontal)
          .copyWith(top: AppConstant.padding),
      child: InkWell(
        onTap: () {
          if (checkAccount.toLowerCase().contains("default")) {
          } else {
            showBottomSheetDefault(context: context, widget: Container());
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.padding - 8,
              vertical: AppConstant.padding - 8),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            imageSrc,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          )),
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.99),
                              borderRadius: BorderRadius.circular(2)),
                          width: 45,
                          height: 15,
                          child: Row(
                            textBaseline: TextBaseline.ideographic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/eye.svg",
                                color: Colors.grey,
                              ),
                              // Icon(
                              //   Icons.remove_red_eye,
                              //   color: Colors.grey,
                              //   size: 18,
                              // ),
                              const Text(
                                "120",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: AppConstant.padding,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(typeName,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.kantumruy(
                                    fontSize: 14.w,
                                    fontWeight: FontWeight.bold)),
                            Text(sizeRent,
                                style: GoogleFonts.kantumruy(
                                    fontSize: 12.w,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF21A6F8)))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/image2/make_group.png',
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text("ប្រហែល 15នាទី",
                                    style: GoogleFonts.kantumruy(
                                        color: Colors.grey, fontSize: 14)),
                              ],
                            ),
                            Text("Code: $code",
                                style: GoogleFonts.kantumruy(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 20,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(
                                      'assets/icons/rom_cm.png',
                                      height: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("3x5m", style: GoogleFonts.kantumruy()),
                                ],
                              ),

                              /// Hide all Information of Card

                              // const SizedBox(
                              //     height: 15,
                              //     child: VerticalDivider(
                              //       thickness: 1,
                              //       indent: 4,
                              //       color: Colors.grey,
                              //     )),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   textBaseline: TextBaseline.alphabetic,
                              //   children: [
                              //     Align(
                              //       alignment:Alignment.bottomCenter,
                              //       child: Image.asset(
                              //         'assets/icons/free.png',
                              //         height: 16,
                              //       ),
                              //     ),
                              //     const SizedBox(
                              //       width: 5,
                              //     ),
                              //     Text("Free", style: GoogleFonts.kantumruy()),
                              //   ],
                              // ),
                              // const SizedBox(
                              //     height: 15,
                              //     child: VerticalDivider(
                              //       thickness: 1,
                              //       indent: 4,
                              //       color: Colors.grey,
                              //     )),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   textBaseline: TextBaseline.alphabetic,                                children: [
                              //     Image.asset(
                              //       'assets/icons/Mask.png',
                              //       height: 16,
                              //     ),
                              //     const SizedBox(
                              //       width: 5,
                              //     ),
                              //     Align(alignment: Alignment.bottomCenter,child: const Text("1")),
                              //   ],
                              // ),
                              // const SizedBox(
                              //     height: 15,
                              //     child: VerticalDivider(
                              //       thickness: 1,
                              //       indent: 4,
                              //       color: Colors.grey,
                              //     )),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.end,
                              //   children: [
                              //     Image.asset(
                              //       'assets/icons/rom_peple.png',
                              //       height: 120,
                              //     ),
                              //     const Text("5"),
                              //   ],
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // Positioned(
              //     top: 2,
              //     right: 0,
              //     child: Text(sizeRent,
              //         style: GoogleFonts.kantumruy(
              //           fontSize: 12.w,
              //             fontWeight: FontWeight.bold,
              //             color: const Color(0xFF21A6F8))))
            ],
          ),
        ),
      ),
    );
  }
}
