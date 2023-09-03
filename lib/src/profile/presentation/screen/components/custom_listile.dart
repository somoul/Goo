import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';

class CustomListile extends StatelessWidget {
  final String title;
  final Function? onTap;
  final String leadingAsset;
  final Widget? trailing;
  final double? leadingSize;
  const CustomListile({
    super.key,
    required this.title,
    this.onTap,
    required this.leadingAsset,
    this.trailing,
    this.leadingSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null ? null : () => onTap!(),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Image.asset(leadingAsset, height: leadingSize ?? 40),
            const SizedBox(width: 15),
            Expanded(
              child: Text(title, style: AppText.bodyMedium),
            ),
            trailing ??
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: Colors.grey[500],
                )
          ],
        ),
      ),
    );
  }
}
