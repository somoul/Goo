import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/home/data/slide_categorie_model/slide_categorie_model.dart';

mixin SelectCategoryMixin {
  /// _____________Select Category________________________
  Widget buildSelectItem(SlideCategorieModel categModel) {
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
            categModel.icon ?? '',
            width: 45,
          ),
          const SizedBox(height: 4),
          Text(
            '${categModel.name}',
            style: AppText.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
