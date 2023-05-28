import 'package:flutter/material.dart';

showBottomEditProfilePhoto(
    {required BuildContext context, required Widget widget}) async {
  final test = await showModalBottomSheet<bool>(
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
  return test;
}
