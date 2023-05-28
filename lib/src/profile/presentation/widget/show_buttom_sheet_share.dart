import 'package:flutter/material.dart';

void showBottomSheetShare(
    {required BuildContext context, required Widget widget}) async {
  await showModalBottomSheet<bool>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      context: context,
      builder: (context) {
        return widget;
      });
}
