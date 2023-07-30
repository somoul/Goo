import 'package:flutter/material.dart';

void customDefaultButtomSheet(
    {required BuildContext context,
    required Widget Function(BuildContext) builder}) {
  showModalBottomSheet(
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: builder
      //  (context) {
      //   return const BottomSheetScreen();
      // })
      );
}
