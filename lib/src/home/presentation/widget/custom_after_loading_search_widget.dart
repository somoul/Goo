import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/src/home/presentation/screen/home_screen.dart';
import 'package:goo_rent/src/profile/presentation/screen/rented_room.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_card_rent_widget.dart';

class CustomAfterLoadingSearchWidget extends StatefulWidget {
  const CustomAfterLoadingSearchWidget(
      {Key? key, this.titleAppBar = 'លទ្ធផលការស្វែងរក'})
      : super(key: key);
  static const String routeName = '/custom_after_loading_search_widget';
  final String titleAppBar;

  @override
  State<CustomAfterLoadingSearchWidget> createState() =>
      _CustomAfterLoadingSearchWidgetState();
}

class _CustomAfterLoadingSearchWidgetState
    extends State<CustomAfterLoadingSearchWidget> {
  bool isCheckAction = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 24,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isCheckAction = true;
                      });
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/category.svg",
                      color: isCheckAction == true ? Colors.blue : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isCheckAction = false;
                      });
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/pause.svg",
                      color:
                          isCheckAction == false ? Colors.blue : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
        title: Text("អចលនទ្រព្យទាំងអស់",
            style: GoogleFonts.kantumruy(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      body: DefaultTabController(
          length: 6,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: SizedBox(
                height: 30,
                child: TabBar(
                  // controller: _tabController
                  isScrollable: true,
                  indicatorColor: Colors.grey,
                  labelColor: const Color(0xFF21A6F8),
                  unselectedLabelColor: Colors.grey,
                  indicator: const UnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 2.0, color: Color(0xFF21A6F8)),
                    // insets: EdgeInsets.symmetric(horizontal: 36)
                  ),
                  tabs: [
                    Tab(
                      // text: "ទូទៅ",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.add),
                          Text(
                            'បន្ទប់ជួល',
                            style: GoogleFonts.kantumruy(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      // text: "ទូទៅ",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.add),
                          Text(
                            'ដីជួល',
                            style: GoogleFonts.kantumruy(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      // text: "ទូទៅ",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.add),
                          Text(
                            'ឃ្លាំងជួល',
                            style: GoogleFonts.kantumruy(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      // text: "ទូទៅ",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.add),
                          Text(
                            'ផ្ទះជួល',
                            style: GoogleFonts.kantumruy(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      // text: "ទូទៅ",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.add),
                          Text(
                            'តូបជួល',
                            style: GoogleFonts.kantumruy(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      // text: "ទូទៅ",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.add),
                          Text(
                            'ផ្ទះអាជីវកម្ម',
                            style: GoogleFonts.kantumruy(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    // Tab(text: "ព័ត៍មានអំពីរទូទៅ"),
                  ],
                ),
              ),
            ),
            body: Container(
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: isCheckAction
                    ? _customCategoriesLayout()
                    : _customCategoriesListLayout(),
              ),
            ),
          )),
    );
  }

  _customCategoriesLayout() => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Card(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/icons/Pic1.png"),
                    Positioned(
                        bottom: 20,
                        left: 0,
                        child: Container(
                          width: 100,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Text(
                            "983883",
                            style: GoogleFonts.kantumruy(),
                          ),
                        )),
                    Positioned(
                      top: 30,
                      left: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              4,
                              (index) => Container(
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? Colors.white
                                            : const Color(0xFFC3E8FF),
                                        shape: BoxShape.circle),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2.5),
                                    width: 8,
                                    height: 8,
                                  )),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/eye.svg"),
                                Text(
                                  "120",
                                  style: GoogleFonts.kantumruy(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            child: Text(
                              "700ដុល្លា/១ខែ",
                              style: GoogleFonts.kantumruy(
                                  fontSize: 14, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                            "បន្ទប់ជួលនៅឈូកមាស សម្រាប់និស្សិត",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                      Row(
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
                            "ប្រហែល ៦០នាទី",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16, color: Colors.grey),
                          )
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/icons/rom_cm.png',
                                  height: 16,
                                  width: 16,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("3x5m"),
                              ],
                            ),

                            /// Disable Information of Card
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
                            //       'assets/icons/free.png',
                            //       height: 30,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     const Text("24/h"),
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
                            //       'assets/icons/Mask.png',
                            //       height: 30,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     const Text("សម្រាប់ម៉ូតូ"),
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
                            //       height: 60,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     const Text("ជាន់ទី 5"),
                            //   ],
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/icons/Pic1.png"),
                    Positioned(
                        bottom: 20,
                        left: 0,
                        child: Container(
                          width: 100,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Text(
                            "983883",
                            style: GoogleFonts.kantumruy(),
                          ),
                        )),
                    Positioned(
                      top: 30,
                      left: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              4,
                              (index) => Container(
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? Colors.white
                                            : const Color(0xFFC3E8FF),
                                        shape: BoxShape.circle),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2.5),
                                    width: 8,
                                    height: 8,
                                  )),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/eye.svg"),
                                Text(
                                  "120",
                                  style: GoogleFonts.kantumruy(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            child: Text(
                              "700ដុល្លា/១ខែ",
                              style: GoogleFonts.kantumruy(
                                  fontSize: 14, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                            "បន្ទប់ជួលនៅឈូកមាស សម្រាប់និស្សិត",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                      Row(
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
                            "ប្រហែល ៦០នាទី",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16, color: Colors.grey),
                          )
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/icons/rom_cm.png',
                                  height: 16,
                                  width: 16,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("3x5m"),
                              ],
                            ),

                            /// Disable Information of Card
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
                            //       'assets/icons/free.png',
                            //       height: 30,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     const Text("24/h"),
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
                            //       'assets/icons/Mask.png',
                            //       height: 30,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     const Text("សម្រាប់ម៉ូតូ"),
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
                            //       height: 60,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     const Text("ជាន់ទី 5"),
                            //   ],
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/icons/Pic1.png"),
                    Positioned(
                        bottom: 20,
                        left: 0,
                        child: Container(
                          width: 100,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Text(
                            "983883",
                            style: GoogleFonts.kantumruy(),
                          ),
                        )),
                    Positioned(
                      top: 30,
                      left: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              4,
                              (index) => Container(
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? Colors.white
                                            : const Color(0xFFC3E8FF),
                                        shape: BoxShape.circle),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2.5),
                                    width: 8,
                                    height: 8,
                                  )),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/eye.svg"),
                                Text(
                                  "120",
                                  style: GoogleFonts.kantumruy(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            child: Text(
                              "700ដុល្លា/១ខែ",
                              style: GoogleFonts.kantumruy(
                                  fontSize: 14, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                            "បន្ទប់ជួលនៅឈូកមាស សម្រាប់និស្សិត",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                      Row(
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
                            "ប្រហែល ៦០នាទី",
                            style: GoogleFonts.kantumruy(
                                fontSize: 16, color: Colors.grey),
                          )
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/icons/rom_cm.png',
                                  height: 16,
                                  width: 16,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("3x5m"),
                              ],
                            ),

                            /// Disable Information of Card
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
                            //       'assets/icons/free.png',
                            //       height: 30,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     const Text("24/h"),
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
                            //       'assets/icons/Mask.png',
                            //       height: 30,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     const Text("សម្រាប់ម៉ូតូ"),
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
                            //       height: 60,
                            //     ),
                            //     const SizedBox(
                            //       width: 5,
                            //     ),
                            //     const Text("ជាន់ទី 5"),
                            //   ],
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),

          const SizedBox(
            height: 16,
          ),
          // SizedBox(
          //   height: 50,
          //   child: TextField(
          //     // enableSuggestions: false,
          //     // autocorrect: false,
          //     onChanged: (c) {},
          //     decoration: InputDecoration(
          //         prefixIcon: Icon(
          //           Icons.search_outlined,
          //           color: AppConstant.kPrimaryColor,
          //         ),
          //         suffixIcon: Padding(
          //           padding: const EdgeInsets.only(right: 12,top: 10),
          //           child: Text(
          //             "ស្វែងរក",
          //             style:
          //                 GoogleFonts.kantumruy(color: AppConstant.kPrimaryColor),
          //           ),
          //         ),
          //         contentPadding: const EdgeInsets.all(0),
          //         hintStyle: GoogleFonts.kantumruy(fontSize: 16),
          //         hintText: "ផ្ទះជួលសម្រាប់អាជីវកម្ម",
          //         enabledBorder: _outLineBorder(),
          //         disabledBorder: _outLineBorder(),
          //         focusedBorder: _outLineBorder(),
          //         border: _outLineBorder()),
          //   ),
          // ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppConstant.kPrimaryColor,
                width: 0.1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppConstant.kPrimaryColor.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ផ្ទះជួលសម្រាប់អាជីវកម្ម',
                hintStyle: GoogleFonts.kantumruy(
                    fontSize: 16, color: Colors.grey.shade400),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 12, top: 12),
                  child: Text(
                    "ស្វែងរក",
                    style:
                        GoogleFonts.kantumruy(color: AppConstant.kPrimaryColor),
                  ),
                ),
                border: _outLineBorder(),
                disabledBorder: _outLineBorder(),
                focusedBorder: _outLineBorder(),
                enabledBorder: _outLineBorder(),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: AppConstant.kPrimaryColor,
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      );

  _customCategoriesListLayout() => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ...listTypeOfRent.map((e) => CustomCardRentWidget(
                imageSrc: e.imageSrc,
                typeName: e.typeName,
                location: e.location,
                sizeRent: e.sizeRent,
                horizontal: 0,
                code: e.code,
                priceOfRent: e.priceOfRent,
                iconOfCard: e.iconCard,
              )),
          ...listTypeOfRent1.map((e) => CustomCardRentWidget(
                imageSrc: e.imageSrc,
                typeName: e.typeName,
                location: e.location,
                sizeRent: e.sizeRent,
                horizontal: 0,
                code: e.code,
                priceOfRent: e.priceOfRent,
                iconOfCard: e.iconCard,
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppConstant.kPrimaryColor,
                width: 0.1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppConstant.kPrimaryColor.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ផ្ទះជួលសម្រាប់អាជីវកម្ម',
                hintStyle: GoogleFonts.kantumruy(
                    fontSize: 16, color: Colors.grey.shade400),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 12, top: 12),
                  child: Text(
                    "ស្វែងរក",
                    style:
                        GoogleFonts.kantumruy(color: AppConstant.kPrimaryColor),
                  ),
                ),
                border: _outLineBorder(),
                disabledBorder: _outLineBorder(),
                focusedBorder: _outLineBorder(),
                enabledBorder: _outLineBorder(),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: AppConstant.kPrimaryColor,
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      );

  _outLineBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Color(0XFF21A6F8)),
      );
}
