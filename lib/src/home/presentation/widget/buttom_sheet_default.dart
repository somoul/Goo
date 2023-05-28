import 'package:flutter/material.dart';

void showBottomSheetDefault(
    {required BuildContext context, required Widget widget}) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return widget;
      });
}
