import 'package:flutter/material.dart';

class BottomNavItem {
  final String label;
  final String svgPicturePath;
  final Color? backgroundColor;
  final double iconSize;
  BottomNavItem(
      {required this.label,
      required this.svgPicturePath,
      this.backgroundColor,
      this.iconSize = 20});
}
