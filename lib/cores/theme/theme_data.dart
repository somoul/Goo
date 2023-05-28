import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/appconstant.dart';
import 'color_schemes.g.dart';

class CustomTheme {
  static get lightTheme => ThemeData(
        indicatorColor: AppConstant.kSecondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: lightColorScheme,
        appBarTheme: const AppBarTheme(
            elevation: 0.1,
            titleTextStyle: TextStyle(color: Colors.white),
            backgroundColor: Color(0xFF21A6F8)),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: AppConstant.kPrimaryColor,
            // focusColor: Colors.red,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(7)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(7)),
            labelStyle: const TextStyle(color: Colors.grey)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // backgroundColor: const Color(0xFF21A6F8),
            textStyle: const TextStyle(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
          ),
        ),
      );
}
