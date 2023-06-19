import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/cores/utils/loading_dialoge.dart';
import 'package:goo_rent/cores/utils/loading_helper.dart';
import 'package:goo_rent/cores/utils/local_storage.dart';
import 'package:goo_rent/routes/route_name.dart';
import 'package:goo_rent/src/authentication/sign_up/data/register_model.dart';
import 'package:goo_rent/src/authentication/sign_up/presentation/widget/country_code_picker/country.dart';

class SignInController extends GetxController {
  ///Object
  final apiHelper = ApiHelper();

  /// Variable
  final isShowPass = true.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final countryCode = Country().obs;
  final userModel = RegisterModel().obs;

  ///Condiction
  bool get isEnableSignin =>
      phoneNumber.value.length > 7 && password.value.length > 4;

  /// Method
  Future<void> onLogin() async {
    KeyboardHeper.hideKeyborad();
    BaseDialogLoading.show();
    //  phoneNumber.value = phoneNumber.value.trim();
    var body = {
      'phone': phoneNumber.value,
      'password': password.value,
    };

    print('Signin Body : $body');
    try {
      var val = await apiHelper
          .onRequest(
        url: '/login',
        methode: METHODE.post,
        isAuthorize: false,
        body: body,
      )
          .then((value) async {
        print('object===============>>>> $value');
        BaseDialogLoading.dismiss();
        BaseToast.showSuccessBaseToast('Signin successfully!');
        userModel.value = RegisterModel.fromJson(value['data']);
        await LocalStorage.writeToken(userModel.value.token!);
        Get.offAllNamed(Routes.home);
      });
      print('-----------------$val');
    } catch (e) {
      BaseDialogLoading.dismiss();
      // BaseToast.showErorrBaseToast(e.toString());
    }
  }
}
