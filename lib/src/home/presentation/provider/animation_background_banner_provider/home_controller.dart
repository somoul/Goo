import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/presentation/screen/home_screen.dart';

class HomeController extends GetxController {
  int _currentPage = 0;
  int get index => _currentPage;
  bool _checkIsBiggerThan = true;
  late PageController pageController;

  ///Dummy List
  final List<CategoriesItem> listIcon = [
    const CategoriesItem(
        iconName: 'បន្ទប់ជួល', iconSrc: 'assets/icons/Mask group.png'),
    const CategoriesItem(
        iconName: 'ផ្ទះជួល', iconSrc: 'assets/icons/homerent.png'),
    const CategoriesItem(
        iconName: 'ផ្ទះអាជីវកម្ម', iconSrc: 'assets/icons/168.png'),
    const CategoriesItem(
        iconName: 'ឃ្លាំង', iconSrc: 'assets/icons/Mask group (1).png'),
    const CategoriesItem(
        iconName: 'ខុនដូរ', iconSrc: 'assets/icons/Mask group (2).png'),
    const CategoriesItem(
        iconName: 'ដឺជួល', iconSrc: 'assets/icons/facebook.png'),
    const CategoriesItem(
        iconName: 'អាផាតមិន', iconSrc: 'assets/icons/Group 34855.png'),
    const CategoriesItem(
        iconName: 'ការិយាល័យ', iconSrc: 'assets/icons/facebook.png'),
  ];

  callStartAnimation() async {
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      Timer(const Duration(seconds: 3), () {
        if (_checkIsBiggerThan) {
          _currentPage++;
          if (_currentPage > 4) {
            _checkIsBiggerThan = false;
          }
        } else {
          _currentPage--;
          if (_currentPage < 1) {
            _checkIsBiggerThan = true;
          }
        }
        update();
      });
    });
  }
}
