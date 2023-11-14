import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
import 'package:goo_rent/theme/color_schemes.g.dart';
import 'package:goo_rent/utils/extension/edge_insets.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';
import '../data/slide_categorie_model/slide_categorie_model.dart';
import '../screen/detail_property_type/detail_property_type_screen.dart';

class CustomCategoryBlock extends StatelessWidget {
  final bool loading;
  final List<SlideCategorieModel> categoryList;

  const CustomCategoryBlock(
      {super.key, required this.categoryList, required this.loading});

  @override
  Widget build(BuildContext context) {
    // CarouselController buttonCarouselController = CarouselController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loading
            ? const ShimmerBox().pt(15).pl(15)
            : Padding(
                padding: 15.px.pt(10),
                child: Text(
                  "Service".tr,
                  style: AppText.titleSmall!.copyWith(
                    color: lightColorScheme.primary,
                  ),
                ),
              ),
        Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 14),
          child: loading
              ? ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ...List.generate(
                      5,
                      (index) => const Padding(
                        padding: EdgeInsets.only(right: 36),
                        child: Column(
                          children: [
                            ShimmerBox(
                              height: 30,
                              width: 30,
                              circle: true,
                            ),
                            Spacer(),
                            ShimmerBox(width: 50),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).pt(5)
              : categoryList.isNotEmpty
                  ? ListView.builder(
                      itemCount: categoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DetailPropertyScreen(),
                            ), //TabBarDemo
                          );
                        },
                        child: _categoryItem(
                            icon: categoryList[index].icon ?? '',
                            title: categoryList[index].name ?? ''),
                      ),
                    )
                  : Center(
                      child: Text(
                        'No Data'.tr,
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
        ),
      ],
    );
  }
}

_categoryItem({required String icon, required String title}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        // CachedNetworkImage(
        //   fit: BoxFit.cover,
        //   placeholder: (context, url) => icon != ''
        //       ? ShimmerBox.wrap(child: ImageBuilder().network(icon))
        //       : const ShimmerBox(height: 30, width: 30, circle: true),
        //   imageUrl: icon,
        //   height: 30,
        // ),
        ImageBuilder(width: 30, height: 30).network(icon),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: AppText.titleSmall!.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.start,
            ),
          ),
        )
      ],
    ),
  );
}
