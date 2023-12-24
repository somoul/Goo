import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

import '../../../home/widget/CustomDefaultShimmer.dart';

class CustomGridCard extends StatelessWidget {
  final PropertyModel propertyModel;
  final Function onFavorite;
  final bool isFavorite;
  final bool isLoading;

  const CustomGridCard({
    super.key,
    required this.propertyModel,
    required this.onFavorite,
    this.isFavorite = false,
    this.isLoading = true,
  });

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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                CustomDefaultShimmer(
                  widthShimmer: double.infinity,
                  heightShimmer: double.infinity,
                  padding: const EdgeInsets.all(0),
                  isShimmer: isLoading,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: ImageBuilder(fit: BoxFit.cover, height: 162)
                          .network(propertyModel.attachments?[0] ?? ''),
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
                      isShimmer: isLoading,
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
                              '${propertyModel.visit}',
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
                      isShimmer: isLoading,
                      child: Text(
                        'ID: ${propertyModel.id}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.titleSmall!
                            .copyWith(fontSize: 12, color: Colors.white70),
                      ),
                    ))
              ],
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
                isShimmer: isLoading,
                child: Text(
                  '${propertyModel.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.titleSmall!.copyWith(fontSize: 14),
                ).px(14),
              ),
              const SizedBox(height: 6),
              CustomDefaultShimmer(
                widthShimmer: double.infinity,
                heightShimmer: 16,
                padding: const EdgeInsets.only(left: 13, right: 13),
                isShimmer: isLoading,
                child: Row(
                  children: [
                    SizedBox(
                      height: 18,
                      width: 18,
                      child: ImageBuilder().asset("assets/image2/icon_map.svg"),
                    ),
                    6.gap,
                    Expanded(
                      child: Text(
                        '${propertyModel.distance}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.bodySmall!.copyWith(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '\$${propertyModel.price}/',
                      style: AppText.titleSmall!.copyWith(
                          fontSize: 14, color: AppConstant.kPrimaryColor),
                    ),
                    Text(
                      'Month'.tr,
                      style: AppText.titleSmall!.copyWith(fontSize: 12),
                    )
                  ],
                ).px(14),
              ),
              const SizedBox(height: 8),
              CustomDefaultShimmer(
                  widthShimmer: 0,
                  heightShimmer: 0,
                  padding: const EdgeInsets.only(left: 13, top: 13, right: 13),
                  isShimmer: isLoading,
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
                        isShimmer: isLoading,
                        child: Text(
                          'Category'.tr,
                          maxLines: 1,
                          style: AppText.titleSmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: isLoading,
                        child: Text(
                          ": ${propertyModel.cname} ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.titleSmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: isLoading,
                        child: GestureDetector(
                          onTap: () {
                            onFavorite();
                          },
                          child: SvgPicture.asset(
                            isFavorite
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

class PropertyCartOne extends StatelessWidget {
  final PropertyModel propertyModel;
  final Function onFavorite;
  final bool isFavorite;
  final bool isLoading;
  const PropertyCartOne({
    super.key,
    required this.propertyModel,
    required this.onFavorite,
    this.isFavorite = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
                    isShimmer: isLoading,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: ImageBuilder(
                              fit: BoxFit.cover, height: 110, width: 110)
                          .network(propertyModel.attachments?[0] ?? ''),
                    ),
                  ),
                  Positioned(
                    left: 6.5,
                    bottom: 6,
                    child: CustomDefaultShimmer(
                      widthShimmer: 50,
                      heightShimmer: 16,
                      padding: const EdgeInsets.all(0),
                      isShimmer: isLoading,
                      child: Text(
                        'ID: ${propertyModel.id}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.titleSmall!
                            .copyWith(fontSize: 12, color: Colors.white70),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 6.5,
                      top: 6.5,
                      child: CustomDefaultShimmer(
                        widthShimmer: 50,
                        heightShimmer: 20,
                        padding: const EdgeInsets.all(0),
                        isShimmer: isLoading,
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
                                '${propertyModel.visit}',
                                style: AppText.bodySmall!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ).p(12),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  const Spacer(),
                  CustomDefaultShimmer(
                    widthShimmer: double.infinity,
                    heightShimmer: 18,
                    padding: const EdgeInsets.all(0),
                    isShimmer: isLoading,
                    child: Text(
                      '${propertyModel.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.titleSmall!.copyWith(fontSize: 14),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: isLoading,
                        child: Text(
                          '\$${propertyModel.price}/',
                          style: AppText.titleSmall!.copyWith(
                              fontSize: 14, color: AppConstant.kPrimaryColor),
                        ),
                      ),
                      CustomDefaultShimmer(
                        widthShimmer: 30,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: isLoading,
                        child: Text(
                          'Month'.tr,
                          style: AppText.titleSmall!.copyWith(fontSize: 12),
                        ),
                      ),
                      const Spacer(),
                      CustomDefaultShimmer(
                        widthShimmer: 20,
                        heightShimmer: 16,
                        padding: const EdgeInsets.all(0),
                        isShimmer: isLoading,
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: ImageBuilder()
                              .asset("assets/image2/icon_map.svg"),
                        ).p(5),
                      ),
                      Expanded(
                        child: CustomDefaultShimmer(
                          widthShimmer: 20,
                          heightShimmer: 16,
                          padding: const EdgeInsets.all(0),
                          isShimmer: isLoading,
                          child: Text(
                            '${propertyModel.distance}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                AppText.bodySmall!.copyWith(color: Colors.grey),
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
                      isShimmer: isLoading,
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
                          isShimmer: isLoading,
                          child: Text(
                            "${'Category'.tr}:${propertyModel.cname} ",
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: AppText.titleSmall!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomDefaultShimmer(
                          widthShimmer: 20,
                          heightShimmer: 16,
                          padding: const EdgeInsets.all(0),
                          isShimmer: isLoading,
                          child: GestureDetector(
                            onTap: () {
                              onFavorite();
                            },
                            child: SvgPicture.asset(
                              isFavorite
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
      ),
    );
  }
}
