import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';

class CustomBannerListWidget extends StatelessWidget {
  const CustomBannerListWidget({Key? key, this.axis = Axis.horizontal})
      : super(key: key);
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    // return Container();
    // final pageController = PageController(viewportFraction: 0.900);

    return SizedBox(
      height: 320,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
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
                          image: AssetImage('assets/icons/Rectangle2416.png'),
                        )),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        // height: 20,
                        // width: 20,

                        decoration: BoxDecoration(
                            color: const Color(0xffF0F0F0),
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 4, right: 8, bottom: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/ icons_visibility.png",
                                width: 10,
                                height: 10,
                              ),
                              Text(
                                "193",
                                style: AppText.titleSmall!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
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
                        horizontal: AppConstant.padding, vertical: 4),
                    child: Text(
                        "ផ្ទះអាជីវកម្មសម្រាប់ជួលផ្ទះអាជីវកម្មសម្រាប់ជួលផ្ទះអាជីវកម្មសម្រាប់ជួល",
                        overflow: TextOverflow.ellipsis,
                        style: AppText.bodyMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstant.padding, vertical: 4),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Image.asset(
                          "assets/icons/love.png",
                          height: 8,
                        ),
                        // Image.asset("assets/icons/ic_star.svg"),
                        Text(
                          "4.7",
                          style: AppText.bodyMedium!
                              .copyWith(color: const Color(0xFF21A6F8)),
                        ),
                        Text(
                          ".536km",
                          style: AppText.bodyMedium!
                              .copyWith(color: const Color(0xFF979797)),
                        ),
                        const Spacer(),
                        Text(
                          "\$1200",
                          style: AppText.bodyMedium!
                              .copyWith(color: const Color(0xFF21A6F8)),
                        ),
                        Text(
                          "/1ខែ",
                          style: AppText.bodyMedium!
                              .copyWith(color: Colors.black, fontSize: 12),
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
                        child: Image.asset(
                          'assets/image2/make_group.png',
                          height: 13,
                          width: 13,
                          color: const Color(0xff979797),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "4 បន្ទប់គេង",
                          style: AppText.bodySmall!
                              .copyWith(color: const Color(0xff979797)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Image.asset(
                        'assets/icons/rom_cm.png',
                        height: 13,
                        width: 13,
                        color: const Color(0xff979797),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "3x5m",
                          style: AppText.bodySmall!
                              .copyWith(color: const Color(0xff979797)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Color(0xff979797),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> _bannerList = [
  'assets/icons/Slide.png',
  'assets/icons/Promotion.png',
  'assets/icons/Slide1.png',
  'assets/icons/Slide2.png',
  'assets/icons/Slide3.png',
];
