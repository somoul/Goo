import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/enum/storage_key.dart';

import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';
import 'package:goo_rent/helper/local_storage.dart';

import '../../data/slide_categorie_model/slide_categorie_model.dart';
import '../../data/slider_ banners_model/slide_model.dart';

class HomeController extends GetxController {
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
  final listSideBarData = <SlideModel>[].obs;
  final apiHelper = ApiHelper();

  Future<List<SlideModel>> fetchSlideBanner() async {
    // var list = await LocalStorage.get<List<SlideModel>>(StorageKeys.banner);
    // print('LIST : $list');
    // if (list?.isNotEmpty ?? false) {
    //   // list!.map((e) {
    //   //   listSideBarData.add(e);
    //   // });
    // }
    await apiHelper
        .onRequest(
      isAuthorize: true,
      methode: METHODE.get,
      url: '/banners',
    )
        .then((response) async {
      var jsonData = response['data'];
      listSideBarData.clear();
      jsonData.map((json) {
        sideBarData.value = SlideModel.fromJson(json);
        listSideBarData.add(sideBarData.value);
      }).toList();
      await LocalStorage.put(
          storageKey: StorageKeys.banner, value: listSideBarData);
    }).onError((ErrorModel error, stackTrace) {
      BaseToast.showErorrBaseToast('${error.bodyString['message']}');
    });
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

  ///Function  get data on  Categorie
  final isfetchLoadingCategorie = false.obs;
  final sideBarDataCategorie = const SlideCategorieModel().obs;
  final listSideBarDataCategorie = <SlideCategorieModel>[].obs;
  Future<List<SlideCategorieModel>> fetchSliderCategorie() async {
    isfetchLoadingCategorie(true);

    try {
      await apiHelper
          .onRequest(
        isAuthorize: true,
        url: "/categories",
        methode: METHODE.get,
      )
          .then((response) {
        var jsonData = response['data'];
        listSideBarDataCategorie.clear();
        jsonData.map((json) {
          sideBarDataCategorie.value = SlideCategorieModel.fromJson(json);
          listSideBarDataCategorie.add(sideBarDataCategorie.value);
        }).toList();
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
    } finally {
      isfetchLoadingCategorie(false);
    }
    return listSideBarDataCategorie;
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
