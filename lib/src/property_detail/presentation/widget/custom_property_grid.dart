import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/home/screen/detail_property_type/property_detail.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid_card.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
import 'package:goo_rent/utils/extension/edge_insets.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

import '../../../home/controler/animation_background_banner_provider/home_controller.dart';

class CustomPropertyGrid extends StatefulWidget {
  final String? title;
  final String? actionTitle;
  final Function? onAction;
  final List<PropertyModel> propertyList;
  final bool loading;
  final Function(int id, int index) onFavorit;
  final int loadingLength;
  final bool isGrid;
  const CustomPropertyGrid(
      {super.key,
      required this.propertyList,
      this.title,
      this.actionTitle,
      this.onAction,
      this.loading = false,
      this.isGrid = false,
      // this.loadingMore = false,
      this.loadingLength = 2,
      required this.onFavorit});

  @override
  State<CustomPropertyGrid> createState() => _CustomPropertyGridState();
}

class _CustomPropertyGridState extends State<CustomPropertyGrid> {
  final _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null || widget.title == ''
            ? const SizedBox()
            : widget.loading
                ? const ShimmerBox(height: 14).pl(15)
                : Padding(
                    padding: 15.pl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${widget.title}".tr, style: AppText.titleSmall),
                        SizedBox(
                          height: 30,
                          child: TextButton(
                            style: TextButton.styleFrom(padding: 0.p.px(20)),
                            onPressed: () => widget.onAction!(),
                            child: Text("${widget.actionTitle}",
                                style: AppText.titleSmall!.copyWith(
                                    color: AppConstant.kPrimaryColor)),
                          ),
                        )
                      ],
                    ),
                  ),
        if (widget.propertyList.isNotEmpty)
          GridView.builder(
            physics: widget.title == null && widget.title == ''
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            shrinkWrap:
                widget.title == null && widget.title == '' ? false : true,
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
            itemCount: widget.propertyList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.isGrid == true ? 2 : 1, //2
              crossAxisSpacing: 13,
              mainAxisSpacing: 13,

              mainAxisExtent: widget.isGrid == true ? 275 : 130, //
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPropertyScreen(id: widget.propertyList[index].id),
                  ), //TabBarDemo
                );
              },
              child: widget.isGrid == true
                  ? CustomGridCard(
                      isLoading: widget.loading,
                      propertyModel: widget.propertyList[index],
                      homeController: _homeController,
                      onFavorit: () {
                        widget.onFavorit(widget.propertyList[index].id, index);
                      },
                    )
                  : PropertyCartOne(
                      isLoading: widget.loading,
                      propertyModel: widget.propertyList[index],
                      homeController: _homeController,
                      onFavorit: () {
                        widget.onFavorit(widget.propertyList[index].id, index);
                      },
                    ),
            ),
          ),
      ],
    ).pt(10);
  }
}
