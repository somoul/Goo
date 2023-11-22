import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

class CustomGridCard extends StatelessWidget {
  final PropertyModel propertyModel;
  final Function onFavorite;
  final bool isFavorite;
  const CustomGridCard({
    super.key,
    required this.propertyModel,
    required this.onFavorite,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: 12.p,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.width * 0.37,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ImageBuilder(fit: BoxFit.cover)
                            .network(propertyModel.attachments?[0] ?? ''),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
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
                        ))
                  ],
                ),
                8.gap,
                Text(
                  '${propertyModel.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.titleSmall!.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ID: ${propertyModel.id}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.titleSmall!
                            .copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${propertyModel.price}\$/',
                      style: AppText.titleSmall!.copyWith(
                          fontSize: 14, color: AppConstant.kPrimaryColor),
                    ),
                    Text(
                      'Month'.tr,
                      style: AppText.titleSmall!.copyWith(fontSize: 12),
                    )
                  ],
                ),
                10.gap,
                const Divider(height: 0, thickness: 0.5),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
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
              IconButton(
                splashRadius: 30,
                onPressed: () => onFavorite(),
                icon: SvgPicture.asset(
                  isFavorite
                      ? 'assets/image2/active_favorite.svg'
                      : 'assets/image/favorite.svg',
                  width: 22,
                ),
              ),
              4.gap,
            ],
          ).pl(12),
        ],
      ),
    );
  }
}
