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
import 'package:goo_rent/src/post_property/controller/post_property_controller.dart';
import 'package:goo_rent/src/profile/controller/profile_controller.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/presentation/screen/property_listing.dart';
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
  final _mapController = Get.put(GMapController());
  final _propertyController = Get.put(PropertyController());
  final _profileCon = Get.put(ProfileController());
  final _postPropertyCon = Get.put(PostPropertyController());
  List<Widget> imageSliders = [];
  @override
  void initState() {
    super.initState();

    Timer.run(() {
      _onInit();
    });
  }

  _onRefresh() async {
    _onInit();
  }

  _onInit() async {
    try {
      await _homeController.fetchSlideBanner();
      await _homeController.fetchSliderCategorie();
      await _homeController.getPopularProperty(late: 1, long: 1);
      await _homeController.getAllProperties(
          late: _mapController.addressModel.value.lattitude ?? '',
          long: _mapController.addressModel.value.longitude ?? '');
      await _profileCon.getUserInfo();
      // selectedPage = 0;
      // _homeController.pageController = PageController(initialPage: 0);
      // await _homeController.callStartAnimation();
      await _mapController.getLocalAddress();
      await _mapController.getCurrentAddress();
      await _postPropertyCon.getAccessories(showLoading: false);
    } catch (_) {
      rethrow;
    } finally {}
    // _pageController = PageController(initialPage: selectedPage);
  }

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
                buildLocation(context),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _onRefresh();
              },
              child: CustomScrollView(
                // physics: const ClampingScrollPhysics(),
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

                        ///---------------------------------------------------------
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
                            homeController: _homeController,
                            loading: _homeController.loadingPopular.value,
                            popularList: _homeController
                                .popularPropertyData.value.propertyList,
                          ),
                        ),
                        const SizedBox(height: AppConstant.padding),

                        ///Recommend
                        Obx(
                          () => CustomPropertyGrid(
                            isGrid: true,
                            title: 'Recommend'.tr,
                            actionTitle: 'See All'.tr,
                            loading: _homeController.isLoadAllProperty.value,
                            onAction: () {
                              const AllProperty();
                            },
                            propertyList:
                                _homeController.propertyData.value.propertyList,
                            onFavorit: (int id, int index) async {
                              _homeController.propertyData.value
                                      .propertyList[index].favorite =
                                  !_homeController.propertyData.value
                                      .propertyList[index].favorite;
                              setState(() {});
                              await _propertyController.onFavorit(
                                  propertyId: '$id');
                            },
                          ),
                        ),
                        SafeArea(top: false, child: 40.gap)
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
}

Widget buildLocation(
  BuildContext context,
) {
  final mapController = Get.put(GMapController());
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
                  () => mapController.currentAddress.value == ""
                      ? const SizedBox()
                      : Text(
                          mapController.currentAddress.value,
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
