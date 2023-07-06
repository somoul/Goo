import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/widget/custom_after_loading_search_widget.dart';
import 'package:goo_rent/src/home/widget/custom_card_rent_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../widget/buttom_sheen_for_search.dart';
import '../widget/custom_banner_list_widget.dart';
import '../widget/custom_service_block.dart';
import 'location_rent_screen.dart';

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
  late final PageController _pageController;
  final pageCount = 5;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    homeController.fetchSlideBanner();
    homeController.fetchSliderCategorie();
    super.initState();
    homeController.pageController = PageController(initialPage: 0);
    homeController.callStartAnimation();
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _iniAnimated({required int value}) async {
    Timer(const Duration(seconds: 1), () {
      homeController.pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  int activePage = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = homeController.listSideBarData
        .map(
          (item) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              imageUrl: item.imageUrl!,
              height: 35,
            ),
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 80,
        leading: null,
        actions: null,
        title: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstant.paddingLarge),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/location.svg',
                fit: BoxFit.contain,
                color: Colors.white,
                width: 25,
                height: 28,
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Current Location'.tr,
                    style: AppText.titleMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffFFFFFF)),
                  ),
                  Text(
                    'ភ្នំពេញថ្មី ភូមិថ្មី ខណ្ឌសែន សុខ ភ្នំពេញ',
                    style: AppText.titleMedium!.copyWith(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffFAFAFA)),
                  ),
                ],
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 23,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => homeController.isfetchLoadingBanner.value ||
                homeController.isfetchLoadingCategorie.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        Stack(
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
                                  aspectRatio: 2.0,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      homeController.indexSlider.value = index;
                                    });
                                  }),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 170),
                            Container(
                              width: double.infinity,
                              height: 60,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 40,
                                    spreadRadius: 0.2,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                  )
                                ],
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                onTap: () {
                                  showBottomSheetFunction(context: context);
                                },
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons/search.png",
                                        height: 20),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("ផ្ទះជួលសម្រាប់អាជីវកម្ម",
                                        style: AppText.bodySmall),
                                    Expanded(
                                      child: Text("ស្វែងរក",
                                          textAlign: TextAlign.end,
                                          style: AppText.bodyMedium!.copyWith(
                                              color:
                                                  AppConstant.kPrimaryColor)),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// Service
                            CustomServiceBlock(
                              categoryList:
                                  homeController.listSideBarDataCategorie,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: AppConstant.paddingLarge,
                                  ),
                                  child: Text("ពេញនិយម",
                                      style: AppText.titleSmall!.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                                const SizedBox(
                                  height: AppConstant.paddingSmall,
                                ),

                                /// Banner
                                const CustomBannerListWidget(),

                                /// Location
                                const SizedBox(height: AppConstant.padding),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppConstant.padding),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("ការណែនាំ",
                                          style: AppText.titleSmall),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() =>
                                              const CustomAfterLoadingSearchWidget());
                                          // GoRouter.of(context).push("/product_screen");
                                          // GoRouter.of(context).push(
                                          //     CustomAfterLoadingSearchWidget.routeName,
                                          //     extra: "AA");
                                        },
                                        child: Text("មើលទាំងអស់",
                                            style: AppText.titleSmall!.copyWith(
                                                color:
                                                    AppConstant.kPrimaryColor)),
                                      )
                                    ],
                                  ),
                                ),
                                ...listTypeOfRent
                                    .map((e) => CustomCardRentWidget(
                                          imageSrc: e.imageSrc,
                                          typeName: e.typeName,
                                          location: e.location,
                                          sizeRent: e.sizeRent,
                                          horizontal: AppConstant.padding,
                                          code: e.code,
                                          priceOfRent: e.priceOfRent,
                                          iconOfCard: e.iconCard,
                                        )),
                                const SizedBox(
                                  height: AppConstant.padding,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0)
                                      .copyWith(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("តំបន់មានការជួលច្រើន",
                                          style: GoogleFonts.kantumruy(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const LocationRentScreen(
                                              titleAppBar: ''));
                                        },
                                        child: Text("មើលទាំងអស់",
                                            style: GoogleFonts.kantumruy(
                                                fontSize: 12,
                                                color:
                                                    AppConstant.kPrimaryColor)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppConstant.padding),
                                  child: getCardLocationScreen(
                                      context: context,
                                      titleAppBar: 'បន្ទប់ជួល',
                                      e: const LocationItem(
                                          imgSrc: 'assets/icons/roms.png',
                                          areaName: 'ខណ្ឌសែន សុខ',
                                          quantityLocationRoomForRent:
                                              'មានបន្ទប់ជួល ១២ កន្លែង')),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // const SliverPadding(
                  //   padding: EdgeInsets.only(right: AppConstant.padding),
                  //   sliver: SliverToBoxAdapter(
                  //     child:
                  //
                  //         /// Banner
                  //         CustomMultiScrollWidget(),
                  //   ),
                  // )
                ],
              ),
      ),
    );
  }

  // _buildIcon({required int value}) => Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         ...List.generate(
  //             4,
  //             (index) => InkWell(
  //                   highlightColor: Colors.transparent,
  //                   splashColor: Colors.transparent,
  //                   onTap: () {
  //                     // var valueString = '';
  //                     // switch (index + value + 1) {
  //                     //   case 1:
  //                     //     valueString = 'បន្ទប់ជួល';
  //                     //     break;
  //                     //   case 2:
  //                     //     valueString = 'ផ្ទះជួល';
  //                     //     break;
  //                     //   case 3:
  //                     //     valueString = 'ផ្ទះអាជីវកម្មជួល';

  //                     //     break;
  //                     //   case 4:
  //                     //     valueString = 'ឃ្នាំងជួល';

  //                     //     break;
  //                     //   case 5:
  //                     //     valueString = 'ខុនដូរ';

  //                     //     break;
  //                     //   case 6:
  //                     //     valueString = 'ដីជួល';

  //                     //     break;
  //                     //   case 7:
  //                     //     valueString = 'អាផាតមិនជួល';
  //                     //     break;

  //                     //   default:
  //                     //     valueString = 'ការិយាល័យជួល';
  //                     // }
  //                     // GoRouter.of(context)
  //                     //     .push('/location_rent_screen', extra: valueString);
  //                   },
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Image.asset(
  //                         homeController.listIcon[index].iconSrc,
  //                         width: 50,
  //                         height: 50,
  //                       ),
  //                       SizedBox(
  //                         height: 5.r,
  //                       ),
  //                       Text(
  //                         homeController.listIcon[index + value].iconName,
  //                         style: GoogleFonts.kantumruy(),
  //                       )
  //                     ],
  //                   ),
  //                 ))
  //       ],
  //     );
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
