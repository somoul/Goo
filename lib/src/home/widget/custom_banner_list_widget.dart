import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/screen/detail_property_type/property_detail.dart';

import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

// ignore: must_be_immutable
class CustomPopularBlock extends StatefulWidget {
  List<PropertyModel> popularList;
  final bool loading;
  final HomeController homeController;
  CustomPopularBlock(
      {Key? key,
      this.axis = Axis.horizontal,
      required this.popularList,
      required this.loading,
      required this.homeController})
      : super(key: key);
  final Axis axis;

  @override
  State<CustomPopularBlock> createState() => _CustomPopularBlockState();
}

class _CustomPopularBlockState extends State<CustomPopularBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        15.gap,
        Padding(
          padding: const EdgeInsets.only(left: AppConstant.paddingLarge),
          child: widget.loading
              ? const ShimmerBox(height: 14)
              : Text('Popular'.tr, style: AppText.titleSmall),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: widget.popularList.isEmpty && !widget.loading ? 70 : 285,
          width: double.infinity,
          child: widget.loading
              ? ListView(
                  scrollDirection: Axis.horizontal,
                  padding: 16.px,
                  children: [
                    ...List.generate(3, (index) => _buildShimmer()),
                  ],
                )
              : widget.popularList.isEmpty
                  ? Center(
                      child: Text(
                        'No Data'.tr,
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    )
                  : ListView.builder(
                      itemCount: widget.popularList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        PropertyModel item = widget.popularList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPropertyScreen(
                                  id: item.id,
                                ),
                              ), //TabBarDemo
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 270,
                                height: 285,
                                margin: const EdgeInsets.only(
                                  right: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.grey[300]!,
                                          offset: const Offset(2, 2))
                                    ]),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: Container(
                                        height: 160,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)),
                                        ),
                                        child: ImageBuilder(
                                                fit: BoxFit.cover, width: 270)
                                            .network(
                                                item.attachments?[0] ?? ""),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      textBaseline: TextBaseline.ideographic,
                                      children: [
                                        10.gap,
                                        Text(
                                          item.title ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppText.bodyMedium,
                                        ).px(14),
                                        10.gap,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: ImageBuilder().asset(
                                                    "assets/image2/icon_map.svg"),
                                              ),
                                              8.gap,
                                              Expanded(
                                                child: Text(
                                                    item.distance ?? "N/A"),
                                              ),
                                              Text(
                                                "\$${item.price}/",
                                                style: AppText.titleSmall!
                                                    .copyWith(
                                                        color: const Color(
                                                            0xFF21A6F8)),
                                              ),
                                              Text(
                                                "Month".tr,
                                                style: AppText.bodySmall!
                                                    .copyWith(
                                                        color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    5.gap,
                                    const Divider(height: 0, thickness: 0.5),
                                    Row(
                                      children: [
                                        14.gap,
                                        Expanded(
                                          child: Text(
                                            'ID: ${item.id}',
                                            overflow: TextOverflow
                                                .ellipsis, //  "${item.distance}",
                                            maxLines: 1,
                                            style: AppText.bodyMedium!.copyWith(
                                                color: const Color(0xFF979797)),
                                          ),
                                        ),
                                        IconButton(
                                          splashRadius: 45,
                                          onPressed: () {
                                            setState(() {
                                              widget.popularList[index]
                                                      .favorite =
                                                  !widget.popularList[index]
                                                      .favorite;
                                            });
                                            widget.homeController.onFavorit(
                                              propertyId: item.id.toString(),
                                            );
                                          },
                                          icon: ImageBuilder().asset(
                                            item.favorite
                                                ? 'assets/image2/active_favorite.svg'
                                                : 'assets/image/favorite.svg',
                                          ),
                                        ),
                                        5.gap,
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF0F0F0),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 5),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.remove_red_eye,
                                              size: 15),
                                          const SizedBox(width: 3),
                                          Text(
                                            "${item.visit ?? ''}",
                                            style: AppText.titleSmall!
                                                .copyWith(fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ).pr(20),
                        );
                      },
                    ),
        ),
      ],
    ).pt(10);
  }
}

///________Shimmer
Widget _buildShimmer() {
  return Container(
    width: 270,
    height: 285,
    margin: const EdgeInsets.only(right: 20, bottom: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[200]!,
            offset: const Offset(2, 2),
          )
        ]),
    child: Column(
      children: [
        Stack(
          children: [
            ShimmerBox(
              height: 160,
              width: 270,
              borderRadius: 15,
              highlightColor: Colors.grey[100],
              baseColor: Colors.white,
            ),
            const Positioned(
              top: 10,
              right: 10,
              child: ShimmerBox(width: 70, height: 25),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.ideographic,
          children: [
            Padding(
              padding: 15.p,
              child: const ShimmerBox(),
            ),
            Padding(
              padding: 15.px,
              child: const Row(
                children: [
                  ShimmerBox(width: 70),
                  Spacer(),
                  ShimmerBox(),
                  SizedBox(width: 15),
                ],
              ),
            ),
            10.gap,
            Divider(
              height: 0,
              thickness: 0.5,
              color: Colors.grey[200]!,
            ),
            10.gap,
            Row(
              children: [
                15.gap,
                const ShimmerBox(),
                const Spacer(),
                const ShimmerBox(),
                15.gap,
              ],
            )
          ],
        )
      ],
    ),
  );
}
