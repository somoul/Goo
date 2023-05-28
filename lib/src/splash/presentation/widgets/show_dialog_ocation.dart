import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/presentation/screen/home_screen.dart';

showAlertDialog({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AlertDialog(
          scrollable: true,
          actionsOverflowDirection: VerticalDirection.up,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: const Center(
              child: Text(
            'Allow "Goo" to use your location?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Center(
                    child: Text(
                  ' It\'s will help you to find rental nearby your place faster',
                  style: TextStyle(fontSize: 14),
                )),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                    "assets/images/Google-Maps-Blue-Dot-Geoawesomeness.jpg")
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                onTap: () {
                  Get.to(const HomeScreen());
                  //GoRouter.of(context).replace(SignInScreen.routeName);
                  // GoRouter.of(context).replace(SignOutScreen.routeName);
                  // GoRouter.of(context).replace("/main_page");
                },
                title: const Center(child: Text('Don\'t Allow')),
              ),
            ),
            Center(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                onTap: () {
                  Get.to(const HomeScreen());
                },
                title: const Center(child: Text('Allow While Using App')),
              ),
            ),
            Center(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                onTap: () {
                  Get.to(const HomeScreen());
                },
                title: const Center(child: Text('Allow Once')),
              ),
            ),
          ],
        ),
      );
    },
  );
}
