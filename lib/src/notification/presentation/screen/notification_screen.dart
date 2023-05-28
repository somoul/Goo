import 'package:flutter/material.dart';
import 'package:goo_rent/src/notification/presentation/widget/custom_listtile_widget.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: Text(
          "ការផ្តល់ដំណឹង",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.kantumruy().fontFamily,
              fontSize: 20,
              color: Colors.black),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: CustomListTileWidget(),
        ),
      ),
    );
  }
}
