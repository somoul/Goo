import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid_card.dart';

class CustomPropertyGrid extends StatelessWidget {
  final String? title;
  final String? actionTitle;
  final Function? onAction;
  final List<PropertyModel> propertyList;
  const CustomPropertyGrid(
      {super.key,
      required this.propertyList,
      this.title,
      this.actionTitle,
      this.onAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title == null || title == ''
            ? const SizedBox()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppConstant.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$title".tr, style: AppText.titleSmall),
                    InkWell(
                      onTap: () => onAction!(),
                      child: Text("$actionTitle",
                          style: AppText.titleSmall!
                              .copyWith(color: AppConstant.kPrimaryColor)),
                    )
                  ],
                ),
              ),
        GridView.builder(
          physics: title == null && title == ''
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          shrinkWrap: title == null && title == '' ? false : true,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: propertyList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 2 / 2.9,
            mainAxisExtent: 260,
          ),
          itemBuilder: (context, index) => CustomGridCard(
            propertyModel: propertyList[index],
          ),
        ),
      ],
    );
  }
}
