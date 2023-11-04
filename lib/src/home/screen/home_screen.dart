import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/enum/storage_key.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/helper/local_storage.dart';
import 'package:goo_rent/src/home/data/slider_%20banners_model/slide_model.dart';
import 'package:goo_rent/src/home/presentation/controller/map_controller.dart';
import 'package:goo_rent/src/home/screen/detail_property_type/search_house_for_rent_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/widget/custom_banner_list_widget.dart';
import 'package:goo_rent/src/home/widget/custom_service_block.dart';
import 'package:goo_rent/src/profile/controller/profile_controller.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/presentation/screen/property_detail.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';

import '../controler/animation_background_banner_provider/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool _loading = true;

class _HomeScreenState extends State<HomeScreen> {
  late Animation<double> animation;
  final _homeController = Get.put(HomeController());
//
  late int selectedPage;
  // late final PageController _pageController;
  final pageCount = 5;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final CarouselController _controller = CarouselController();
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
    setState(() {
      _loading = true;
    });
    await _homeController.fetchSlideBanner();
    await _homeController.fetchSliderCategorie();
    await _propertyController.getPopularProperty(late: 1, long: 1);
    await _propertyController.getAllProperties(late: 1, long: 1);
    setState(() {
      _loading = false;
    });
  }

  _onInit() async {
    setState(() {
      _loading = true;
    });
    try {
      await _homeController.fetchSlideBanner();
      await _homeController.fetchSliderCategorie();
      await _propertyController.getPopularProperty(late: 1, long: 1);
      await _propertyController.getAllProperties(late: 1, long: 1);
      await _profileCon.getUserInfo();
      selectedPage = 0;
      _homeController.pageController = PageController(initialPage: 0);
      await _homeController.callStartAnimation();
      await _mapController.getCurrentAddress();
    } catch (_) {
    } finally {
      setState(() {
        _loading = false;
      });
    }

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
          AppConstant.kPrimaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            _buildLocation(),
            // FilledButton(
            //   onPressed: () async {
            //     // await LocalStorage.put(
            //     //     storageKey: StorageKeys.banner, value: '{"name":"Chenda"}');
            //   },
            //   child: const Text('Write'),
            // ),
            // FilledButton(
            //   onPressed: () async {
            //     var value = await LocalStorage.get<List<SlideModel>>(
            //         StorageKeys.banner);
            //     print('DATA LOCALE : $value');
            //   },
            //   child: const Text('Read'),
            // ),
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
                          Stack(
                            children: [
                              _buildSlider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10),
                                  ...imageSliders.map(
                                    (e) {
                                      int index = imageSliders.indexOf(e);
                                      return Container(
                                        height: 8.5,
                                        width: 8.5,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _homeController
                                                        .indexSlider.value ==
                                                    index
                                                ? AppConstant.kPrimaryColor
                                                : Colors.white),
                                      );
                                    },
                                  ).toList()
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          CustomCategoryBlock(
                            loading: _loading,
                            categoryList:
                                _homeController.listSideBarDataCategorie,
                          ),

                          /// Popular
                          Obx(
                            () => CustomPopularBlock(
                              loading: _loading,
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
                              loading: _loading,
                              onAction: () {
                                Get.to(() => const AllProperty());
                              },
                              propertyList: _propertyController
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
      ),
    );
  }

  Widget _serchBox() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const SearchRentScreen());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppConstant.kPrimaryColor.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(
                2.0,
                2.0,
              ),
            )
          ],
          border: Border.all(
              width: 2,
              color: _loading ? Colors.grey[100]! : AppConstant.kPrimaryColor),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            _loading
                ? ShimmerBox.wrap(
                    child: SvgPicture.asset('assets/image/search.svg'))
                : SvgPicture.asset('assets/image/search.svg'),
            const SizedBox(width: 10),
            _loading
                ? const ShimmerBox(
                    width: 150,
                  )
                : Text("Apartment for business".tr, style: AppText.bodySmall),
            if (_loading) const Spacer(),
            _loading
                ? const ShimmerBox()
                : Expanded(
                    child: Text("Search".tr,
                        textAlign: TextAlign.end,
                        style: AppText.bodySmall!
                            .copyWith(color: AppConstant.kPrimaryColor)),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _loading
            ? AspectRatio(
                aspectRatio: 2,
                child: Container(
                  color: AppConstant.kPrimaryColor.withOpacity(0.1),
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ))
            : CarouselSlider(
                items: _homeController.listSideBarData
                    .map(
                      (item) => GestureDetector(
                        onTap: () => _onClickBaner(item.id!),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child:
                                ImageBuilder(fit: BoxFit.cover, canView: true)
                                    .network(
                              item.imageUrl!,
                            )),
                      ),
                    )
                    .toList(),
                carouselController: _controller,
                options: CarouselOptions(
                  padEnds: false,
                  autoPlay: true,
                  enlargeFactor: 0,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 2,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _homeController.indexSlider.value = index;
                    });
                  },
                ),
              ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -22,
          child: _serchBox(),
        ),
      ],
    );
  }

  Widget _buildLocation() {
    return InkWell(
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
                        style: AppText.titleSmall!
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  Obx(
                    () => _mapController.currentAddress.value.provice == null
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
