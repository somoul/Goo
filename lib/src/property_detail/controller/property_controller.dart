import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';
import 'package:goo_rent/cores/utils/loading_dialoge.dart';
import 'package:goo_rent/cores/utils/loading_helper.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';

class PropertyController extends GetxController {
  final _apiHelper = ApiHelper();
  final propertyData = PropertyModelResponse().obs;
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
              isAuthorize: false)
          .then((value) async {
        propertyData.value = PropertyModelResponse.fromJson(value['data']);
      });
    } catch (e) {
      BaseToast.showErorrBaseToast(e.toString());
    } finally {
      isLoadAllProperty(false);
      BaseDialogLoading.dismiss();
    }
  }
}
