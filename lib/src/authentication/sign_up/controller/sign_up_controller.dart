import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/country.dart';

class SignUpController extends GetxController {
  /// Variable
  final isShowPass = true.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final countryCode = Country().obs;
  final api = ApiHelper.instance;

  /// Function
  Future<void> onRegister() async {
    var body = {
      'phone': phoneNumber.value,
    };
    KeyboardHeper.hideKeyborad();
    try {
      var response = await api.$request(
        "/register",
        isLoading: true,
        headers: {},
        body: body,
      );
      print('object---------------->>>$response');
    } catch (e) {
      print('object---------->> $e');
    }
  }
}
