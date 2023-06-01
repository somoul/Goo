import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';

class CustomListile extends StatelessWidget {
  final String title;
  final Function? onTap;
  final String leadingAsset;
  final Widget? trailing;
  const CustomListile({
    super.key,
    required this.title,
    this.onTap,
    required this.leadingAsset,
    this.trailing,
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
            Image.asset(
              leadingAsset,
              height: 50,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: AppText.titleSmall,
              ),
            ),
            trailing ??
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                  color: Colors.grey[500],
                )
          ],
        ),
      ),
    );
  }
}
