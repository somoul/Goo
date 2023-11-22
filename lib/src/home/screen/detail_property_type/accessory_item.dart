import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/post_property/data/accessory_model.dart';
import 'package:goo_rent/utils/extension/num.dart';

class AccessoryItem extends StatelessWidget {
  final AccessoryModel accessoryModel;
  const AccessoryItem({super.key, required this.accessoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppConstant.kPrimaryColor.withOpacity(0.15),
          ),
          child: ImageBuilder().network(accessoryModel.icon ?? ''),
        ),
        6.gap,
        Text(
          accessoryModel.name ?? "",
          style: AppText.bodyMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
