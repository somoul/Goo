import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';

import 'color_schemes.g.dart';

class CustomTheme {
  static get lightTheme => ThemeData(
        useMaterial3: true,
        indicatorColor: AppConstant.kSecondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: lightColorScheme,
        textTheme: textThem,

        /// AppBar
        appBarTheme: const AppBarTheme(
          elevation: 0.1,
          titleTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kantumruy',
              color: Colors.white),
          backgroundColor: AppConstant.kPrimaryColor,
          centerTitle: true,
          iconTheme: IconThemeData(
            size: 20,
            color: Colors.white,
          ),
        ),

        /// Form
        inputDecorationTheme: InputDecorationTheme(
          // focusColor: AppConstant.kPrimaryColor,
          // focusedBorder: OutlineInputBorder(
          //     borderSide: const BorderSide(color: Colors.black),
          //     borderRadius: BorderRadius.circular(7)),
          // enabledBorder: OutlineInputBorder(
          //     borderSide: const BorderSide(color: Colors.black),
          //     borderRadius: BorderRadius.circular(7)),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppConstant.kPrimaryColor,
              width: 1,
            ),
          ),
        ),

        ///Btn
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF21A6F8),
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Kantumruy',
                    color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
      );
}

TextTheme textThem = const TextTheme(
  /// Title
  titleSmall: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Kantumruy',
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Kantumruy',
  ),
  titleLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Kantumruy',
  ),

  /// Body
  bodySmall: TextStyle(
    fontSize: 14,
    fontFamily: 'Kantumruy',
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontFamily: 'Kantumruy',
  ),
  bodyLarge: TextStyle(
    fontSize: 18,
    fontFamily: 'Kantumruy',
  ),

  /// Grey text
  displaySmall: TextStyle(
    fontSize: 14,
    fontFamily: 'Kantumruy',
    fontWeight: FontWeight.w400,
  ),

  displayLarge: TextStyle(
    fontSize: 15,
    fontFamily: 'Kantumruy',
    fontWeight: FontWeight.w400,
  ),
);
