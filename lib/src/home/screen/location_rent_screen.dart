import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_constant.dart';

class LocationRentScreen extends StatelessWidget {
  const LocationRentScreen({Key? key, required this.titleAppBar})
      : super(key: key);
  final String titleAppBar;
  static const String routeName = '/location_rent_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          titleAppBar,
          style: const TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
      body: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: SizedBox(
                height: 50,
                child: TabBar(
                  // controller: _tabController
                  isScrollable: true,
                  indicatorColor: Colors.grey,
                  labelColor: Color(0xFF21A6F8),
                  unselectedLabelColor: Colors.grey,
                  indicator: UnderlineTabIndicator(
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
                            style: TextStyle(fontSize: 16),
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
                            style: TextStyle(fontSize: 16),
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
                            style: TextStyle(fontSize: 16),
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
                            style: TextStyle(fontSize: 16),
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
                            style: TextStyle(fontSize: 16),
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
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    // Tab(text: "ព័ត៍មានអំពីរទូទៅ"),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              //controller: _tabController,
              children: [
                buildListLocationRealEstate(
                    context: context, titleAppBar: titleAppBar),
                buildListLocationRealEstate(
                    context: context, titleAppBar: titleAppBar),
                buildListLocationRealEstate(
                    context: context, titleAppBar: titleAppBar),
                buildListLocationRealEstate(
                    context: context, titleAppBar: titleAppBar),
                buildListLocationRealEstate(
                    context: context, titleAppBar: titleAppBar),
                buildListLocationRealEstate(
                    context: context, titleAppBar: titleAppBar),
              ],
            ),
          )),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: _locationItemList
      //         .map((e) => InkWell(
      //               onTap: () {
      //                 GoRouter.of(context).push(
      //                     '/custom_after_loading_search_widget',
      //                     extra: "$titleAppBar${e.areaName}");
      //               },
      //               child: Padding(
      //                   padding: const EdgeInsets.symmetric(
      //                       horizontal: AppConstant.padding,
      //                       vertical: AppConstant.padding / 2),
      //                   child: getCardLocationScreen(
      //                       context: context, titleAppBar: titleAppBar, e: e)),
      //             ))
      //         .toList(),
      //   ),
      // ),
    );
  }
}

Widget buildListLocationRealEstate(
        {required BuildContext context, required String titleAppBar}) =>
    SingleChildScrollView(
      child: Column(
        children: _locationItemList
            .map((e) => InkWell(
                  onTap: () {
                    // GoRouter.of(context).push(
                    //     '/custom_after_loading_search_widget',
                    //     extra: "$titleAppBar${e.areaName}");
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstant.padding,
                          vertical: AppConstant.padding / 2),
                      child: getCardLocationScreen(
                          context: context, titleAppBar: titleAppBar, e: e)),
                ))
            .toList(),
      ),
    );

Widget getCardLocationScreen(
        {required BuildContext context,
        required String titleAppBar,
        required LocationItem e}) =>
    SizedBox(
      height: 140,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              e.imgSrc,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$titleAppBar${e.areaName}",
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  e.quantityLocationRoomForRent,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
List<LocationItem> _locationItemList = [
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌសែនសុខ',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌ៧មករា',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌពោធិសែនជ័យ',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌទួលគោក',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌបឹងកេងកង',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌឬស្សីកែវ',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌដង្កោ',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌចំការមន',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌមានជ័យ',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
  const LocationItem(
      imgSrc: 'assets/icons/roms.png',
      areaName: 'ខ័ណ្ឌច្បាមអំពៅ',
      quantityLocationRoomForRent: 'មានបន្ទប់ជួល ១២ កន្លែង'),
];

class LocationItem {
  final String imgSrc;
  final String areaName;
  final String quantityLocationRoomForRent;

  const LocationItem(
      {required this.imgSrc,
      required this.areaName,
      required this.quantityLocationRoomForRent});
}
