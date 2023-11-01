import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_text.dart';

class CustomItemButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final String iconAsset;
  const CustomItemButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.iconAsset});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconAsset,
            height: 50,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: AppText.bodyMedium,
          )
        ],
      ),
    );
  }
}
