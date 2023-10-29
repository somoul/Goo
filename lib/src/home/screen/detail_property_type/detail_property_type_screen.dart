import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../cores/constant/app_constant.dart';
import '../../../../cores/constant/app_text.dart';
import '../../controler/animation_background_banner_provider/home_controller.dart';

import '../../controler/detail_property_type_controler.dart';
import 'CustomImage.dart';
import 'bottomSheet_rent_room.dart';
import 'custom_contain_type_rent.dart';
import 'custom_ship_type.dart';

class DetailPropertyScreen extends StatefulWidget {
  const DetailPropertyScreen({super.key});

  @override
  State<DetailPropertyScreen> createState() => _DetailPropertyScreenState();
}

class _DetailPropertyScreenState extends State<DetailPropertyScreen> {
  final homeController = Get.put(HomeController());
  final _detailPropertyController = Get.put(DetailPropertyControler());

  final CarouselController _controller = CarouselController();
  final String description =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";
  int indexImage = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = homeController.listSideBarData
        .map(
          (item) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
              ),
              imageUrl: item.imageUrl!,
            ),
          ),
        )
        .toList();
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     // statusBarColor:
    //     //     AppConstant.kPrimaryColor, //or set color with: Color(0xFF0000FF)
    //     ));
    return Scaffold(
        // backgroundColor: Colors.black12,
        bottomNavigationBar: Container(
          height: 65,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppConstant.paddingLarge,
              right: AppConstant.paddingLarge,
            ),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      showBottomSubmitforRent(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 45, top: 5, right: 45, bottom: 5),
                      child: Text(
                        "ស្នើសុំជួល",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
                const Spacer(),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppConstant.kPrimaryColor.withOpacity(0.15),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/ic_comment.svg',
                      // color: Colors.blue,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff06D6A0).withOpacity(0.12),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/ic_call.svg',
                      // color: Colors.blue,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.amber,
              primary: false,
              pinned: true,
              leading: const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
              ),
              actions: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/image/favorite.svg',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 16),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/ic_send.svg',
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ],
              // title: const Padding(
              //   padding: EdgeInsets.only(top: 30),
              //   child: Text("សោមោុល"),
              // ),
              expandedHeight: 300,
              toolbarHeight: 80,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CarouselSlider(
                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                        padEnds: false,
                        autoPlay: true,
                        enlargeFactor: 0,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        aspectRatio: 1.2,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) {
                          homeController.indexSlider.value = index;
                          setState(() {});
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Row(children: [
                        ...imageSliders.map((e) {
                          int index = imageSliders.indexOf(e);
                          return Container(
                            height: 8.5,
                            width: 8.5,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: homeController.indexSlider.value == index
                                    ? AppConstant.kPrimaryColor
                                    : Colors.white),
                          );
                        }).toList(),
                        // const Spacer(),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("អាគារជួលទួលគោក",
                        style: AppText.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 26)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomShipTypeRent(
                          title: "Apartment",
                          onTap: () {},
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomShipTypeRent(
                          title: "Rent",
                          onTap: () {},
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          CustomContainTypeRentRow(),
                          CustomContainTypeRentRow(),
                          CustomContainTypeRentRow()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      color: Color(0xffEEEEEE),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80")))),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HORM Hy",
                              style: AppText.titleMedium,
                            ),
                            Text(
                              "Owner",
                              style: AppText.bodySmall,
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Overview",
                      style: AppText.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    ReadMoreText(
                      description,
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: 'Read less',
                      style: AppText.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.75)),
                      moreStyle: AppText.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppConstant.kPrimaryColor),
                      lessStyle: AppText.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppConstant.kPrimaryColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "គ្រឿងបរិក្ខារ",
                      style: AppText.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.manual,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 3, crossAxisCount: 4),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return const CustomContainTypeRentColum();
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          "រូបភាព",
                          style: AppText.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "គ្រឿងបរិក្ខារ",
                          style: AppText.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: const Color(0xff21A6F8)),
                        ),
                      ],
                    ),
                    Row(
                        children: testImage.asMap().entries.map((entry) {
                      int index = entry.key;
                      String value = entry.value;

                      _detailPropertyController.indexImage.value =
                          testImage.length - (index + 1);
                      if (index == 0) {
                        return
                            // Expanded(
                            //     flex: 3,
                            //     child:
                            CustomImage(
                          imageUrl: value,
                          // )
                        );
                      } else if (index == 1) {
                        return Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child:
                                //  Expanded(
                                //     flex: 3,
                                // child:
                                CustomImage(
                              imageUrl: value,
                            )
                            // ),
                            );
                      } else if (index == 2) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child:
                              // Expanded(
                              //   flex: 3,
                              //   child:
                              Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              CustomImage(
                                imageUrl: value,
                              ),
                              Text(
                                "${_detailPropertyController.indexImage.value}+",
                                style: AppText.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          // ),
                        );
                      } else {
                        return const SizedBox(
                          height: 0,
                          width: 0,
                        );
                      }
                    }).toList()),
                  ],
                ),
              )
            ]))
          ],
        ));
  }
}

List<String> testImage = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPfO37MK81JIyR1ptwqr_vYO3w4VR-iC2wqQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIcxm1tSJphluNimxurlape3Q9nhLcX3_apA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPfO37MK81JIyR1ptwqr_vYO3w4VR-iC2wqQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIcxm1tSJphluNimxurlape3Q9nhLcX3_apA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIcxm1tSJphluNimxurlape3Q9nhLcX3_apA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPfO37MK81JIyR1ptwqr_vYO3w4VR-iC2wqQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIcxm1tSJphluNimxurlape3Q9nhLcX3_apA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIcxm1tSJphluNimxurlape3Q9nhLcX3_apA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPfO37MK81JIyR1ptwqr_vYO3w4VR-iC2wqQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIcxm1tSJphluNimxurlape3Q9nhLcX3_apA&usqp=CAU",
];
