import 'package:get/get.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/property_detail/data/popular_property.dart';

class PropertyController extends GetxController {
  final _apiHelper = ApiHelper();

  ///Save favorite
  final favoriteModel = PropertyModelResponse().obs;
  final favoriteData = PopularPropertyModelResponse().obs;

  bool get isEmptyFavorite => favoriteData.value.data?.isEmpty ?? true;

  ////Favorite
  final isLoadFavorite = true.obs;
  Future<void> getFavoriteList() async {
    try {
      await _apiHelper
          .onRequest(
              url: '/get-save-post', methode: METHODE.get, isAuthorize: true)
          .then((value) async {
        favoriteData.value =
            PopularPropertyModelResponse.fromJson(value['data']);
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
}
