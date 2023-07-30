import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/theme/color_schemes.g.dart';
import '../data/slide_categorie_model/slide_categorie_model.dart';

class CustomServiceBlock extends StatelessWidget {
  final List<SlideCategorieModel> categoryList;
  const CustomServiceBlock({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    // CarouselController buttonCarouselController = CarouselController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
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
          margin: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemCount: categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: _categoryItem(
                  categoryList[index].icon!, categoryList[index].name ?? ''),
            ),
          ),
        ),
      ],
    );
  }
}

_categoryItem(String icon, String title) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
    child: Column(
      children: [
        CachedNetworkImage(
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
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
