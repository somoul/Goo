import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/app_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/notification_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            "Notification".tr,
            style: AppText.bodyMedium!.copyWith(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        body: Center(
          child: Text(
            "Panding....",
            style: AppText.bodyMedium!.copyWith(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ));
  }
}
