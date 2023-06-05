import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';
import 'package:goo_rent/src/authentication/sign_up/data/register_model.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/country.dart';

class SignUpController extends GetxController {
  /// Variable
  final isShowPass = true.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final countryCode = Country().obs;
  final apiHelper = ApiHelper();
  final registerData = RegisterModel().obs;

  /// Method
  Future<void> onRegister() async {
    var body = {
      'username': '234567',
      'password': '123456',
      'phone': '096452345300',
    };
    KeyboardHeper.hideKeyborad();
    try {
      await apiHelper
          .onRequest(
        url: '/register',
        methode: METHODE.post,
        isAuthorize: false,
        body: body,
      )
          .then((value) async {
        registerData.value = RegisterModel.fromJson(value['data']);
        await LocalStorage.writeToken(registerData.value.token!);
      });
    } catch (_) {}
  }
}
