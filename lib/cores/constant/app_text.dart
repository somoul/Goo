import 'package:flutter/material.dart';
import 'package:goo_rent/cores/utils/context_provider.dart';

class AppText {
  static TextStyle? bodySmall =
      Theme.of(ContextProvider.context).textTheme.bodySmall;
  static TextStyle? bodyMedium =
      Theme.of(ContextProvider.context).textTheme.bodyMedium;
  static TextStyle? bodyLarge =
      Theme.of(ContextProvider.context).textTheme.bodyLarge;
  static TextStyle? titleSmall =
      Theme.of(ContextProvider.context).textTheme.titleSmall;
  static TextStyle? titleMedium =
      Theme.of(ContextProvider.context).textTheme.titleMedium;
  static TextStyle? titleLarge =
      Theme.of(ContextProvider.context).textTheme.titleLarge;
}
