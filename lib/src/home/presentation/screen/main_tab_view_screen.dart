import 'package:flutter/material.dart';
import 'package:goo_rent/src/home/presentation/screen/tap_view/general_news_page.dart';
import 'package:goo_rent/src/home/presentation/screen/tap_view/price_of_rent_page.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPageByType extends StatelessWidget {
  const DetailsPageByType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int val = 0;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: SizedBox(
              height: 50,
              child: StatefulBuilder(builder: (context, setStateTabBar) {
                return TabBar(
                  onTap: (va) {
                    setStateTabBar(() {
                      val = va;
                    });
                  },
                  indicatorColor: Colors.grey,
                  labelColor: const Color(0xFF21A6F8),
                  unselectedLabelColor: Colors.grey,
                  indicator: const UnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 2.0, color: Color(0xFF21A6F8)),
                      insets: EdgeInsets.symmetric(horizontal: 36)),
                  tabs: [
                    Tab(
                      // text: "ទូទៅ",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/start.png',
                            height: 30,
                            color: val == 0
                                ? const Color(0xFF21A6F8)
                                : Colors.grey,
                          ),
                          Text(
                            'ទូទៅ',
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
                          Image.asset(
                            'assets/icons/sell.png',
                            color: val == 1 ? const Color(0xFF21A6F8) : null,
                            height: 30,
                          ),
                          Text(
                            'កំពុងដាក់ជួល',
                            style: GoogleFonts.kantumruy(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          body: const TabBarView(
            children: [
              GeneralNewsPage(),
              PriceOfRentPage(),
              // FreeRoomsPage(),
            ],
          ),
        ));
  }
}
