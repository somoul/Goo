import 'package:flutter/material.dart';
import 'package:goo_rent/cores/utils/notifications_helper.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/notification_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "ការផ្តល់ដំណឹង",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          // child: CustomListTileWidget(),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                NotificationHelper.showNotification();
              },
              child: const Text('Show Notification '),
            ),
          ),
        ),
      ),
    );
  }
}
