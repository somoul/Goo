import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';

import '../../data/slide_categorie_model/slide_categorie_model.dart';
import '../../data/slider_ banners_model/slide_model.dart';

class HomeController extends GetxController {
  int _currentPage = 0;
  int get index => _currentPage;
  bool _checkIsBiggerThan = true;
  late PageController pageController;

  var indexSlider = 0.obs;

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
    isfetchLoadingBanner(true);
    await apiHelper
        .onRequest(
      isAuthorize: false, methode: METHODE.get, url: "/banners",
      // isAuthorize: false,
      // url: "banners",
      // methode: METHODE.get,
    )
        .then((response) {
      var jsonData = response['data'];
      jsonData.map((json) {
        sideBarData.value = SlideModel.fromJson(json);
        listSideBarData.add(sideBarData.value);
        //debugPrint("Slide list:${listSideBarData[1].title}");
      }).toList();
      // isfetchLoadingBanner(false);
    }).onError((ErrorModel error, stackTrace) {
      // isfetchLoadingBanner(false);
    });
    return listSideBarData;
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
        isAuthorize: false,
        url: "/categories",
        methode: METHODE.get,
      )
          .then((response) {
        var jsonData = response['data'];
        jsonData.map((json) {
          sideBarDataCategorie.value = SlideCategorieModel.fromJson(json);
          listSideBarDataCategorie.add(sideBarDataCategorie.value);
        }).toList();
      }).onError((ErrorModel error, stackTrace) {});
    } catch (_) {
    } finally {
      isfetchLoadingCategorie(false);
    }
    return listSideBarDataCategorie;
  }

  @override
  void onInit() {
    // fetchSlideBanner();
    // fetchSliderCategorie();
    super.onInit();
  }
}
