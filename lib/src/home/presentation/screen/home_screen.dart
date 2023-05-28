import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/cores/constant/appconstant.dart';
import 'package:goo_rent/src/home/presentation/provider/animation_background_banner_provider/animation_background_banner_provider.dart';
import 'package:goo_rent/src/home/presentation/widget/custom_banner_list_widget.dart';
import 'package:goo_rent/src/home/presentation/widget/custom_card_rent_widget.dart';
import 'package:goo_rent/src/home/presentation/widget/type_of_rent_provider/type_of_index_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../widget/buttom_sheen_for_search.dart';
import 'location_rent_screen.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    context.read<AnimationBackgroundBannerProvider>().callStartAnimation();
    // _pageController.animateToPage(
    //   0,
    //   duration: Duration(milliseconds: 350),
    //   curve: Curves.easeIn,
    // );

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

  final List<CategoriesItem> listIcon = [
    const CategoriesItem(
        iconName: 'បន្ទប់ជួល', iconSrc: 'assets/icons/Mask group.png'),
    const CategoriesItem(
        iconName: 'ផ្ទះជួល', iconSrc: 'assets/icons/homerent.png'),
    const CategoriesItem(
        iconName: 'ផ្ទះអាជីវកម្ម', iconSrc: 'assets/icons/168.png'),
    const CategoriesItem(
        iconName: 'ឃ្លាំង', iconSrc: 'assets/icons/Mask group (1).png'),
    const CategoriesItem(
        iconName: 'ខុនដូរ', iconSrc: 'assets/icons/Mask group (2).png'),
    const CategoriesItem(
        iconName: 'ដឺជួល', iconSrc: 'assets/icons/facebook.png'),
    const CategoriesItem(
        iconName: 'អាផាតមិន', iconSrc: 'assets/icons/Group 34855.png'),
    const CategoriesItem(
        iconName: 'ការិយាល័យ', iconSrc: 'assets/icons/facebook.png'),
  ];

  _iniAnimated({required int value}) async {
    Timer(const Duration(seconds: 1), () {
      _pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final lengthCalculateFromListIcon = listIcon.length / 4;

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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  child: Consumer<AnimationBackgroundBannerProvider>(
                      builder: (context, i, widget) {
                        _iniAnimated(value: i.index);

                        return PageView.builder(
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            return widget!;
                          },
                          itemCount: 6,
                        );
                      },
                      child: Image.asset(
                        'assets/icons/Background.png',
                        fit: BoxFit.cover,
                      )),
                  // child: PageView.builder(
                  // //  controller: _pageController,
                  //   itemBuilder: (context, index) {
                  //     return  Image.asset(
                  //       'assets/icons/Background.png',
                  //       fit: BoxFit.cover,
                  //     );
                  //   },
                  //   itemCount: 6,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppConstant.padding,
                    bottom: AppConstant.padding,
                  ).copyWith(top: 130),
                  child: Column(
                    children: [
                      /// Categories Item
                      SizedBox(
                        height: 140.r,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppConstant.padding),
                          child: Card(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "សេវាកម្ម",
                                  style: TextStyle(color: Color(0xFF21A6F8)),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        PageView(
                                          onPageChanged: context
                                              .read<TypeListIndexProvider>()
                                              .changeIndex,
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            for (int i = 0;
                                                i < lengthCalculateFromListIcon;
                                                i++)
                                              _buildIcon(value: i * 4)
                                          ],
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            child:
                                                Consumer<TypeListIndexProvider>(
                                                    builder: (context, value,
                                                        child) {
                                              return Row(
                                                children: List.generate(
                                                    lengthCalculateFromListIcon
                                                        .toInt(), (index) {
                                                  return AnimatedContainer(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 1),
                                                    duration: const Duration(
                                                        milliseconds: 250),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: const Color(
                                                          0xFF21A6F8),
                                                    ),
                                                    width: value.index == index
                                                        ? 15
                                                        : 5,
                                                    height: 3,
                                                  );
                                                }),
                                              );
                                            }))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppConstant.padding,
                      ),
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
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
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
                                  style: GoogleFonts.kantumruy(
                                      color: Colors.grey, fontSize: 14)),
                              Expanded(
                                  child: Text("ស្វែងរក",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.kantumruy(
                                          color: const Color(0xFF21A6F8))))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppConstant.padding,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstant.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ពេញនិយម",
                                style: GoogleFonts.kantumruy(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: () {
                                // GoRouter.of(context).push(
                                //     CustomAfterLoadingSearchWidget.routeName,
                                //     extra: "AA");
                              },
                              child: Text("មើលទាំងអស់",
                                  style: GoogleFonts.kantumruy(
                                      fontSize: 12,
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
                      const SizedBox(
                        height: AppConstant.padding,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstant.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ការណែនាំ",
                                style: GoogleFonts.kantumruy(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: () {
                                // GoRouter.of(context).push("/product_screen");
                                // GoRouter.of(context).push(
                                //     CustomAfterLoadingSearchWidget.routeName,
                                //     extra: "AA");
                              },
                              child: Text("មើលទាំងអស់",
                                  style: GoogleFonts.kantumruy(
                                      fontSize: 12,
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
                                // GoRouter.of(context).push("/banner_detail");
                                // GoRouter.of(context).push(
                                //     LocationRentScreen.routeName,
                                //     extra: "តំបន់អចលនទ្រព្យ");
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
                  ),
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
                          listIcon[index].iconSrc,
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5.r,
                        ),
                        Text(
                          listIcon[index + value].iconName,
                          style: GoogleFonts.kantumruy(),
                        )
                      ],
                    ),
                  ))
        ],
      );
}

// listIcon.map((e) {
//   var index = listIcon.indexOf(e);
//   return InkWell(
//     highlightColor: Colors.transparent,
//     splashColor: Colors.transparent,
//     onTap: () {
//       // String valueString = '';
//       // switch (index) {
//       //   case 1:
//       //     valueString = 'ផ្ទះជួល';
//       //
//       //     break;
//       //   case 2:
//       //     valueString = 'អាផាតមិនជួល';
//       //
//       //     break;
//       //   default:
//       //     valueString = 'បន្ទប់ជួល';
//       // }
//       // GoRouter.of(context).push(
//       //     '/location_rent_screen',
//       //     extra: valueString);
//     },
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(
//           e.iconSrc,
//           width: 50,
//           height: 50,
//         ),
//         SizedBox(
//           height: 5.r,
//         ),
//         Text(e.iconName)
//       ],
//     ),
//   );
// }).toList()
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

class CategoriesItem {
  final String iconSrc;
  final String iconName;

  const CategoriesItem({required this.iconName, required this.iconSrc});
}
