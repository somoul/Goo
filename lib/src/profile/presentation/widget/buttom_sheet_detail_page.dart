import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_rent/src/home/screen/tap_view/general_news_page.dart';
import 'package:google_fonts/google_fonts.dart';

void showBottomSheetDefault({required BuildContext context}) {
  final PageController detailsPageController = PageController(initialPage: 0);

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
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.92,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200.r,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (contextPageView, index) {
                            return ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              child: Image.asset(
                                'assets/image2/room1.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          controller: detailsPageController,
                          itemCount: 5,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     IconButton(
                        //       icon: const Icon(Icons.arrow_back_ios_new),
                        //       color: Colors.white,
                        //       onPressed: () {
                        //         detailsPageController.previousPage(
                        //             duration: const Duration(milliseconds: 700),
                        //             curve: Curves.easeInOut);
                        //       },
                        //     ),
                        //     IconButton(
                        //         icon: const Icon(Icons.arrow_forward_ios),
                        //         color: Colors.white,
                        //         onPressed: () {
                        //           detailsPageController.nextPage(
                        //               duration:
                        //                   const Duration(milliseconds: 700),
                        //               curve: Curves.easeInOut);
                        //         }),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Wrap(
                                  children: [
                                    Text(
                                      "បន្ទប់សម្រាប់ជួលផ្សារទឹកថ្លា ",
                                      style:
                                          GoogleFonts.kantumruy(fontSize: 24),
                                    ),
                                    Text(
                                      "\$90/ខែ ",
                                      style: GoogleFonts.kantumruy(
                                          fontSize: 24, color: Colors.blue),
                                    ),
                                    Text(
                                      "ធូរថ្លៃ",
                                      style:
                                          GoogleFonts.kantumruy(fontSize: 24),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: listButtonSheetDetailsEntity
                                      .map((e) => Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.05),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Row(
                                              children: [
                                                e.icon,
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  e.price,
                                                  style:
                                                      GoogleFonts.kantumruy(),
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Container(
                                  height: 35,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/code_number.png',
                                            height: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "លេខកូដ",
                                            style: GoogleFonts.kantumruy(),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "AIB9",
                                            style: GoogleFonts.kantumruy(
                                                color: const Color(0xFF21A6F8)),
                                            // style: TextStyle(
                                            //     color: Color(0xFF21A6F8)
                                            // ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/code33.png',
                                            height: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "ប្រភេទ:",
                                            style: GoogleFonts.kantumruy(
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "AIB9",
                                            style: GoogleFonts.kantumruy(
                                                color: const Color(0xFF21A6F8)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Divider(
                                color: Colors.red,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ការពិពណ៍នា",
                                      style: GoogleFonts.kantumruy(
                                          color: const Color(
                                            0xFF21A6F8,
                                          ),
                                          fontSize: 22),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "• បន្ទប់មានភាបស្ងប់ស្ងាត់មិនមានសំឡេងរំខាន់ពីអ្នកជិតខាង ការរស់នៅប្រកបដោយសុវត្តិភាព។",
                                      style:
                                          GoogleFonts.kantumruy(fontSize: 16),
                                    ),
                                    Text(
                                      "• បន្ទប់មានភាបស្ងប់ស្ងាត់មិនមានសំឡេងរំខាន់ពីអ្នកជិតខាង ការរស់នៅប្រកបដោយសុវត្តិភាព។",
                                      style:
                                          GoogleFonts.kantumruy(fontSize: 16),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ពត៍មានបន្ទប់",
                                style: GoogleFonts.kantumruy(
                                    fontSize: 22,
                                    color: const Color(
                                      0xFF21A6F8,
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                // mainAxisAlignment: MainAxisAlignment
                                //     .spaceBetween,
                                children: listEquipmentProvided
                                    .map((e) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16 / 3, vertical: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.05),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              e.icon,
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                e.nameOfEquipmentProvider,
                                                style: GoogleFonts.kantumruy(),
                                              )
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(
                                  3,
                                  (index) => SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.4,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                // backgroundColor: index == 0
                                                //     ? const Color(0xFFE84C3D)
                                                //     : index == 1
                                                //         ? const Color(0xFF4C4372)
                                                //         : const Color(0xFF21A6F8),
                                                ),
                                            onPressed: () {},
                                            child: Text(
                                              index == 0
                                                  ? "លុប"
                                                  : index == 1
                                                      ? "បានកក់"
                                                      : "កែប្រែ",
                                              style: GoogleFonts.kantumruy(
                                                  color: Colors.white),
                                            )),
                                      ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
              const Positioned(
                child: SizedBox(
                  height: 20,
                  width: 120,
                  child: Divider(
                    color: Colors.white,
                    height: 10,
                    thickness: 4,
                  ),
                ),
              )
            ],
          ),
        );
      });
}

List<ButtonSheetDetailPageEntity> listButtonSheetDetailsEntity = [
  ButtonSheetDetailPageEntity(
      icon: Image.asset("assets/image2/charge.png"), price: '100,0៛/W'),
  ButtonSheetDetailPageEntity(
      icon: Image.asset("assets/image2/water.png"), price: '100,0៛/M'),
];

class ButtonSheetDetailPageEntity {
  final Widget icon;
  final String price;

  ButtonSheetDetailPageEntity({required this.icon, required this.price});
}
