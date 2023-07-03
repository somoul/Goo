import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/utils/api_helper.dart';
import 'package:goo_rent/cores/utils/hide_keybaord.dart';
import 'package:goo_rent/cores/utils/loading_dialoge.dart';

class ProfileController extends GetxController {
  final textEditController = TextEditingController(text: '').obs;
  final apiHelper = ApiHelper();

  ///Medthod
  Future<void> onSaveProfileInfo() async {
    KeyboardHeper.hideKeyborad();
    try {
      await apiHelper.onRequest(
          url: '/',
          methode: METHODE.post,
          isAuthorize: false,
          body: {"value": textEditController.value.text}).then((value) async {
        BaseToast.showSuccessBaseToast('Updated Successfully!');
      });
    } catch (e) {
      BaseToast.showErorrBaseToast(e.toString());
    }
  }
}
