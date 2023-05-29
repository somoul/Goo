import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';

class SignInController extends GetxController {
  /// Variable
  final isShowPass = true.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final countryCode = ''.obs;
  final api = ApiHelper.instance;

  /// Function
  Future<void> onLogin() async {
    var body = {'userName': phoneNumber.value, 'password': password.value};
    KeyboardHeper.hideKeyborad();
    // ResponseModel response = ResponseModel(isError: isError, data: data);
    try {
      var response = await api.$request(
        "/signin",
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
