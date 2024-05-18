import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_text.dart';

mixin SelectCategoryMixin {
  /// _____________Select Category________________________
  Widget buildSelectItem(String? icon, String? name) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.grey[200]!,
            )
          ]),
      child: Column(
        children: [
          Image.network(
            icon ?? '',
            width: 45,
          ),
          const SizedBox(height: 6),
          Text(
            name ?? "",
            style: AppText.bodySmall!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
