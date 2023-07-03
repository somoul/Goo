import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
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
            titleTextStyle: TextStyle(color: Colors.white),
            backgroundColor: Color(0xFF21A6F8)),

        /// Form
        inputDecorationTheme: InputDecorationTheme(
            focusColor: AppConstant.kPrimaryColor,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(7)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(7)),
            labelStyle: const TextStyle(color: Colors.grey)),

        ///Btn
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                // backgroundColor: const Color(0xFF21A6F8),
                textStyle: const TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
      );
}

TextTheme textThem = TextTheme(
  /// Title
  titleSmall: GoogleFonts.kantumruy(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  titleMedium: GoogleFonts.kantumruy(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
  titleLarge: GoogleFonts.kantumruy(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),

  /// Body
  bodySmall: GoogleFonts.kantumruy(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: GoogleFonts.kantumruy(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: GoogleFonts.kantumruy(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),

  /// Grey text
  displaySmall: GoogleFonts.kantumruy(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  ),
  displayLarge: GoogleFonts.kantumruy(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  ),
);
