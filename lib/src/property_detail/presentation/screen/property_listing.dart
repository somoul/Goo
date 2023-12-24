import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/src/home/presentation/controller/map_controller.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

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
  // final _homeCon = Get.put(HomeController());
  final _mapController = Get.put(GMapController());
  final _propCon = Get.put(PropertyController());
  final homeController = Get.put(HomeController());
  final searchController = Get.put(SearchTypeRentController());
  //  MotionTabController? _tabController;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
// _controller = TabController(vsync: this, length: 3);

    _scrollController.addListener(() {
      _scrollListener();
    });
    postFrameCallback(() async {
      _onRefresh();
    });
    postFrameCallback(() {
      _propCon.filterPropertyYype.value =
          homeController.listPropertySideBarDataCategorie[0].name ?? "";
      homeController.listPropertySideBarDataCategorie
          .addAll(homeController.listSideBarDataCategorie);
    });

    print("======= show data detal :${_propCon.propertyList}");
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
        await _propCon.getPropertyListing(
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
                  const Spacer(),
                  Text(
                    'All Properies'.tr,
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
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: DefaultTabController(
                          length: homeController
                              .listPropertySideBarDataCategorie.length,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  constraints:
                                      const BoxConstraints.expand(height: 50),
                                  child: TabBar(
                                      onTap: (int index) {
                                        print(
                                            "====== show data tapbar : $index===========");
                                        _propCon.propertyList.clear();
                                        _propCon.filterPropertyYype
                                            .value = homeController
                                                .listPropertySideBarDataCategorie[
                                                    index]
                                                .name ??
                                            "";
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
                                child: Container(
                                  child: _propCon.isFirstLoad.value
                                      ? Center(
                                          child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Platform.isAndroid
                                              ? const CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                ).p(10)
                                              : const CupertinoActivityIndicator(),
                                        )).pb(15)
                                      : TabBarView(
                                          children: homeController
                                              .listPropertySideBarDataCategorie
                                              .map((e) {
                                          return _propCon.isFirstLoad.value
                                              ? SingleChildScrollView(
                                                  child: CustomPropertyGrid(
                                                    actionTitle: null,
                                                    title: null,
                                                    loading: true,
                                                    loadingLength: 8,
                                                    propertyList:
                                                        _propCon.propertyList,
                                                    onFavorit: (_, __) {},
                                                  ),
                                                )
                                              : _propCon.propertyList.isNotEmpty
                                                  ? RefreshIndicator(
                                                      onRefresh: _onRefresh,
                                                      child:
                                                          SingleChildScrollView(
                                                        controller:
                                                            _scrollController,
                                                        padding:
                                                            EdgeInsets.only(
                                                          bottom: MediaQuery.of(
                                                                      context)
                                                                  .padding
                                                                  .bottom +
                                                              15,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            CustomPropertyGrid(
                                                              isGrid: _propCon
                                                                  .isGridProperty
                                                                  .value,
                                                              actionTitle: null,
                                                              title: null,
                                                              propertyList: _propCon
                                                                  .propertyList,
                                                              onFavorit: (id,
                                                                  index) async {
                                                                _propCon
                                                                        .propertyList[
                                                                            index]
                                                                        .favorite =
                                                                    !_propCon
                                                                        .propertyList[
                                                                            index]
                                                                        .favorite;
                                                                setState(() {});
                                                                await _propCon
                                                                    .onFavorit(
                                                                        propertyId:
                                                                            '$id');
                                                              },
                                                            ),
                                                            if (!_propCon
                                                                .isEndOfData
                                                                .value)
                                                              Center(
                                                                  child:
                                                                      SizedBox(
                                                                height: 50,
                                                                width: 50,
                                                                child: Platform
                                                                        .isAndroid
                                                                    ? const CircularProgressIndicator(
                                                                        strokeWidth:
                                                                            2,
                                                                      ).p(10)
                                                                    : const CupertinoActivityIndicator(),
                                                              )).pb(15)
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : const NullPropertyContain();
                                        }).toList()),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : _propCon.propertyList.isNotEmpty
                      ? RefreshIndicator(
                          onRefresh: _onRefresh,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 15,
                            ),
                            child: Column(
                              children: [
                                CustomPropertyGrid(
                                  isGrid: _propCon.isGridProperty.value,
                                  actionTitle: null,
                                  title: null,
                                  propertyList: _propCon.propertyList,
                                  onFavorit: (id, index) async {
                                    _propCon.propertyList[index].favorite =
                                        !_propCon.propertyList[index].favorite;
                                    setState(() {});
                                    await _propCon.onFavorit(propertyId: '$id');
                                  },
                                ),
                                if (!_propCon.isEndOfData.value)
                                  Center(
                                      child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Platform.isAndroid
                                        ? const CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ).p(10)
                                        : const CupertinoActivityIndicator(),
                                  )).pb(15)
                              ],
                            ),
                          ),
                        )
                      : const NullPropertyContain(),
            ],
          ),
        ),
      ),
    );
  }
}
