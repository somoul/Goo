import 'package:get/get.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/src/favorite/data/property_detail.dart';

class DetailController extends GetxController {
  final _apiHelper = ApiHelper();
  var indexImage = 0.obs;

  ///----------------------------------------------------
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
      rethrow;
    } finally {
      BaseDialogLoading.dismiss();
    }
  }

  ///------------------------------------------------------
  final propertyDetail = PropertyModel().obs;
  final isLoading = false.obs;

  Future<void> getDetail({
    required int id,
  }) async {
    isLoading(true);
    try {
      await _apiHelper
          .onRequest(
              url: '/posts/$id',
              methode: METHODE.get,
              isAuthorize: true,
              whenRequestFailed: () async {
                // var data = await LocalStorage.get(StorageKeys.recommend);
                // if (data != null) {
                //   propertyData.value = PropertyModelResponse.fromJson(data);
                // }
              })
          .then(
        (value) async {
          propertyDetail.value = PropertyModel.fromJson(value['data']);
        },
      );
    } catch (_) {
      rethrow;
    } finally {
      Future.delayed(const Duration(milliseconds: 300), () {
        isLoading(false);
      });
    }
  }
}
