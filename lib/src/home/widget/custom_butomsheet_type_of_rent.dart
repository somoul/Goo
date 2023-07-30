// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../cores/constant/app_text.dart';

class CustomItemButtomsheet extends StatelessWidget {
  String? title;
  CustomItemButtomsheet({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(title ?? "", style: AppText.bodyMedium),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      size: 14, color: Colors.grey),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
        Divider(
          thickness: 0.3,
          height: 0,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}

///list

List<String> listType = [
  "ផ្ទះជួល",
  "តូបអាជីវកម្ម",
  "ឃ្លាំងជួល",
  "អាគារជួល",
  "ភោជនីយដ្ឋាន"
      "ផ្ទះជួល",
  "តូបអាជីវកម្ម",
  "ឃ្លាំងជួល",
  "អាគារជួល",
  "ភោជនីយដ្ឋាន"
];
