import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:get/get.dart';
import 'dialog_laoder.dart';

class BaseDialogLoading {
  static final DialogLoader _progressDialog =
      DialogLoader(context: Get.context);

  static void show({bool dismissible = false}) {
    _progressDialog.show(
      theme: LoaderTheme.dialogCircle,
      barrierDismissible: dismissible,
      title: const BaseLoading(),
    );
  }

  static void dismiss() {
    _progressDialog.close();
  }
}

class BaseLoading extends StatelessWidget {
  const BaseLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        child: !Platform.isAndroid
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppConstant.kSecondaryColor),
              )
            : const CupertinoActivityIndicator(radius: 14.0),
      ),
    );
  }
}
