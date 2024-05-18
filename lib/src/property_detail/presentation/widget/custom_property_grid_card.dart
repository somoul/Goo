import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

import '../../../home/controler/animation_background_banner_provider/home_controller.dart';
import '../../../home/widget/CustomDefaultShimmer.dart';

class CustomGridCard extends StatefulWidget {
  final PropertyModel propertyModel;
  final bool isLoading;
  final bool isFavorit;
  final HomeController homeController;
  final Function() onFavorit;

  const CustomGridCard(
      {super.key,
      required this.propertyModel,
      this.isLoading = true,
      this.isFavorit = false,
      required this.homeController,
      required this.onFavorit});

  @override
  State<CustomGridCard> createState() => _CustomGridCardState();
}

class _CustomGridCardState extends State<CustomGridCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 250, 247, 247),
              blurRadius: 6,
              spreadRadius: 4,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Stack(
                children: [
                  CustomDefaultShimmer(
                    widthShimmer: double.infinity,
                    heightShimmer: 140,
                    padding: const EdgeInsets.all(0),
                    isShimmer: widget.isLoading,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ImageBuilder(fit: BoxFit.cover, height: 162)
                            .network(
                                widget.propertyModel.attachments?[0] ?? ''),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: widget.isLoading,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFFFFFFF),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.remove_red_eye, size: 14),
                              const SizedBox(width: 3),
                              Text(
                                '${widget.propertyModel.visit}',
                                style: AppText.bodySmall!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      left: 10,
                      bottom: 8,
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: widget.isLoading,
                        child: Text(
                          'ID: ${widget.propertyModel.id}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.titleSmall!.copyWith(
                              fontSize: 14.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDefaultShimmer(
                widthShimmer: double.infinity,
                heightShimmer: 16,
                padding: const EdgeInsets.only(left: 13, right: 13),
                isShimmer: widget.isLoading,
                child: Text(
                  '${widget.propertyModel.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.titleSmall!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ).px(14),
              ),
              const SizedBox(height: 6),
              CustomDefaultShimmer(
                widthShimmer: double.infinity,
                heightShimmer: 16,
                padding: const EdgeInsets.only(left: 13, right: 13),
                isShimmer: widget.isLoading,
                child: Row(
                  children: [
                    SizedBox(
                      height: 19,
                      width: 19,
                      child: ImageBuilder().asset("assets/image2/icon_map.svg"),
                    ),
                    6.gap,
                    Expanded(
                      child: Text(
                        '${widget.propertyModel.distance}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.bodySmall!
                            .copyWith(color: Colors.grey, fontSize: 15.5),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '\$${widget.propertyModel.price}/',
                      style: AppText.titleSmall!.copyWith(
                          fontSize: 16.5,
                          color: AppConstant.kPrimaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'month'.tr,
                        style: AppText.titleSmall!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ).px(14),
              ),
              const SizedBox(height: 8),
              CustomDefaultShimmer(
                  widthShimmer: 0,
                  heightShimmer: 0,
                  padding: const EdgeInsets.only(left: 13, top: 13, right: 13),
                  isShimmer: widget.isLoading,
                  child: const Divider(height: 0)),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: widget.isLoading,
                        child: Text(
                          'Category'.tr,
                          maxLines: 1,
                          style: AppText.titleSmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: widget.isLoading,
                        child: Text(
                          ": ${widget.propertyModel.cname} ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.titleSmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: widget.isLoading,
                        child: GestureDetector(
                          onTap: () {
                            widget.onFavorit();
                            setState(() {
                              widget.propertyModel.favorite =
                                  !widget.propertyModel.favorite;
                            });
                          },
                          child: SvgPicture.asset(
                            widget.propertyModel.favorite
                                ? 'assets/image2/active_favorite.svg'
                                : 'assets/image/favorite.svg',
                            width: 23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PropertyCartOne extends StatefulWidget {
  final PropertyModel propertyModel;

  final bool isLoading;
  final HomeController homeController;
  final Function() onFavorit;
  const PropertyCartOne(
      {super.key,
      required this.propertyModel,
      this.isLoading = false,
      required this.homeController,
      required this.onFavorit});

  @override
  State<PropertyCartOne> createState() => _PropertyCartOneState();
}

class _PropertyCartOneState extends State<PropertyCartOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 250, 247, 247),
              blurRadius: 6,
              spreadRadius: 4,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                CustomDefaultShimmer(
                  widthShimmer: 110,
                  heightShimmer: 100,
                  padding: const EdgeInsets.all(0),
                  isShimmer: widget.isLoading,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ImageBuilder(
                            fit: BoxFit.cover, height: 115, width: 120)
                        .network(widget.propertyModel.attachments?[0] ?? ''),
                  ),
                ),
                Positioned(
                    left: 5,
                    top: 7,
                    child: CustomDefaultShimmer(
                      widthShimmer: 20,
                      heightShimmer: 16,
                      padding: const EdgeInsets.all(0),
                      isShimmer: widget.isLoading,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFFFFF),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.remove_red_eye, size: 14),
                            const SizedBox(width: 3),
                            Text(
                              '${widget.propertyModel.visit}',
                              style: AppText.bodySmall!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  left: 6.5,
                  bottom: 4,
                  child: CustomDefaultShimmer(
                    widthShimmer: 50,
                    heightShimmer: 16,
                    padding: const EdgeInsets.all(0),
                    isShimmer: widget.isLoading,
                    child: Text(
                      'ID: ${widget.propertyModel.id}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.titleSmall!.copyWith(
                          fontSize: 14.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ).p(12),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                CustomDefaultShimmer(
                  widthShimmer: double.infinity,
                  heightShimmer: 18,
                  padding: const EdgeInsets.all(0),
                  isShimmer: widget.isLoading,
                  child: Text(
                    '${widget.propertyModel.title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: AppText.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    CustomDefaultShimmer(
                      widthShimmer: 20,
                      heightShimmer: 16,
                      padding: const EdgeInsets.all(0),
                      isShimmer: widget.isLoading,
                      child: Text(
                        '\$${widget.propertyModel.price}/',
                        style: AppText.titleSmall!.copyWith(
                            fontSize: 16.5,
                            color: AppConstant.kPrimaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CustomDefaultShimmer(
                        widthShimmer: 30,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: widget.isLoading,
                        child: Text(
                          'month'.tr,
                          style: AppText.titleSmall!.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomDefaultShimmer(
                      widthShimmer: 20,
                      heightShimmer: 16,
                      padding: const EdgeInsets.all(0),
                      isShimmer: widget.isLoading,
                      child: SizedBox(
                        height: 19,
                        width: 19,
                        child:
                            ImageBuilder().asset("assets/image2/icon_map.svg"),
                      ).p(5),
                    ),
                    Expanded(
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: widget.isLoading,
                        child: Text(
                          '${widget.propertyModel.distance}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.bodySmall!
                              .copyWith(color: Colors.grey, fontSize: 15.5),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomDefaultShimmer(
                    widthShimmer: double.infinity,
                    heightShimmer: 0,
                    padding: const EdgeInsets.all(0),
                    isShimmer: widget.isLoading,
                    child: const Divider(height: 0)),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: widget.isLoading,
                        child: Text(
                          "${'Category'.tr}: ${widget.propertyModel.cname} ",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: AppText.titleSmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: widget.isLoading,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.onFavorit();
                              widget.propertyModel.favorite =
                                  !widget.propertyModel.favorite;
                            });
                          },
                          child: SvgPicture.asset(
                            widget.propertyModel.favorite
                                ? 'assets/image2/active_favorite.svg'
                                : 'assets/image/favorite.svg',
                            width: 23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
