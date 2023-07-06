import 'package:flutter/material.dart';

showMyDialog({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/image2/tick.png"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "ការដាក់ជួលស្ថិតនៅក្នុងការត្រួតពិនិត្យ",
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "យើងនឹងឆ្លើយតបទៅអ្នកវិញក្នុងរយះពេលខ្លី",
              ),
            ],
          ),
        ),
        // actions: <Widget>[
        //   TextButton(
        //     child: const Text('Approve'),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      );
    },
  );
}
