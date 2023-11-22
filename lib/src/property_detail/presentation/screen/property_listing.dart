import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/src/home/presentation/controller/map_controller.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid.dart';
import 'package:goo_rent/utils/extension/widget.dart';

class AllProperty extends StatefulWidget {
  const AllProperty({super.key});

  @override
  State<AllProperty> createState() => _AllPropertyState();
}

class _AllPropertyState extends State<AllProperty> {
  // final _homeCon = Get.put(HomeController());
  final _mapController = Get.put(GMapController());
  final _propCon = Get.put(PropertyController());
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
  }

  Future _onRefresh() async {
    await _propCon.getPropertyListing(
      late: _mapController.addressModel.value.lattitude ?? '',
      long: _mapController.addressModel.value.longitude ?? '',
      requestPage: 1,
    );
  }

  _scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (_propCon.useCacheData.value == false) {
        await _propCon.getPropertyListing(
          late: _mapController.addressModel.value.lattitude ?? '',
          long: _mapController.addressModel.value.longitude ?? '',
          requestPage: _propCon.nextPage.value,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            'assets/image/arrow_back.svg',
            width: 15,
            height: 15,
          ),
        ),
        // centerTitle: false,
        title: Text(
          'All Properies'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/image/search.svg'),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Obx(
          () => _propCon.isFirstLoad.value
              ? SingleChildScrollView(
                  child: CustomPropertyGrid(
                    actionTitle: null,
                    title: null,
                    loading: true,
                    loadingLength: 8,
                    loadingMore: _propCon.loadMore,
                    propertyList: _propCon.propertyList,
                    propertyController: PropertyController(),
                  ),
                )
              : _propCon.propertyList.isNotEmpty
                  ? RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom + 15,
                        ),
                        child: Column(
                          children: [
                            CustomPropertyGrid(
                              actionTitle: null,
                              title: null,
                              loadingMore: _propCon.loadMore,
                              propertyList: _propCon.propertyList,
                              propertyController: PropertyController(),
                            ),
                            if (_propCon.loadMore)
                              Center(
                                  child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Platform.isAndroid
                                    ? const CircularProgressIndicator()
                                    : const CupertinoActivityIndicator(),
                              )).pb(15),
                            if (_propCon.isEndOfData.value)
                              const Text("No more data"),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        "No Data".tr,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
        ),
      ),
    );
  }
}
