import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';

// ignore: must_be_immutable
class CustomShipTypeRent extends StatelessWidget {
  String title;
  Function onTap;
  CustomShipTypeRent({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppConstant.kPrimaryColor.withOpacity(0.15),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, top: 6, right: 10, bottom: 6),
          child: Text(
            title,
            style: AppText.bodySmall!.copyWith(
                color: AppConstant.kPrimaryColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
