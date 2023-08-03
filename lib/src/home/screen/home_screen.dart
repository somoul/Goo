import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/src/home/presentation/controller/map_controller.dart';

import 'package:goo_rent/src/home/screen/search_house_for_rent_screen.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/widget/custom_banner_list_widget.dart';
import 'package:goo_rent/src/home/widget/custom_service_block.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/presentation/screen/property_detail.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid.dart';

import '../controler/animation_background_banner_provider/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Animation<double> animation;
  final homeController = Get.put(HomeController());
//
  late int selectedPage;
  // late final PageController _pageController;
  final pageCount = 5;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final CarouselController _controller = CarouselController();
  final _mapController = Get.put(MapController());
  final _propertyController = Get.put(PropertyController());

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      _onInit();
    });
  }

  _onInit() async {
    homeController.fetchSlideBanner();
    homeController.fetchSliderCategorie();
    _propertyController.getPopularProperty(late: 1, long: 1);
    _propertyController.getAllProperties(late: 1, long: 1);
    selectedPage = 0;
    homeController.pageController = PageController(initialPage: 0);
    homeController.callStartAnimation();
    _mapController.getCurrentAddress();

    // _pageController = PageController(initialPage: selectedPage);
  }

  @override
  void dispose() {
    super.dispose();
  }

  // _iniAnimated({required int value}) async {
  //   Timer(const Duration(seconds: 1), () {
  //     homeController.pageController.animateToPage(
  //       value,
  //       duration: const Duration(milliseconds: 350),
  //       curve: Curves.easeIn,
  //     );
  //   });
  // }

  int activePage = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = homeController.listSideBarData
        .map(
          (item) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
              ),
              imageUrl: item.imageUrl!,
            ),
          ),
        )
        .toList();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
          AppConstant.kPrimaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),

      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.to(const SearchRentScreen()),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: AppConstant.kPrimaryColor,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 30,
                                child: SvgPicture.asset(
                                  'assets/icons/location.svg',
                                  fit: BoxFit.contain,
                                  color: Colors.white,
                                  width: 24,
                                ),
                              ),
                              Text(
                                'Your Current Location'.tr,
                                style: AppText.titleSmall!.copyWith(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                          Obx(
                            () => _mapController.currentAddress.value.provice ==
                                    null
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      '${_mapController.currentAddress.value.village}${_mapController.currentAddress.value.village != '' ? ', ' : ''}${_mapController.currentAddress.value.commune}${_mapController.currentAddress.value.commune != '' ? ',' : ''}${_mapController.currentAddress.value.distict}${_mapController.currentAddress.value.distict != '' ? ',' : ''} ${_mapController.currentAddress.value.provice}',
                                      style: AppText.bodySmall!.copyWith(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    const SizedBox(
                      width: 40,
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await homeController.fetchSlideBanner();
                  await homeController.fetchSliderCategorie();
                  await _propertyController.getPopularProperty(
                      late: 1, long: 1);
                  await _propertyController.getAllProperties(late: 1, long: 1);
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  CarouselSlider(
                                    items: imageSliders,
                                    carouselController: _controller,
                                    options: CarouselOptions(
                                      padEnds: false,
                                      autoPlay: true,
                                      enlargeFactor: 0,
                                      enlargeCenterPage: true,
                                      viewportFraction: 1,
                                      aspectRatio: 2,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.height,
                                      onPageChanged: (index, reason) {
                                        homeController.indexSlider.value =
                                            index;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: -28,
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 14),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppConstant.kPrimaryColor
                                                .withOpacity(0.15),
                                            blurRadius: 20,
                                            offset: const Offset(
                                              2.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        border: Border.all(
                                            width: 3,
                                            color: AppConstant.kPrimaryColor),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchRentScreen(),
                                            ), //TabBarDemo
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/image/search.svg'),
                                            const SizedBox(width: 10),
                                            Text("ផ្ទះជួលសម្រាប់អាជីវកម្ម",
                                                style: AppText.bodySmall),
                                            Expanded(
                                              child: Text("Search".tr,
                                                  textAlign: TextAlign.end,
                                                  style: AppText.bodyMedium!
                                                      .copyWith(
                                                          color: AppConstant
                                                              .kPrimaryColor)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 10),
                                    ...imageSliders.map((e) {
                                      int index = imageSliders.indexOf(e);
                                      return Container(
                                        height: 8.5,
                                        width: 8.5,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: homeController
                                                        .indexSlider.value ==
                                                    index
                                                ? AppConstant.kPrimaryColor
                                                : Colors.white),
                                      );
                                    }).toList()
                                  ]),
                            ],
                          ),
                          const SizedBox(height: 30),
                          CustomCategoryBlock(
                            categoryList:
                                homeController.listSideBarDataCategorie,
                          ),
                          Container(
                            color: const Color(0xffF9F9F9),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),

                                /// Popular
                                Obx(
                                  () => CustomPopularBlock(
                                    popularList: _propertyController
                                            .popularPropertyData.value.data ??
                                        [],
                                  ),
                                ),
                                const SizedBox(height: AppConstant.padding),

                                ///Recommend
                                Obx(
                                  () => CustomPropertyGrid(
                                    title: 'Recommend'.tr,
                                    actionTitle: 'See All'.tr,
                                    onAction: () {
                                      Get.to(() => const AllProperty());
                                    },
                                    propertyList: _propertyController
                                            .propertyData.value.propertyList ??
                                        [],
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          )
                        ],
                      ),
                    ), // Container(
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

class TypeOfRent {
  final int code;
  final String imageSrc;
  final String typeName;
  final String location;
  final String sizeRent;
  final String priceOfRent;
  final IconOfCard iconCard;

  const TypeOfRent(
      {required this.iconCard,
      required this.imageSrc,
      required this.typeName,
      required this.location,
      required this.priceOfRent,
      required this.sizeRent,
      required this.code});
}

class IconOfCard {
  final String size;
  final String status;
  final String park;
  final String stair;

  const IconOfCard(
      {required this.size,
      required this.status,
      required this.park,
      required this.stair});
}

List<TypeOfRent> listTypeOfRent = [
  const TypeOfRent(
      code: 983883,
      imageSrc: 'assets/icons/Rectangle11.png',
      typeName: "បន្ទប់ជួលផ្សាឈូកមាស",
      location: "ទីតាំង ភ្នំពេញថ្មី ភូមិថ្មី ខណ្ឌសែនសុខ ភ្នំពេញ",
      priceOfRent: "ទំហំ ២ x ៤ ម៉ែត្រ",
      sizeRent: ' ៦០ដុល្លា ១ខែ',
      iconCard:
          IconOfCard(size: '3x5m', stair: '5', status: 'Free', park: '1')),
  const TypeOfRent(
      code: 983883,
      imageSrc: 'assets/icons/Rectangle11.png',
      typeName: "បន្ទប់ជួលផ្សាឈូកមាស",
      location: "ទីតាំង ភ្នំពេញថ្មី ភូមិថ្មី ខណ្ឌសែនសុខ ភ្នំពេញ",
      priceOfRent: "ទំហំ ២ x ៤ ម៉ែត្រ",
      sizeRent: ' ៦០ដុល្លា ១ខែ',
      iconCard:
          IconOfCard(size: '3x5m', stair: '5', status: 'Free', park: '1')),
  const TypeOfRent(
      code: 983883,
      imageSrc: 'assets/icons/Rectangle11.png',
      typeName: "បន្ទប់ជួលផ្សាឈូកមាស",
      location: "ទីតាំង ភ្នំពេញថ្មី ភូមិថ្មី ខណ្ឌសែនសុខ ភ្នំពេញ",
      priceOfRent: "ទំហំ ២ x ៤ ម៉ែត្រ",
      sizeRent: ' ៦០ដុល្លា ១ខែ',
      iconCard:
          IconOfCard(size: '3x5m', stair: '5', status: 'Free', park: '1')),
];

// class CategoriesItem {
//   final String iconSrc;
//   final String iconName;

//   const CategoriesItem({required this.iconName, required this.iconSrc});
// }

Padding padding = const Padding(
    padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0));

//
const colors = [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];

void imageSlider(
    List<Widget>? imageSliders,
    CarouselController? controller,
    Function(int, CarouselPageChangedReason) onChanged,
    HomeController homeController) {
  CarouselSlider(
    items: imageSliders,
    carouselController: controller,
    options: CarouselOptions(
        padEnds: false,
        autoPlay: true,
        enlargeFactor: 0,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 2.0,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        onPageChanged: onChanged
        // (index, reason) {
        // setState(() {
        //   homeController.indexSlider.value = index;
        // });
        // }

        ),
  );
  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    const SizedBox(width: 10),
    ...imageSliders!.map((e) {
      int index = imageSliders.indexOf(e);
      return Container(
        height: 8.5,
        width: 8.5,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: homeController.indexSlider.value == index
                ? AppConstant.kPrimaryColor
                : Colors.white),
      );
    }).toList()
  ]);
}
