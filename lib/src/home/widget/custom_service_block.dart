import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';

import '../data/slide_categorie_model/slide_categorie_model.dart';

class CustomServiceBlock extends StatelessWidget {
  final List<SlideCategorieModel> categoryList;
  const CustomServiceBlock({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();

    return Column(
      children: [
        // TextButton(
        //     onPressed: () {},
        //     child:
        Text(
          'សេវាកម្ម',
          style: AppText.titleSmall!.copyWith(
            fontSize: 15,
            color: AppConstant.kPrimaryColor.withOpacity(0.75),
            fontWeight: FontWeight.w300,
          ),
          // )
        ),

        SizedBox(
          height: 80,
          width: double.infinity,
          child:
              // CarouselSlider(
              //   items: categoryList
              //       .map((item) => Container(
              //           height: 80,
              //           width: double.infinity,
              //           color: Colors.green,
              //           child: Row(
              //             children: [
              //               const Spacer(),
              //               GestureDetector(
              //                   onTap: () {
              //                     print("=================1111========");
              //                   },
              //                   child: Text(item.iconName)),
              //               const Spacer(),
              //               const Spacer(),
              //               GestureDetector(
              //                   onTap: () {
              //                     print("=================22222========");
              //                   },
              //                   child: Text(item.iconName)),
              //               const Spacer(),
              //               GestureDetector(
              //                   onTap: () {
              //                     print("=================1111========");
              //                   },
              //                   child: Text(item.iconName)),
              //               const Spacer(),
              //               const Spacer(),
              //               GestureDetector(
              //                   onTap: () {
              //                     print("=================22222========");
              //                   },
              //                   child: Text(item.iconName)),
              //               const Spacer(),
              //             ],
              //           )))
              //       .toList(),
              //   carouselController: buttonCarouselController,
              //   options: CarouselOptions(
              //     autoPlay: false,
              //     enlargeCenterPage: true,
              //     viewportFraction: 0.9,
              //     aspectRatio: 2.0,
              //     initialPage: 0,
              //   ),
              // ),

              ListView.builder(
            itemCount: categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      imageUrl: categoryList[index].icon!,
                      height: 35,
                    ),

                    // Image.network(
                    //   categoryList[index].icon!,
                    //   height: 35,
                    // ),
                    const Spacer(),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        categoryList[index].name!,
                        style: AppText.titleSmall!.copyWith(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
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
