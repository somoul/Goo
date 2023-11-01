import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/src/home/widget/buttom_sheen_request_rent.dart';
import 'package:goo_rent/src/home/widget/buttom_sheet_default.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  // static const String routeName = '/details_screen';

  @override
  Widget build(BuildContext context) {
    final PageController detailsPageController = PageController(initialPage: 0);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'ព័ត៏មានអំពីការជួល',
          // style: GoogleFonts.kantumruy(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset(
              "assets/icons/send2.svg",
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  itemBuilder: (contextPageView, index) {
                    return SizedBox(
                      child: Image.asset(
                        'assets/icons/Rectangl_39649.jpg',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  controller: detailsPageController,
                  itemCount: 5,
                ),

                Positioned(
                  bottom: 10,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    width: 160,
                    height: 40,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "រូបភាព/10",
                          // style: GoogleFonts.kantumruy(fontSize: 18),
                        )
                      ],
                    ),
                  ),
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
                //               duration: const Duration(milliseconds: 700),
                //               curve: Curves.easeInOut);
                //         }),
                //   ],
                // )
              ],
            ),
          ),
          // Expanded(child: DetailsPageByType()),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstant.padding, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // backgroundColor: const Color(0xFF21A6F8)
                      ),
                  onPressed: () {
                    showBottomSheetRequestRentFunction(context: context);
                  },
                  child: const Text(
                    "ស្នើរសុំជួល",
                    // style: GoogleFonts.kantumruy(
                    //     color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: AppConstant.padding,
            ),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[50],
                    radius: 20,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Image.asset("assets/icons/contect.png"),
                      onPressed: () {
                        showBottomSheetDefault(
                            context: context,
                            widget: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  "សេវាកម្មបម្រើអតិថិជន",
                                  // style: GoogleFonts.kantumruy(fontSize: 28),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(16),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/image2/telegram.png',
                                            height: 30,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            "ផ្ញើសារតាមតេឡេក្រាម",
                                            // style: GoogleFonts.kantumruy(
                                            //     color: const Color(0xff29AAEC),
                                            //     fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(16),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/facebook.png',
                                            height: 35,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            "ផ្ញើសារតាមហ្វេសប៊ុក",
                                            // style: GoogleFonts.kantumruy(
                                            //     color: const Color(0xff1877F2),
                                            //     fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[50],
                    radius: 20,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Image.asset("assets/icons/call.png"),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
