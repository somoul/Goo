import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/custom_button.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid.dart';
import 'package:goo_rent/utils/extension/widget.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  final _propCon = Get.put(PropertyController());

  final ScrollController _scrollController = ScrollController();
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollListener();
    });
    postFrameCallback(() async {
      await _propCon.getFavoriteList(requestPage: 1);
    });
  }

  Future _onRefresh() async {
    setState(() {
      _isRefreshing = true;
    });
    await _propCon.getFavoriteList(requestPage: 1);
    setState(() {
      _isRefreshing = false;
    });
  }

  _scrollListener() async {
    if (_isRefreshing ||
        _propCon.useCacheDataFavorite.value ||
        _propCon.isEndOfFavorite.value) {
      return;
    }
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      await _propCon.getFavoriteList(
          requestPage: _propCon.nexPageFavorite.value);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        title: Text('Favorite'.tr),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _onRefresh();
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Obx(
                      () => CustomPropertyGrid(
                        loading: _propCon.isFirstLoadFavorite.value,
                        propertyList: _propCon.favoriteList,
                        loadingLength: 6,
                        onFavorit: _onFavorite,
                      ),
                    ),
                    Obx(
                      () => !_propCon.isEndOfFavorite.value
                          ? _propCon.favoriteList.length < 10
                              ? const SizedBox()
                              : Center(
                                  child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Platform.isAndroid
                                      ? const CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ).p(10)
                                      : const CupertinoActivityIndicator(),
                                )).pb(15)
                          : Text("No more data".tr).pb(15),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onFavorite(int id, index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        actionsPadding: const EdgeInsets.all(15),
        title: Text(
          'Remove'.tr,
          style: AppText.titleMedium,
        ),
        content: Text(
          'Are you sure to remove this item from save?'.tr.tr,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          const SizedBox(height: 10),
          SizedBox(
            height: 35,
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: 75,
                  child: CustomButton(
                    title: 'Cancel'.tr,
                    isOutline: true,
                    onPressed: () => Get.back(),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: 80,
                  child: CustomButton(
                    title: 'Ok'.tr,
                    onPressed: () async {
                      _propCon.favoriteList.removeAt(index);
                      setState(() {});
                      Get.back();
                      await _propCon.onFavorit(propertyId: id.toString());
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
