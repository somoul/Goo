import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/src/home/presentation/controller/map_controller.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/utils/extension/num.dart';
import '../../../../constant/app_constant.dart';
import '../../../../constant/app_text.dart';
import '../../../home/controler/animation_background_banner_provider/home_controller.dart';
import '../../../home/controler/search_type_rent_controler/search_controler.dart';
import '../../../home/screen/home_screen.dart';
import '../../../home/screen/search_type_screen.dart';
import '../widget/custom_property_grid.dart';

class AllProperty extends StatefulWidget {
  const AllProperty({super.key});

  @override
  State<AllProperty> createState() => _AllPropertyState();
}

class _AllPropertyState extends State<AllProperty> {
  final _mapController = Get.put(GMapController());
  final _propCon = Get.put(PropertyController());
  final homeController = Get.put(HomeController());
  final searchController = Get.put(SearchTypeRentController());

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      _scrollListener();
    });
    postFrameCallback(() async {
      _onRefresh();
    });

    postFrameCallback(() {
      if (searchController.isSearchProperty.value == false) {
        _propCon.filterPropertyYype.value =
            homeController.listPropertySideBarDataCategorie[0].id!;
        homeController.listPropertySideBarDataCategorie
            .addAll(homeController.listSideBarDataCategorie);
      }
    });
  }

  Future _onRefresh() async {
    await _propCon.getPropertyListing(
      late: _mapController.addressModel.value.lattitude ?? '',
      long: _mapController.addressModel.value.longitude ?? '',
      typeProperty: _propCon.filterPropertyYype.value,
      minPrice: "${searchController.startSlider.value}",
      maxPrice: "${searchController.endSlider.value}",
      //.toString(),
      requestPage: 1,
    );
  }

  _scrollListener() async {
    if (_propCon.isEndOfData.value || _propCon.useCacheData.value) {
      return;
    }
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (_propCon.useCacheData.value == false) {
        _propCon.getPropertyListing(
          late: _mapController.addressModel.value.lattitude ?? '',
          long: _mapController.addressModel.value.longitude ?? '',
          typeProperty: _propCon.filterPropertyYype.value,
          minPrice: "${searchController.startSlider.value}",
          maxPrice: "${searchController.endSlider.value}",
          requestPage: _propCon.nextPage.value,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final heightContain = MediaQuery.of(context).size.height / 4;
    final widthContain = MediaQuery.of(context).size.width / 3;
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Obx(
          () => Column(
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
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: SvgPicture.asset(
                      'assets/image/arrow_back.svg',
                      width: 15,
                      height: 15,
                    ),
                  ),
                  Text(
                    'All Properies'.tr,
                    textAlign: TextAlign.left,
                    style: AppText.bodyMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Container(
                    height: 35,
                    width: 100,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.04),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              if (_propCon.isGridProperty.value) {
                                _propCon.isGridProperty.value = false;
                              } else {
                                _propCon.isGridProperty.value = true;
                              }
                            },
                            child: _propCon.isGridProperty.value
                                ? const Icon(Icons.grid_view)
                                : const Icon(Icons.splitscreen)),
                        const Spacer(),
                        const Spacer(),
                        const Icon(Icons.format_line_spacing),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
              searchController.isSearchProperty.value == false
                  ? Expanded(
                      child: DefaultTabController(
                        length: homeController
                            .listPropertySideBarDataCategorie.length,
                        child: Column(
                          children: <Widget>[
                            Container(
                                constraints:
                                    const BoxConstraints.expand(height: 37),
                                child: TabBar(
                                    automaticIndicatorColorAdjustment: true,
                                    dividerColor: const Color(0xffEAEAEA),
                                    onTap: (int index) {
                                      _propCon.propertyList.clear();
                                      _propCon.filterPropertyYype
                                          .value = homeController
                                              .listPropertySideBarDataCategorie[
                                                  index]
                                              .id ??
                                          0;

                                      _onRefresh();
                                      _propCon.isFirstLoad.value = true;

                                      Timer(const Duration(seconds: 10), () {
                                        _propCon.isFirstLoad.value = false;
                                      });
                                    },
                                    isScrollable: true,
                                    tabs: homeController
                                        .listPropertySideBarDataCategorie
                                        .map(
                                          (e) => Tab(
                                            child: Text(
                                              "${e.name}",
                                              style: AppText.bodyMedium!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                        )
                                        .toList())),
                            Expanded(
                                child: Stack(
                              children: [
                                RefreshIndicator(
                                  onRefresh: _onRefresh,
                                  child: SingleChildScrollView(
                                    controller: _scrollController,
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                              .padding
                                              .bottom +
                                          15,
                                    ),
                                    child: Stack(
                                      children: [
                                        _propCon.propertyList.isNotEmpty &&
                                                _propCon.propertyList.length !=
                                                    1
                                            ? CustomPropertyGrid(
                                                loading:
                                                    _propCon.isFirstLoad.value,
                                                isGrid: _propCon
                                                    .isGridProperty.value,
                                                actionTitle: null,
                                                title: null,
                                                propertyList:
                                                    _propCon.propertyList,
                                                onFavorit: (id, index) async {
                                                  // _propCon.propertyList[index]
                                                  //         .favorite =
                                                  //     !_propCon
                                                  //         .propertyList[index]
                                                  //         .favorite;
                                                  setState(() {
                                                    homeController.onFavorit(
                                                      propertyId: id.toString(),
                                                    );
                                                  });
                                                  // await _propCon.onFavorit(
                                                  //     propertyId: '$id');
                                                },
                                              )
                                            : const Positioned(
                                                child: Center(
                                                  heightFactor: 10,
                                                  child: SizedBox(
                                                    height: 200,
                                                    width: 100,
                                                  ),
                                                ),
                                              ),
                                        _propCon.propertyList.isNotEmpty &&
                                                _propCon.propertyList.length ==
                                                    1
                                            ? CustomPropertyGrid(
                                                loading:
                                                    _propCon.isFirstLoad.value,
                                                isGrid: _propCon
                                                    .isGridProperty.value,
                                                actionTitle: null,
                                                title: null,
                                                propertyList:
                                                    _propCon.propertyList,
                                                onFavorit: (id, index) async {
                                                  // _propCon.propertyList[index]
                                                  //         .favorite =
                                                  // !_propCon
                                                  //     .propertyList[index]
                                                  //     .favorite;
                                                  setState(() {
                                                    homeController.onFavorit(
                                                      propertyId: id.toString(),
                                                    );
                                                  });
                                                  // await _propCon.onFavorit(
                                                  //     propertyId: '$id');
                                                },
                                              )
                                            : const Center()
                                      ],
                                    ),
                                  ),
                                ),
                                // _propCon.isFirstLoad.value
                                //     ? Center(
                                //         child: SizedBox(
                                //         height: 50,
                                //         width: 50,
                                //         child: Platform.isAndroid
                                //             ? const CircularProgressIndicator(
                                //                 strokeWidth: 2,
                                //               ).p(10)
                                //             : const CupertinoActivityIndicator(),
                                //       )).pb(15)
                                //     : Container(),
                                if (_propCon.propertyList.isEmpty &&
                                    !_propCon.isFirstLoad.value)
                                  Positioned(
                                      top: heightContain,
                                      left: widthContain,
                                      child: const Center(
                                          child: NullPropertyContain()))
                              ],
                            )),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Stack(
                      children: [
                        RefreshIndicator(
                          onRefresh: _onRefresh,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 15,
                            ),
                            child: Stack(
                              children: [
                                _propCon.propertyList.isNotEmpty &&
                                        _propCon.propertyList.length != 1
                                    ? CustomPropertyGrid(
                                        loading: _propCon.isFirstLoad.value,
                                        isGrid: _propCon.isGridProperty.value,
                                        actionTitle: null,
                                        title: null,
                                        propertyList: _propCon.propertyList,
                                        onFavorit: (id, index) async {
                                          // _propCon.propertyList[index]
                                          //         .favorite =
                                          //     !_propCon
                                          //         .propertyList[index]
                                          //         .favorite;
                                          setState(() {
                                            homeController.onFavorit(
                                              propertyId: id.toString(),
                                            );
                                          });
                                          // await _propCon.onFavorit(
                                          //     propertyId: '$id');
                                        },
                                      )
                                    : const Positioned(
                                        child: Center(
                                          heightFactor: 10,
                                          child: SizedBox(
                                            height: 200,
                                            width: 100,
                                          ),
                                        ),
                                      ),
                                _propCon.propertyList.isNotEmpty &&
                                        _propCon.propertyList.length == 1
                                    ? CustomPropertyGrid(
                                        loading: _propCon.isFirstLoad.value,
                                        isGrid: _propCon.isGridProperty.value,
                                        actionTitle: null,
                                        title: null,
                                        propertyList: _propCon.propertyList,
                                        onFavorit: (id, index) async {
                                          // _propCon.propertyList[index]
                                          //         .favorite =
                                          // !_propCon
                                          //     .propertyList[index]
                                          //     .favorite;
                                          setState(() {
                                            homeController.onFavorit(
                                              propertyId: id.toString(),
                                            );
                                          });
                                          // await _propCon.onFavorit(
                                          //     propertyId: '$id');
                                        },
                                      )
                                    : const Center()
                              ],
                            ),
                          ),
                        ),
                        // _propCon.isFirstLoad.value
                        //     ? Center(
                        //         child: SizedBox(
                        //         height: 50,
                        //         width: 50,
                        //         child: Platform.isAndroid
                        //             ? const CircularProgressIndicator(
                        //                 strokeWidth: 2,
                        //               ).p(10)
                        //             : const CupertinoActivityIndicator(),
                        //       )).pb(15)
                        //     : Container(),
                        if (_propCon.propertyList.isEmpty &&
                            !_propCon.isFirstLoad.value)
                          Positioned(
                              top: heightContain,
                              left: widthContain,
                              child: const Center(child: NullPropertyContain()))
                      ],
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
