import 'package:get/get.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/helper/local_storage.dart';
import 'package:goo_rent/src/authentication/sign_up/data/register_model.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/country.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_dialoge.dart';
import 'package:goo_rent/utils/core/config.dart';

class SignInController extends GetxController {
  ///Object
  final apiHelper = ApiHelper();

  /// Variable
  final isShowPass = true.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final countryCode = Country().obs;
  final userModel = RegisterModel().obs;
  final isLoging = false.obs;

  ///Condiction
  bool get isEnableSignin =>
      phoneNumber.value.length > 7 && password.value.length > 4;

  /// Method
  Future onLogin() async {
    BaseDialogLoading.show();
    isLoging(true);
    var body = {
      'username': signinPhoneAddCountryCode
          ? "855${phoneNumber.value}"
          : phoneNumber.value,
      'password': password.value,
    };
    try {
      var response = await apiHelper
          .onRequest(
        url: '/login',
        methode: METHODE.post,
        isAuthorize: false,
        body: body,
      )
          .onError((ErrorModel error, stackTrace) {
        BaseToast.showErorrBaseToast('${error.bodyString['message']}');
        return;
      });
      userModel.value = RegisterModel.fromJson(response['data']);
      await LocalStorage.writeToken(userModel.value.token!);
      return response;
    } catch (_) {
      // BaseToast.showErorrBaseToast(e.toString());
    } finally {
      BaseDialogLoading.dismiss();
      isLoging(false);
    }
  }
}
