import 'package:get/get.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/widgets/network/network_status_builder.dart';

class PropertyController extends GetxController {
  final _apiHelper = ApiHelper();

  ///Save favorite
  // final favoriteModel = PropertyModelResponse().obs;
  // final favoriteData = PopularPropertyModelResponse().obs;

  final favoriteData = PropertyModelResponse().obs;
  bool get isEmptyFavorite => favoriteData.value.propertyList.isEmpty;

  ////Favorite
  final isLoadFavorite = true.obs;
  Future<void> getFavoriteList() async {
    try {
      await _apiHelper
          .onRequest(
              url: '/get-save-post', methode: METHODE.get, isAuthorize: true)
          .then((value) async {
        print("----------------------------->>>>>>  $value");
        favoriteData.value = PropertyModelResponse.fromJson(value['data']);
        print("----------------------------->>>>>>  $value");
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
    } finally {
      isLoadFavorite(false);
      BaseDialogLoading.dismiss();
    }
  }

  Future<void> onFavorit({required String propertyId}) async {
    try {
      await _apiHelper
          .onRequest(
            url: '/save-post/$propertyId',
            methode: METHODE.post,
            isAuthorize: true,
          )
          .then((value) async {})
          .onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (e) {
      BaseToast.showErorrBaseToast(e.toString());
    } finally {
      BaseDialogLoading.dismiss();
    }
  }

  ///____________Get All Properties____________________________________________________________________

  final propertyList = <PropertyModel>[].obs;
  final isEndOfData = false.obs;
  final isFirstLoad = false.obs;
  final _isLoadMore = false.obs;
  final nextPage = 0.obs;

  bool get loadMore => _isLoadMore.value && !isEndOfData.value;

  Future<void> getPropertyListing({
    required String late,
    required String long,
    int requestPage = 1,
  }) async {
    if (requestPage > 1) {
      _isLoadMore(true);
    } else {
      isFirstLoad(true);
      nextPage.value = 0;
    }
    try {
      // Future.delayed(const Duration(milliseconds: 300), () async {    // });
      await _apiHelper
          .onRequest(
              url: '/posts?long=$long&lat=$late&page=$requestPage',
              methode: METHODE.get,
              isAuthorize: true,
              whenRequestFailed: () async {
                // var data = await LocalStorage.get(StorageKeys.recommend);
                // if (data != null) {
                //   propertyData.value = PropertyModelResponse.fromJson(data);
                // }
              })
          .then((response) async {
        if (requestPage == 1 && (propertyList.isNotEmpty)) {
          propertyList.clear();
        }
        var tempData = PropertyModelResponse.fromJson(response['data']);
        if (tempData.propertyList.isNotEmpty) {
          tempData.propertyList.map((element) {
            propertyList.add(element);
          }).toList();
        }
        nextPage.value = requestPage + 1;
        isEndOfData.value = tempData.nextPageUrl == null;
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
      rethrow;
    } finally {
      isFirstLoad(false);
      _isLoadMore(false);
    }
  }
}
