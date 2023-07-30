import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/src/property_detail/data/popular_property.dart';

class CustomPopularBlock extends StatelessWidget {
  final List<PopularModel> popularList;
  const CustomPopularBlock(
      {Key? key, this.axis = Axis.horizontal, required this.popularList})
      : super(key: key);
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    // return Container();
    // final pageController = PageController(viewportFraction: 0.900);

    return popularList.isEmpty
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: AppConstant.paddingLarge),
                child: Text('Popular'.tr, style: AppText.titleSmall),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 320,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: popularList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      PopularModel item = popularList[index];
                      return Container(
                        width: 350,
                        margin: const EdgeInsets.only(right: 20, bottom: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.grey[300]!,
                                  offset: const Offset(2, 2))
                            ]),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/icons/Rectangle2416.png'),
                                      )),
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
                                            // Image.asset(
                                            //   "assets/icons/ icons_visibility.png",
                                            //   width: 10,
                                            //   height: 10,
                                            // ),
                                            const SizedBox(width: 3),
                                            Text(
                                              "193",
                                              style: AppText.titleSmall!
                                                  .copyWith(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppConstant.padding,
                                      vertical: 4),
                                  child: Text("${item.title}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppText.bodyMedium),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppConstant.padding,
                                      vertical: 4),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 5),
                                      Icon(Icons.star,
                                          color: Colors.yellow[600]!, size: 14),
                                      // Image.asset("assets/icons/ic_star.svg"),
                                      Text(
                                        "4.7",
                                        style: AppText.bodyMedium!.copyWith(
                                            color: const Color(0xFF21A6F8)),
                                      ),
                                      const SizedBox(width: 3),
                                      Icon(Icons.circle,
                                          color: Colors.grey[300], size: 5),
                                      const SizedBox(width: 3),
                                      Expanded(
                                        child: Text(
                                          '150km',
                                          overflow: TextOverflow
                                              .ellipsis, //  "${item.distance}",
                                          maxLines: 1,
                                          style: AppText.bodyMedium!.copyWith(
                                              color: const Color(0xFF979797)),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        "\$${item.price}/",
                                        style: AppText.titleSmall!.copyWith(
                                            color: const Color(0xFF21A6F8)),
                                      ),
                                      Text(
                                        "Month".tr,
                                        style: AppText.bodySmall!
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  color: Color(0xffF3F3F3),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: SvgPicture.asset(
                                          'assets/image/beds.svg'),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        "4 បន្ទប់គេង",
                                        style: AppText.bodySmall!.copyWith(
                                            color: const Color(0xff979797)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    item.size == null
                                        ? const SizedBox()
                                        : Image.asset(
                                            'assets/icons/rom_cm.png',
                                            height: 13,
                                            width: 13,
                                            color: const Color(0xff979797),
                                          ),
                                    item.size == null
                                        ? const SizedBox()
                                        : const SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        item.size ?? '',
                                        style: AppText.bodySmall!.copyWith(
                                            color: const Color(0xff979797)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          'assets/image/favorite.svg'),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
  }
}
