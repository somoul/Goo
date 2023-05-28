import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Text(
                "ការដាក់ជួលស្ថិតនៅក្នុងការត្រួតពិនិត្យ",
                style: GoogleFonts.kantumruy(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("យើងនឹងឆ្លើយតបទៅអ្នកវិញក្នុងរយះពេលខ្លី",
                  style: GoogleFonts.kantumruy(fontSize: 18)),
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
