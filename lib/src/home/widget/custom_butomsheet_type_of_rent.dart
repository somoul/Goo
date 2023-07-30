// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../cores/constant/app_text.dart';
import '../screen/custom_default_butom_sheet.dart';

void customButtomSheetTypeOfRent(
    {required BuildContext context, required Function(String type) onTap}) {
  customDefaultButtomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                // color: const Color.fromARGB(255, 201, 109, 109),
                decoration: const BoxDecoration(
                    color: Color(0xffF9F9F9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ជ្រើសរើសប្រភេទជួល",
                      style: AppText.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listType.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomItemButtomsheet(
                        title: listType[index],
                        onTap: (String type) {
                          onTap(type);
                          print("========type :$type");
                        },
                      );
                      // return null;
                    }),
              )
            ],
          ),
        );
      });
}

class CustomItemButtomsheet extends StatelessWidget {
  String? title;
  Function(String a)? onTap;
  CustomItemButtomsheet({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("==================2134567=============");
        onTap!(title!);
        Navigator.of(context).pop();
      },
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title ?? "",
                  style: AppText.bodySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 0.3,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
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
