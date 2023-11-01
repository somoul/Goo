import 'dart:math';

import 'package:flutter/cupertino.dart';

extension ExtendEdgeInsets on EdgeInsets {
  bool get isZero => horizontal + vertical == 0;

  EdgeInsets operator *(double scale) {
    return EdgeInsets.only(
      top: top * scale,
      bottom: bottom * scale,
      left: left * scale,
      right: right * scale,
    );
  }

  EdgeInsets operator /(double scale) {
    return EdgeInsets.only(
      top: top / scale,
      bottom: bottom / scale,
      left: left / scale,
      right: right / scale,
    );
  }

  EdgeInsets operator +(EdgeInsets other) {
    return EdgeInsets.only(
      top: top + other.top,
      bottom: bottom + other.bottom,
      left: left + other.left,
      right: right + other.right,
    );
  }

  EdgeInsets operator -(EdgeInsets other) {
    return EdgeInsets.only(
      top: max(0, top - other.top),
      bottom: max(0, bottom - other.bottom),
      left: max(0, left - other.left),
      right: max(0, right - other.right),
    );
  }

  EdgeInsets pt(double size) {
    return EdgeInsets.only(
      top: size,
      left: left,
      bottom: bottom,
      right: right,
    );
  }

  EdgeInsets pb(double size) {
    return EdgeInsets.only(
      top: top,
      left: left,
      bottom: size,
      right: right,
    );
  }

  EdgeInsets pr(double size) {
    return EdgeInsets.only(
      top: top,
      left: left,
      bottom: bottom,
      right: size,
    );
  }

  EdgeInsets pl(double size) {
    return EdgeInsets.only(
      top: top,
      left: size,
      bottom: bottom,
      right: right,
    );
  }

  EdgeInsets px(double size) {
    return EdgeInsets.only(
      top: top,
      left: size,
      bottom: bottom,
      right: size,
    );
  }

  EdgeInsets py(double size) {
    return EdgeInsets.only(
      top: size,
      left: left,
      bottom: size,
      right: right,
    );
  }
}
