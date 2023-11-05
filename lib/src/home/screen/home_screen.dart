import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/home/presentation/controller/map_controller.dart';
import 'package:goo_rent/src/home/presentation/screen/map_screen.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/widget/custom_banner_list_widget.dart';
import 'package:goo_rent/src/home/widget/custom_service_block.dart';
import 'package:goo_rent/src/profile/controller/profile_controller.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/presentation/screen/property_detail.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid.dart';
import 'package:goo_rent/src/widgets/slider.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

import '../controler/animation_background_banner_provider/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Animation<double> animation;
  final _homeController = Get.put(HomeController());
//
  late int selectedPage;
  // late final PageController _pageController;
  final pageCount = 5;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final _mapController = Get.put(MapController());
  final _propertyController = Get.put(PropertyController());
  final _profileCon = Get.put(ProfileController());
  List<Widget> imageSliders = [];
  @override
  void initState() {
    super.initState();

    Timer.run(() {
      _onInit();
    });
  }

  _onRefresh() async {
    await _homeController.fetchSlideBanner();
    await _homeController.fetchSliderCategorie();
    await _homeController.getPopularProperty(late: 1, long: 1);
    await _homeController.getAllProperties(late: 1, long: 1);
    await _mapController.getLocalAddress();
  }

  _onInit() async {
    try {
      await _mapController.getLocalAddress();
      await _homeController.fetchSlideBanner();
      await _homeController.fetchSliderCategorie();
      await _homeController.getPopularProperty(late: 1, long: 1);
      await _homeController.getAllProperties(late: 1, long: 1);
      await _profileCon.getUserInfo();
      selectedPage = 0;
      _homeController.pageController = PageController(initialPage: 0);
      await _homeController.callStartAnimation();
      await _mapController.getCurrentAddress();
    } catch (_) {
    } finally {}

    // _pageController = PageController(initialPage: selectedPage);
  }

  // _iniAnimated({required int value}) async {
  //   Timer(const Duration(seconds: 1), () {
  //     _homeController.pageController.animateToPage(
  //       value,
  //       duration: const Duration(milliseconds: 350),
  //       curve: Curves.easeIn,
  //     );
  //   });
  // }
  // int activePage = 1;
  _onClickBaner(int id) async {
    await _homeController.onClickBanner(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: Column(
        children: [
          Container(
            color: AppConstant.kPrimaryColor,
            child: Column(
              children: [
                MediaQuery.of(context).padding.top.gap,
                _buildLocation(),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _onRefresh();
              },
              child: CustomScrollView(
                physics: const ClampingScrollPhysics(),
                // physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // _buildSlider(),
                        Obx(
                          () => CustomSlider(
                            url: _homeController.homeslideList,
                            hasSearch: true,
                            onTap: (index) {
                              _onClickBaner(
                                  _homeController.listSideBarData[index].id!);
                            },
                            loading: _homeController.loadSlide.value,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Obx(
                          () => CustomCategoryBlock(
                            loading: _homeController.loadingCategory.value,
                            categoryList:
                                _homeController.listSideBarDataCategorie,
                          ),
                        ),

                        /// Popular
                        Obx(
                          () => CustomPopularBlock(
                            loading: _homeController.loadingPopular.value,
                            popularList: _homeController
                                    .popularPropertyData.value.propertyList ??
                                [],
                          ),
                        ),
                        const SizedBox(height: AppConstant.padding),

                        ///Recommend
                        Obx(
                          () => CustomPropertyGrid(
                            title: 'Recommend'.tr,
                            actionTitle: 'See All'.tr,
                            loading: _homeController.isLoadAllProperty.value,
                            onAction: () {
                              Get.to(() => const AllProperty());
                            },
                            propertyList: _homeController
                                    .propertyData.value.propertyList ??
                                [],
                            propertyController: _propertyController,
                          ),
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ), // Container(
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return InkWell(
      onTap: () => Get.to(const MapScreen()),
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
                        style: AppText.titleSmall!
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  Obx(
                    () => _mapController.currentAddress.value.provice == null
                        ? const SizedBox()
                        : Text(
                            '${_mapController.currentAddress.value.village}${_mapController.currentAddress.value.village != '' ? ', ' : ''}${_mapController.currentAddress.value.commune}${_mapController.currentAddress.value.commune != '' ? ',' : ''}${_mapController.currentAddress.value.distict}${_mapController.currentAddress.value.distict != '' ? ',' : ''} ${_mapController.currentAddress.value.provice}',
                            style: AppText.bodySmall!.copyWith(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // overflow: TextOverflow.ellipsis,
                          ),
                  ).pl(30),
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
];
