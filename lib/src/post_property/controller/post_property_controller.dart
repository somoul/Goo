import 'package:get/get.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/helper/upload_iamge.dart';
import 'package:goo_rent/src/post_property/data/accessory_model.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';

class PostPropertyController extends GetxController {
  final title = ''.obs;
  final additionalInformation = ''.obs;
  final apiHelper = ApiHelper();
  final isLoadAccessory = false.obs;
  final accessoryData = <AccessoryModel>[].obs;

  Future<void> getAccessories() async {
    isLoadAccessory(true);
    try {
      await apiHelper
          .onRequest(
        isAuthorize: true,
        url: "/accessories",
        methode: METHODE.get,
      )
          .then((response) {
        var data = response['data'];
        accessoryData.clear();
        data.forEach((e) {
          accessoryData.add(AccessoryModel.fromJson(e));
        });
      }).onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
      });
    } catch (_) {
    } finally {
      isLoadAccessory(false);
    }
  }

  //Step 1--------------------------------
  final imageList = <String>[].obs;
  final uploading = false.obs;
  Future uploadImage(String path) async {
    // uploading(true);
    BaseDialogLoading.show();
    try {
      var data = await UploadFile.uploadImage(path);
      if (data != null) {
        var url = data['image_url'];
        imageList.add(url);
      }
    } catch (e) {
      rethrow;
    } finally {
      BaseDialogLoading.dismiss();
      // uploading(false);
    }
  }
}
