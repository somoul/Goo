import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

class CustomPopularBlock extends StatelessWidget {
  final List<PropertyModel> popularList;
  final bool loading;
  const CustomPopularBlock(
      {Key? key,
      this.axis = Axis.horizontal,
      required this.popularList,
      required this.loading})
      : super(key: key);
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    // return Container();
    // final pageController = PageController(viewportFraction: 0.900);

    return
        // !loading && popularList.isEmpty
        //     ? const SizedBox()
        //     :
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppConstant.paddingLarge),
          child: loading
              ? const ShimmerBox(height: 14)
              : Text('Popular'.tr, style: AppText.titleSmall),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: popularList.isEmpty && !loading ? 70 : 285,
          width: double.infinity,
          child: loading
              ? ListView(
                  scrollDirection: Axis.horizontal,
                  padding: 16.px,
                  children: [
                    ...List.generate(3, (index) => _buildShimmer()),
                  ],
                )
              : popularList.isEmpty
                  ? Center(
                      child: Text(
                        'No Data'.tr,
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    )
                  : ListView.builder(
                      itemCount: popularList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        PropertyModel item = popularList[index];
                        return Container(
                          width: 300,
                          margin: const EdgeInsets.only(right: 15, bottom: 8),
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
                                    height: 170,
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
                                        horizontal: 15, vertical: 5),
                                    child: Text("${item.title}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppText.bodyMedium),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.yellow[600]!,
                                            size: 14),
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
                                  const SizedBox(height: 5),
                                  Divider(
                                    height: 0,
                                    thickness: 0.5,
                                    color: Colors.grey[200]!,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 15),
                                      SvgPicture.asset('assets/image/beds.svg'),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                          "4 បន្ទប់គេង",
                                          style: AppText.bodySmall!.copyWith(
                                              color: const Color(0xff979797)),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      item.data?.size == null
                                          ? const SizedBox()
                                          : Image.asset(
                                              'assets/icons/rom_cm.png',
                                              height: 13,
                                              width: 13,
                                              color: const Color(0xff979797),
                                            ),
                                      item.data?.size == null
                                          ? const SizedBox()
                                          : const SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                          "${item.data?.size ?? ''}",
                                          style: AppText.bodySmall!.copyWith(
                                              color: const Color(0xff979797)),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                              'assets/image/favorite.svg'),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
        ),
      ],
    ).pt(10);
  }
}

///________Shimmer
Widget _buildShimmer() {
  return Container(
    width: 300,
    margin: const EdgeInsets.only(right: 15, bottom: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[200]!,
            offset: const Offset(2, 2),
          )
        ]),
    child: Column(
      children: [
        Stack(
          children: [
            ShimmerBox(
              height: 170,
              width: 300,
              borderRadius: 8,
              highlightColor: Colors.grey[100],
              baseColor: Colors.white,
            ),
            const Positioned(
              top: 10,
              right: 10,
              child: ShimmerBox(width: 70, height: 25),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.ideographic,
          children: [
            Padding(
              padding: 15.p,
              child: const ShimmerBox(),
            ),
            Padding(
              padding: 15.px,
              child: Row(
                children: [
                  ShimmerBox.wrap(
                    child:
                        Icon(Icons.star, color: Colors.yellow[600]!, size: 14),
                  ),
                  6.gap,
                  const ShimmerBox(),
                  const Spacer(),
                  const ShimmerBox(),
                  const SizedBox(width: 15),
                ],
              ),
            ),
            10.gap,
            Divider(
              height: 0,
              thickness: 0.5,
              color: Colors.grey[200]!,
            ),
            10.gap,
            Row(
              children: [
                15.gap,
                const ShimmerBox(),
                const Spacer(),
                const ShimmerBox(),
                15.gap,
              ],
            )
          ],
        )
      ],
    ),
  );
}
