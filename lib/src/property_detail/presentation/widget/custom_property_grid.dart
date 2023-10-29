import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid_card.dart';

class CustomPropertyGrid extends StatefulWidget {
  final String? title;
  final String? actionTitle;
  final Function? onAction;
  final List<PropertyModel> propertyList;
  final PropertyController propertyController;

  const CustomPropertyGrid({
    super.key,
    required this.propertyList,
    this.title,
    this.actionTitle,
    this.onAction,
    required this.propertyController,
  });

  @override
  State<CustomPropertyGrid> createState() => _CustomPropertyGridState();
}

class _CustomPropertyGridState extends State<CustomPropertyGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.title == null || widget.title == ''
            ? const SizedBox()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppConstant.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.title}".tr, style: AppText.titleSmall),
                    InkWell(
                      onTap: () => widget.onAction!(),
                      child: Text("${widget.actionTitle}",
                          style: AppText.titleSmall!
                              .copyWith(color: AppConstant.kPrimaryColor)),
                    )
                  ],
                ),
              ),
        GridView.builder(
          physics: widget.title == null && widget.title == ''
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          shrinkWrap: widget.title == null && widget.title == '' ? false : true,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: widget.propertyList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 2 / 2.9,
            mainAxisExtent: 280,
          ),
          itemBuilder: (context, index) => CustomGridCard(
            propertyModel: widget.propertyList[index],
            isFavorite: widget.propertyList[index].favorite,
            onFavorite: () {
              widget.propertyList[index].favorite =
                  !widget.propertyList[index].favorite;
              setState(() {});
              widget.propertyController
                  .onFavorit(propertyId: '${widget.propertyList[index].id}');
            },
          ),
        ),
      ],
    );
  }
}
