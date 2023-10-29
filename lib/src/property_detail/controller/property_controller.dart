import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';
import 'package:goo_rent/cores/utils/loading_dialoge.dart';
import 'package:goo_rent/cores/utils/loading_helper.dart';
import 'package:goo_rent/src/property_detail/data/popular_property.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';

class PropertyController extends GetxController {
  final _apiHelper = ApiHelper();
  final propertyData = PropertyModelResponse().obs;
  final popularPropertyData = PopularPropertyModelResponse().obs;

  ///
  final favoriteModel = PropertyModelResponse().obs;
  final favoriteData = PopularPropertyModelResponse().obs;

  bool get isEmptyFavorite => favoriteData.value.data?.isEmpty ?? true;

  String get _langCode => Get.locale?.languageCode ?? 'kh';

  ///
  final isLoadAllProperty = true.obs;
  Future<void> getAllProperties({
    required double late,
    required double long,
    int? pageNumber,
  }) async {
    var lang = Get.locale?.languageCode;
    try {
      await _apiHelper
          .onRequest(
              url:
                  '/posts?lang=$lang&around=212.22&long=104.862920&lat=11.587222&page=1',
              methode: METHODE.get,
              isAuthorize: true)
          .then((value) async {
        propertyData.value = PropertyModelResponse.fromJson(value['data']);
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
    } finally {
      isLoadAllProperty(false);
      BaseDialogLoading.dismiss();
    }
  }

  Future<void> getPopularProperty({
    required double late,
    required double long,
  }) async {
    var lang = Get.locale?.languageCode;
    try {
      await _apiHelper
          .onRequest(
              url: '/posts/popular?lat=11.587222&long=104.862920&$lang',
              methode: METHODE.get,
              isAuthorize: true)
          .then((value) async {
        popularPropertyData.value =
            PopularPropertyModelResponse.fromJson(value);
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (e) {
      BaseToast.showErorrBaseToast(e.toString());
    } finally {
      isLoadAllProperty(false);
      BaseDialogLoading.dismiss();
    }
  }

  ////Favorite
  final isLoadFavorite = true.obs;
  Future<void> getFavoriteList() async {
    try {
      await _apiHelper
          .onRequest(
              url: '/get-save-post?lang=$_langCode',
              methode: METHODE.get,
              isAuthorize: true)
          .then((value) async {
        favoriteData.value =
            PopularPropertyModelResponse.fromJson(value['data']);
        print('object_______s____________>>>>> ${favoriteData.value}');
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
