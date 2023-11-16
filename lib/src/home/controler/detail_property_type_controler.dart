import 'package:get/get.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/src/favorite/data/property_detail.dart';

class DetailController extends GetxController {
  final apiHelper = ApiHelper();
  var indexImage = 0.obs;

  ///------------------------------------------------------
  final propertyDetail = PropertyModel().obs;
  final isLoading = false.obs;
  Future<void> getDetail({
    required int id,
  }) async {
    isLoading(true);
    try {
      await apiHelper
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
    } finally {
      isLoading(false);
    }
  }
}
