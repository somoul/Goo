import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/src/home/presentation/provider/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/presentation/widget/custom_after_loading_search_widget.dart';
import 'package:goo_rent/src/home/presentation/widget/custom_banner_list_widget.dart';
import 'package:goo_rent/src/home/presentation/widget/custom_card_rent_widget.dart';
import 'package:goo_rent/src/home/presentation/widget/custom_service_block.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../widget/buttom_sheen_for_search.dart';
import 'location_rent_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late PageController _pageController;
  late Animation<double> animation;
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.pageController = PageController(initialPage: 0);
    homeController.callStartAnimation();
    // context.read<AnimationBackgroundBannerProvider>().callStartAnimation();

    //
    //   _pageController.animateToPage(
    //     _currentPage,
    //     duration: Duration(milliseconds: 350),
    //     curve: Curves.easeIn,
    //   );
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstant.padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/location.svg',
                fit: BoxFit.contain,
                color: Colors.white,
                width: 24,
                height: 24,
              ),
              SizedBox(
                width: 5.r,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ទីតាំងបច្ចុប្បន្នរបស់អ្នក',
                    style: TextStyle(
                        fontFamily: GoogleFonts.kantumruy().fontFamily,
                        fontSize: 16),
                  ),
                  Text(
                    'ភ្នំពេញថ្មី ភូមិថ្មី ខណ្ឌសែនសុខ ភ្នំពេញ',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: GoogleFonts.kantumruy().fontFamily),
                  )
                ],
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 18,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                    color: Colors.amber,
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    child: GetBuilder<HomeController>(
                      builder: (controller) {
                        return PageView.builder(
                          controller: homeController.pageController,
                          itemCount: homeController.listIcon.length,
                          itemBuilder: (context, index) {
                            // controller.pageController =
                            //     PageController(initialPage: index);
                            _iniAnimated(value: index);
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      homeController.listIcon[index].iconSrc),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )),
                Column(
                  children: [
                    const SizedBox(height: 190),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 40, // soften the shadow
                            spreadRadius: 0.2, //extend the shadow
                            offset: const Offset(
                              5.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          showBottomSheetFunction(context: context);
                        },
                        child: Row(
                          children: [
                            Image.asset("assets/icons/search.png", height: 20),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("ផ្ទះជួលសម្រាប់អាជីវកម្ម",
                                style: AppText.bodySmall),
                            Expanded(
                              child: Text("ស្វែងរក",
                                  textAlign: TextAlign.end,
                                  style: AppText.bodyMedium!.copyWith(
                                      color: AppConstant.kPrimaryColor)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    /// Service
                    CustomServiceBlock(
                      categoryList: homeController.listIcon,
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ពេញនិយម", style: AppText.titleMedium),
                          InkWell(
                            onTap: () {
                              Get.to(
                                  () => const CustomAfterLoadingSearchWidget());
                            },
                            child: Text("មើលទាំងអស់",
                                style: AppText.titleSmall!.copyWith(
                                    color: AppConstant.kPrimaryColor)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppConstant.padding,
                    ),

                    /// Banner
                    const CustomBannerListWidget(),

                    /// Location
                    const SizedBox(height: AppConstant.padding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstant.padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ការណែនាំ", style: AppText.titleSmall),
                          InkWell(
                            onTap: () {
                              Get.to(
                                  () => const CustomAfterLoadingSearchWidget());
                              // GoRouter.of(context).push("/product_screen");
                              // GoRouter.of(context).push(
                              //     CustomAfterLoadingSearchWidget.routeName,
                              //     extra: "AA");
                            },
                            child: Text("មើលទាំងអស់",
                                style: AppText.titleSmall!.copyWith(
                                    color: AppConstant.kPrimaryColor)),
                          )
                        ],
                      ),
                    ),
                    ...listTypeOfRent.map((e) => CustomCardRentWidget(
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0)
                          .copyWith(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("តំបន់មានការជួលច្រើន",
                              style: GoogleFonts.kantumruy(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          InkWell(
                            onTap: () {
                              Get.to(() =>
                                  const LocationRentScreen(titleAppBar: ''));
                            },
                            child: Text("មើលទាំងអស់",
                                style: GoogleFonts.kantumruy(
                                    fontSize: 12,
                                    color: AppConstant.kPrimaryColor)),
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
    );
  }

  _buildIcon({required int value}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
              4,
              (index) => InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      // var valueString = '';
                      // switch (index + value + 1) {
                      //   case 1:
                      //     valueString = 'បន្ទប់ជួល';
                      //     break;
                      //   case 2:
                      //     valueString = 'ផ្ទះជួល';
                      //     break;
                      //   case 3:
                      //     valueString = 'ផ្ទះអាជីវកម្មជួល';

                      //     break;
                      //   case 4:
                      //     valueString = 'ឃ្នាំងជួល';

                      //     break;
                      //   case 5:
                      //     valueString = 'ខុនដូរ';

                      //     break;
                      //   case 6:
                      //     valueString = 'ដីជួល';

                      //     break;
                      //   case 7:
                      //     valueString = 'អាផាតមិនជួល';
                      //     break;

                      //   default:
                      //     valueString = 'ការិយាល័យជួល';
                      // }
                      // GoRouter.of(context)
                      //     .push('/location_rent_screen', extra: valueString);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          homeController.listIcon[index].iconSrc,
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5.r,
                        ),
                        Text(
                          homeController.listIcon[index + value].iconName,
                          style: GoogleFonts.kantumruy(),
                        )
                      ],
                    ),
                  ))
        ],
      );
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

class CategoriesItem {
  final String iconSrc;
  final String iconName;

  const CategoriesItem({required this.iconName, required this.iconSrc});
}
