import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/theme/color_schemes.g.dart';
import '../data/slide_categorie_model/slide_categorie_model.dart';

class CustomServiceBlock extends StatelessWidget {
  final List<SlideCategorieModel> categoryList;
  const CustomServiceBlock({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Text(
            'សេវាកម្ម',
            style: AppText.titleSmall!.copyWith(
                color: lightColorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
        Container(
          height: 63,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 6),
          child: ListView.builder(
            itemCount: categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      imageUrl: categoryList[index].icon!,
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          categoryList[index].name!,
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
