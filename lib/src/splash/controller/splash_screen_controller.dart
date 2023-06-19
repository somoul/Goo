import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';
import 'package:goo_rent/routes/route_name.dart';

class SplashController extends GetxController {
  void onCheckUser() async {
    var tokenKey = await LocalStorage.readToken();
    if (tokenKey != '') {
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.authLanding);
    }
  }

  @override
  void onInit() {
    onCheckUser();
    super.onInit();
  }
}
