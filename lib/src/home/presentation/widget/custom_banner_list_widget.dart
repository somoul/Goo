import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/appconstant.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBannerListWidget extends StatelessWidget {
  const CustomBannerListWidget({Key? key, this.axis = Axis.horizontal})
      : super(key: key);
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.900);

    return SizedBox(
      height: 330,
      child: PageView.builder(
        scrollDirection: axis,
        controller: pageController,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(right: 18),
            child: Column(
              children: [
                Image.asset("assets/icons/Rectangle2416.png"),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstant.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ផ្ទះអាជីវកម្មសម្រាប់ជួល",
                            style: GoogleFonts.kantumruy(fontSize: 16),
                          ),
                          Text(
                            "\$1200/1ខែ",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16, color: const Color(0xFF21A6F8)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Image.asset(
                                'assets/image2/make_group.png',
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "ប្រហែល15នាទី",
                                style: GoogleFonts.kantumruy(),
                              )
                            ],
                          ),
                          Text(
                            "Code: 983883",
                            style: GoogleFonts.kantumruy(
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.blue,
                              ))
                        ],
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
                                Text(
                                  "3x5m",
                                  style: GoogleFonts.kantumruy(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: _bannerList.length,
      ),
    );
  }
}

List<String> _bannerList = [
  'assets/icons/Slide.png',
  'assets/icons/Promotion.png',
  'assets/icons/Slide1.png',
  'assets/icons/Slide2.png',
  'assets/icons/Slide3.png',
];
