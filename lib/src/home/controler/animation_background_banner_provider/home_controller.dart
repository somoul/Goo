import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/enum/storage_key.dart';

import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';
import 'package:goo_rent/helper/local_storage.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';

import '../../data/slide_categorie_model/slide_categorie_model.dart';
import '../../data/slider_ banners_model/slide_model.dart';

class HomeController extends GetxController {
  final apiHelper = ApiHelper();
  int _currentPage = 0;
  int get index => _currentPage;
  bool _checkIsBiggerThan = true;
  late PageController pageController;

  var indexSlider = 0.obs;

  var textLocationHome = "".obs;
  var textServiceHome = "".obs;
  var textPriceHome = "".obs;

  var textLocationBusiness = "".obs;
  var textServiceBusiness = "".obs;
  var textPriceBusiness = "".obs;

  //
  double startSlider = 0.0;
  double endSlider = 100.0;

  ///Function  get data on  Banners
  // final isLoading = false.obs;
  final isfetchLoadingBanner = false.obs;
  final slideModel = const SlideModel().obs;
  // final slideList = <SlideModel>[].obs;
  final sideBarData = const SlideModel().obs;

  //
  final loadSlide = false.obs;
  final listSideBarData = <SlideModel>[].obs;
  var homeslideList = <String>[].obs;

  Future<List<SlideModel>> fetchSlideBanner() async {
    loadingCategory(true);
    loadSlide(true);
    loadingPopular(true);
    isLoadAllProperty(true);
    try {
      await apiHelper
          .onRequest(
              isAuthorize: true,
              methode: METHODE.get,
              url: '/banners',
              whenRequestFailed: () async {
                var data = await LocalStorage.get(StorageKeys.banner);
                if (data != null) {
                  data.map((element) {
                    listSideBarData.add(SlideModel.fromJson(element));
                  }).toList();
                  listSideBarData.map((element) {
                    homeslideList.add(element.imageUrl!);
                  }).toList();
                }
              })
          .then((response) async {
        var jsonData = response['data'];
        listSideBarData.clear();
        homeslideList.clear();
        jsonData.map((json) {
          sideBarData.value = SlideModel.fromJson(json);
          listSideBarData.add(sideBarData.value);
        }).toList();
        listSideBarData.map((element) {
          homeslideList.add(element.imageUrl!);
        }).toList();
        await LocalStorage.put(
            storageKey: StorageKeys.banner, value: listSideBarData);
      }).onError((ErrorModel error, stackTrace) async {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
    } finally {
      loadSlide(false);
    }
    return listSideBarData;
  }

  ///Click banner
  Future onClickBanner(int id) async {
    await apiHelper
        .onRequest(
            isAuthorize: true, url: "/banners/click/$id", methode: METHODE.get)
        .onError((ErrorModel error, stackTrace) {
      BaseToast.showErorrBaseToast('${error.bodyString['message']}');
    });
  }

  ///

  final propertyData = PropertyModelResponse().obs;
  final isLoadAllProperty = false.obs;
  Future<void> getAllProperties({
    required String late,
    required String long,
    int? pageNumber,
  }) async {
    try {
      await apiHelper
          .onRequest(
              url: '/posts?around=212.22&long=104.862920&lat=11.587222&page=1',
              methode: METHODE.get,
              isAuthorize: true,
              whenRequestFailed: () async {
                var data = await LocalStorage.get(StorageKeys.recommend);
                if (data != null) {
                  propertyData.value = PropertyModelResponse.fromJson(data);
                }
              })
          .then((value) async {
        propertyData.value = PropertyModelResponse.fromJson(value['data']);
        await LocalStorage.put(
            storageKey: StorageKeys.recommend, value: propertyData.value);
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
    } finally {
      isLoadAllProperty(false);
    }
  }
  // /posts/recomment?lang=kh&lat=11.587222&long=104.862920

  ///Function  get data on  Categorie
  final loadingCategory = false.obs;
  final sideBarDataCategorie = const SlideCategorieModel().obs;
  final listSideBarDataCategorie = <SlideCategorieModel>[].obs;
  Future<List<SlideCategorieModel>> fetchSliderCategorie() async {
    try {
      await apiHelper
          .onRequest(
              isAuthorize: true,
              url: "/categories",
              methode: METHODE.get,
              whenRequestFailed: () async {
                var data = await LocalStorage.get(StorageKeys.categories);
                if (data != null) {
                  data.map((element) {
                    listSideBarDataCategorie
                        .add(SlideCategorieModel.fromJson(element));
                  }).toList();
                }
              })
          .then((response) async {
        var jsonData = response['data'];
        listSideBarDataCategorie.clear();
        jsonData.map((json) {
          listSideBarDataCategorie.add(SlideCategorieModel.fromJson(json));
        }).toList();
        await LocalStorage.put(
            storageKey: StorageKeys.categories,
            value: listSideBarDataCategorie);
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
    } finally {
      loadingCategory(false);
    }
    return listSideBarDataCategorie;
  }

  ///
  final loadingPopular = false.obs;
  final popularPropertyData = PropertyModelResponse().obs;
  Future<void> getPopularProperty({
    required double late,
    required double long,
  }) async {
    try {
      await apiHelper
          .onRequest(
              url: '/posts/popular?lat=11.587222&long=104.862920',
              methode: METHODE.get,
              isAuthorize: true)
          .then((value) async {
        popularPropertyData.value = PropertyModelResponse.fromJson(value);
      });
    } catch (_) {
      // BaseToast.showErorrBaseToast(e.toString());
    } finally {
      loadingPopular(false);
    }
  }

  callStartAnimation() async {
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      Timer(const Duration(seconds: 3), () {
        if (_checkIsBiggerThan) {
          _currentPage++;
          if (_currentPage > 4) {
            _checkIsBiggerThan = false;
          }
        } else {
          _currentPage--;
          if (_currentPage < 1) {
            _checkIsBiggerThan = true;
          }
        }
        update();
      });
    });
  } //Business
// use on bottomSheet Search
  //

  @override
  void onInit() {
    // fetchSlideBanner();
    // fetchSliderCategorie();
    super.onInit();
  }
}
