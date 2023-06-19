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
      height: 340,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppConstant.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text("ផ្ទះអាជីវកម្មសម្រាប់ជួល",
                              overflow: TextOverflow.ellipsis,
                              style: AppText.bodyMedium),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "\$1200/1ខែ",
                          style: AppText.bodyMedium!
                              .copyWith(color: const Color(0xFF21A6F8)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/image2/make_group.png',
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "ប្រហែល15នាទី",
                            style: AppText.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text("Code: 983883", style: AppText.bodyMedium),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            print('Fav');
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Image.asset(
                          'assets/icons/rom_cm.png',
                          height: 14,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "3x5m",
                            style: AppText.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
