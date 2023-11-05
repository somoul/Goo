import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/helper/view_photo.dart';
import 'package:goo_rent/src/home/screen/detail_property_type/search_house_for_rent_screen.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

class CustomSlider extends StatefulWidget {
  final bool loading;
  final List<String> url;
  final Function(int)? onTap;
  final bool canViewImage;
  final bool hasSearch;
  final bool hasIndicator;
  final double aspectRatio;
  const CustomSlider({
    super.key,
    this.loading = false,
    required this.url,
    this.onTap,
    this.canViewImage = true,
    this.hasSearch = false,
    this.hasIndicator = true,
    this.aspectRatio = 1.8,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final CarouselController _controller = CarouselController();
  var _indexSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.loading
            ? AspectRatio(
                aspectRatio: widget.aspectRatio,
                child: Container(
                  color: AppConstant.kPrimaryColor.withOpacity(0.1),
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ))
            : Stack(
                children: [
                  CarouselSlider(
                    items: widget.url
                        .asMap()
                        .entries
                        .map(
                          (item) => SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: GestureDetector(
                              onTap: () {
                                if (widget.onTap != null) {
                                  widget.onTap!(item.key);
                                }
                                if (widget.canViewImage) {
                                  viewPhotoByProvider(imageProviders: [
                                    networkProvider(item.value)
                                  ]);
                                }
                              },
                              child: ImageBuilder(fit: BoxFit.cover)
                                  .network(item.value),
                            ),
                          ),
                        )
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                      padEnds: false,
                      autoPlay: true,
                      enlargeFactor: 0,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 1.8,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _indexSlider = index;
                        });
                      },
                    ),
                  ),
                  if (widget.hasIndicator)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...widget.url.asMap().entries.map(
                              (e) => Container(
                                height: 10,
                                width: _indexSlider != e.key ? 10 : 20,
                                margin: 5.pl,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: _indexSlider == e.key
                                        ? AppConstant.kPrimaryColor
                                        : Colors.white),
                              ),
                            ),
                      ],
                    ).pt(15).pl(10),
                ],
              ),
        if (widget.hasSearch)
          Positioned(
            left: 0,
            right: 0,
            bottom: -22,
            child: _serchBox(widget.loading),
          ),
      ],
    );
  }

  Widget _serchBox(bool loading) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const SearchRentScreen());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppConstant.kPrimaryColor.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(
                2.0,
                2.0,
              ),
            )
          ],
          border: Border.all(
              width: 2,
              color: loading ? Colors.grey[100]! : AppConstant.kPrimaryColor),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            loading
                ? ShimmerBox.wrap(
                    child: SvgPicture.asset('assets/image/search.svg'))
                : SvgPicture.asset('assets/image/search.svg'),
            const SizedBox(width: 10),
            loading
                ? const ShimmerBox(
                    width: 150,
                  )
                : Text("Apartment for business".tr, style: AppText.bodySmall),
            if (loading) const Spacer(),
            loading
                ? const ShimmerBox()
                : Expanded(
                    child: Text("Search".tr,
                        textAlign: TextAlign.end,
                        style: AppText.bodySmall!
                            .copyWith(color: AppConstant.kPrimaryColor)),
                  ),
          ],
        ),
      ),
    );
  }
}
