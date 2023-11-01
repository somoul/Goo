import 'package:flutter/material.dart';

class ContextProvider {
  static NavigatorState get state => navigatorKey.currentState!;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  // static dynamic get lastSettings {
  //   var currentSetting;
  //   state.popUntil((route) {
  //     currentSetting = route.settings;
  //     return true;
  //   });
  //   return currentSetting;
  // }

  // static Future<T?> pushAndRemoveUntil<T extends Object?>(
  //     Route<T> newRoute, RoutePredicate predicate) {
  //   return state.pushAndRemoveUntil(newRoute, predicate);
  // }

  // static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
  //     Route<T> newRoute,
  //     {TO? result}) {
  //   return state.pushReplacement(newRoute, result: result);
  // }

  // static Future<T?> push<T extends Object?>(Route<T> route) {
  //   return state.push(route);
  // }

  // static void pop<T extends Object?>([T? result]) {
  //   return state.pop(result);
  // }

  // static bool canPop() {
  //   return state.canPop();
  // }
}
