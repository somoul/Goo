import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/theme/color_schemes.g.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
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
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Service',
            style: AppText.titleSmall!.copyWith(
                color: lightColorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
        Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 14),
          child: loading
              ? ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                )
              : ListView.builder(
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailPropertyScreen(),
                        ), //TabBarDemo
                      );
                    },
                    child: _categoryItem(categoryList[index].icon!,
                        categoryList[index].name ?? ''),
                  ),
                ),
        ),
      ],
    );
  }
}

_categoryItem(String icon, String title) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        CachedNetworkImage(
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
            ),
          ),
          imageUrl: icon,
          height: 30,
        ),
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
