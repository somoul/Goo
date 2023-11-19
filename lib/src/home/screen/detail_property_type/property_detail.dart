import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/favorite/data/property_detail.dart';
import 'package:goo_rent/src/widgets/slider.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';
import 'package:readmore/readmore.dart';
import '../../controler/animation_background_banner_provider/home_controller.dart';
import '../../controler/detail_property_type_controler.dart';
import 'custom_image.dart';
import 'bottomSheet_rent_room.dart';
import 'custom_contain_type_rent.dart';
import 'custom_ship_type.dart';

class DetailPropertyScreen extends StatefulWidget {
  final int id;
  const DetailPropertyScreen({super.key, required this.id});

  @override
  State<DetailPropertyScreen> createState() => _DetailPropertyScreenState();
}

class _DetailPropertyScreenState extends State<DetailPropertyScreen> {
  final _homeCon = Get.put(HomeController());
  final _detailCon = Get.put(DetailController());
  @override
  void initState() {
    postFrameCallback(() async {
      await _detailCon.getDetail(id: widget.id);
    });
    super.initState();
  }

  PropertyModel get _property => _detailCon.propertyDetail.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              CustomScrollView(
                slivers: [
                  // MediaQuery.of(context).padding.top.gap.sliver,
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.blue,
                    // foregroundColor: Colors.amber,
                    primary: false,
                    pinned: true,
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
                    expandedHeight: 230,
                    toolbarHeight: 80,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      background: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          CustomSlider(
                            url: _detailCon.propertyDetail.value.attachments ??
                                [],
                            canViewImage: true,
                            hasIndicator: false,
                            // aspectRatio: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Column(children: [
                    Padding(
                      padding: 16.p,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${_property.title}",
                              style: AppText.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 20)),
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
                          15.gap,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: ImageBuilder(fit: BoxFit.cover)
                                        .network(_property.user?.avatar ?? ''),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${_property.user?.firstName ?? ''} ${_property.user?.lastName ?? ''}",
                                    style: AppText.titleMedium,
                                  ),
                                  Text(
                                    "${"ID".tr}: ${_property.user?.id ?? ''}",
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
                            "Overview".tr,
                            style: AppText.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          ReadMoreText(
                            _property.description ?? '',
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more'.tr,
                            trimExpandedText: 'See less'.tr,
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
                            "Accessories".tr,
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
                          ).pb(15),
                          if (_property.attachments?.isNotEmpty ?? false)
                            Row(
                                children: _property.attachments!
                                    .asMap()
                                    .entries
                                    .map((entry) {
                              int index = entry.key;
                              String value = entry.value;

                              _detailCon.indexImage.value =
                                  _property.attachments?.length ??
                                      0 - (index + 1);
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
                                        "${_detailCon.indexImage.value}+",
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
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: (MediaQuery.of(context).padding.top / 2) + 15,
                  left: 15,
                ),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white54,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              )
            ],
          )),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.2,
                color: Colors.grey,
              ),
            ),
          ),
          padding: 15.pt,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showBottomSubmitforRent(context);
                    },
                    child: Text(
                      "Request Rent".tr,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              25.gap,
              Container(
                height: 50,
                width: 50,
                padding: 12.p,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppConstant.kPrimaryColor.withOpacity(0.15),
                ),
                child: ImageBuilder().asset('assets/icons/ic_comment.svg'),
              ),
              25.gap,
              Container(
                height: 50,
                width: 50,
                padding: 12.p,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xff06D6A0).withOpacity(0.15),
                ),
                child: ImageBuilder().asset('assets/icons/ic_call.svg'),
              ),
            ],
          ).px(20),
        ).pb(15),
      ),
    );
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
