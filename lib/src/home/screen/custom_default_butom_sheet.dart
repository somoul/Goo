import 'package:flutter/material.dart';

dynamic customBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) {
  var result = showModalBottomSheet(
    isScrollControlled: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8),
      ),
    ),
    context: context,
    builder: builder,
  );

  return result;
}
