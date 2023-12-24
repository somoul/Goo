import 'package:get/get.dart';
import 'package:goo_rent/enum/storage_key.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/helper/local_storage.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/widgets/network/network_status_builder.dart';

class PropertyController extends GetxController {
  final _apiHelper = ApiHelper();

  ///Save favorite
  // final favoriteModel = PropertyModelResponse().obs;
  // final favoriteData = PopularPropertyModelResponse().obs;

  // final favoriteData = PropertyModelResponse().obs;
  // bool get isEmptyFavorite => favoriteData.value.propertyList.isEmpty;

  ///------------------------------------------------------------
  ////Favorite
  final favoriteList = <PropertyModel>[].obs;
  final isFirstLoadFavorite = false.obs;
  final nexPageFavorite = 0.obs;
  final isEndOfFavorite = false.obs;
  final useCacheDataFavorite = false.obs;
  Future<void> getFavoriteList({int requestPage = 1}) async {
    if (requestPage == 1) {
      isFirstLoadFavorite(true);
      nexPageFavorite.value = 0;
    }
    debugPrint('Get favorite list');
    try {
      await _apiHelper
          .onRequest(
              url: '/get-save-post?page=$requestPage',
              methode: METHODE.get,
              isAuthorize: true,
              whenRequestFailed: () async {
                try {
                  var data = await LocalStorage.get(StorageKeys.favorite);
                  if (data != null) {
                    data.map((element) {
                      propertyList.add(PropertyModel.fromJson(element));
                    }).toList();
                  }
                  useCacheDataFavorite.value = true;
                } catch (_) {}
              })
          .then((response) async {
        if (useCacheDataFavorite.value) {
          useCacheDataFavorite.value = false;
        }
        if (requestPage == 1 && (favoriteList.isNotEmpty)) {
          favoriteList.clear();
        }
        var tempData = PropertyModelResponse.fromJson(response['data']);
        if (tempData.propertyList.isNotEmpty) {
          debugPrint(".....Has data");
          tempData.propertyList.map((element) {
            favoriteList.add(element);
          }).toList();
        }
        isFirstLoadFavorite(false);
        isEndOfFavorite.value = tempData.nextPageUrl == null;
        if (!isEndOfFavorite.value) {
          nexPageFavorite.value = requestPage + 1;
        } else {}

        ///Save to catche
        await LocalStorage.put(
            storageKey: StorageKeys.favorite, value: favoriteList);
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
      isFirstLoadFavorite(false);
      rethrow;
    }
  }

  ///------------------------------------------------------------
  Future<bool> onFavorit({required String propertyId}) async {
    try {
      BaseDialogLoading.show();
      debugPrint('On favorite...');
      var result = await _apiHelper
          .onRequest(
        url: '/save-post/$propertyId',
        methode: METHODE.post,
        isAuthorize: true,
      )
          .onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });

      if (result['code'] == 200) {
        debugPrint('...success');
        return true;
      }
    } catch (e) {
      BaseToast.showErorrBaseToast(e.toString());
    } finally {
      BaseDialogLoading.dismiss();
    }
    return false;
  }

  ///____________Get All Properties____________________________________________________________________

  final filterPropertyYype = "Room".obs;
  final propertyList = <PropertyModel>[].obs;
  final isEndOfData = false.obs;
  final isFirstLoad = false.obs;
  final nextPage = 0.obs;
  final useCacheData = false.obs;
  final isGridProperty = false.obs;

  Future<void> getPropertyListing({
    required String late,
    required String long,
    required String typeProperty,
    required String minPrice,
    required String maxPrice,
    int requestPage = 1,
  }) async {
    if (requestPage == 1) {
      isFirstLoad(true);
      nextPage.value = 0;
    }
    try {
      await _apiHelper
          .onRequest(
              url:
                  '/posts?lang=kh&long=$long&lat=$late&search=$typeProperty&min_price=$minPrice&max_price=$maxPrice',
              // '/posts?lang=kh&long=$long&lat=$late&search=$typeProperty&min_price=$minPrice&max_price=$maxPrice&page=$requestPage',
              //'/posts?long=$long&lat=$late&page=$requestPage',
              methode: METHODE.get,
              isAuthorize: true,
              whenRequestFailed: () async {
                try {
                  var data =
                      await LocalStorage.get(StorageKeys.propertyListing);
                  if (data != null) {
                    data.map((element) {
                      propertyList.add(PropertyModel.fromJson(element));
                    }).toList();
                  }
                  useCacheData.value = true;
                } catch (_) {
                  rethrow;
                }
                // BaseToast.showErorrBaseToast('Something went wrong'.tr);
              })
          .then((response) async {
        if (useCacheData.value) {
          useCacheData.value = false;
        }
        if (requestPage == 1 && (propertyList.isNotEmpty)) {
          propertyList.clear();
        }
        var tempData = PropertyModelResponse.fromJson(response['data']);

        if (tempData.propertyList.isNotEmpty) {
          tempData.propertyList.map((element) {
            propertyList.add(element);
          }).toList();
        }
        // print("====== show data 2345 :$propertyList");
        nextPage.value = requestPage + 1;
        isEndOfData.value = tempData.nextPageUrl == null;
        if (requestPage == 1) {
          isFirstLoad(false);
        }

        ///Save to catche
        await LocalStorage.put(
            storageKey: StorageKeys.propertyListing, value: propertyList);
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
      isFirstLoad(false);
      rethrow;
    }
  }
}
