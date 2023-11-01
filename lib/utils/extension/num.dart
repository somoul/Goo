import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

extension ExtendNum on num {
  Gap get gap => Gap(toDouble());

  EdgeInsets get p => EdgeInsets.all(toDouble());

  EdgeInsets get px => EdgeInsets.symmetric(
        horizontal: toDouble(),
      );

  EdgeInsets get py => EdgeInsets.symmetric(
        vertical: toDouble(),
      );

  EdgeInsets get pt => EdgeInsets.only(
        top: toDouble(),
      );

  EdgeInsets get pr => EdgeInsets.only(
        right: toDouble(),
      );

  EdgeInsets get pl => EdgeInsets.only(
        left: toDouble(),
      );

  EdgeInsets get pb => EdgeInsets.only(
        bottom: toDouble(),
      );

  EdgeInsets get pxb => EdgeInsets.only(
        right: toDouble(),
        left: toDouble(),
        bottom: toDouble(),
      );

  EdgeInsets get pxt => EdgeInsets.only(
        top: toDouble(),
        right: toDouble(),
        left: toDouble(),
      );

  EdgeInsets get pyl => EdgeInsets.only(
        top: toDouble(),
        left: toDouble(),
        bottom: toDouble(),
      );

  EdgeInsets get pyr => EdgeInsets.only(
        top: toDouble(),
        right: toDouble(),
        bottom: toDouble(),
      );

  BorderRadius get borderRadius => BorderRadius.circular(toDouble());
  Radius get radius => Radius.circular(toDouble());

  BorderRadius get borderRadiusTop =>
      BorderRadius.vertical(top: Radius.circular(toDouble()));

  BorderRadius get borderRadiusBottom =>
      BorderRadius.vertical(bottom: Radius.circular(toDouble()));

  BorderRadius get borderRadiusLeft =>
      BorderRadius.horizontal(left: Radius.circular(toDouble()));
  BorderRadius get borderRadiusRight =>
      BorderRadius.horizontal(right: Radius.circular(toDouble()));

  String toFixed([int? digit]) {
    return toStringAsFixed(digit ?? 2).replaceFirst(RegExp(r'\.0+$'), '');
  }

  String get formatCurrency => NumberFormat('#,###.##').format(this);
}
