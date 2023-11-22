import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/helper/general.dart';
import 'package:goo_rent/helper/image_builder.dart';
import 'package:goo_rent/src/favorite/data/property_detail.dart';
import 'package:goo_rent/src/post_property/controller/post_property_controller.dart';
import 'package:goo_rent/src/post_property/data/accessory_model.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
import 'package:goo_rent/utils/extension/edge_insets.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';
import 'package:readmore/readmore.dart';
import '../../controler/detail_property_type_controler.dart';
import 'accessory_item.dart';

class DetailPropertyScreen extends StatefulWidget {
  final int id;
  const DetailPropertyScreen({super.key, required this.id});

  @override
  State<DetailPropertyScreen> createState() => _DetailPropertyScreenState();
}

class _DetailPropertyScreenState extends State<DetailPropertyScreen> {
  final _detailCon = Get.put(DetailController());
  final _postPropertyCon = Get.put(PostPropertyController());
  @override
  void initState() {
    postFrameCallback(() async {
      await _detailCon.getDetail(id: widget.id);
    });
    super.initState();
  }

  final CarouselController _controller = CarouselController();
  var _indexSlider = 0;
  bool loading = false;
  PropertyModel get _property => _detailCon.propertyDetail.value;

  Map<String, dynamic> get jsonFields => _property.category?.field ?? {};
  Map<String, dynamic> get jsonData => _property.data;

  // List<String> get _getFields => jsonFields.entries.map((e) => e.key).toList();
  List<String> get _getData => jsonData.entries.map((e) => e.key).toList();

  List<AccessoryModel> get _getAccessories {
    List<AccessoryModel> accessories = [];
    for (var element in _postPropertyCon.accessoryData) {
      if (_property.accessoryId?.contains(element.id) ?? false) {
        accessories.add(element);
      }
    }
    return accessories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _property.category?.name ?? "N/A",
          style: AppText.titleLarge!.copyWith(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _detailCon.getDetail(id: widget.id);
        },
        child: Obx(() => SingleChildScrollView(
              physics: _detailCon.isLoading.value
                  ? const NeverScrollableScrollPhysics()
                  : null,
              child: Column(
                children: [
                  _buildSlider(),
                  _detailCon.isLoading.value
                      ? _buildShimmer()
                      : Padding(
                          padding: 15.p,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildPostAddressBlock(),
                              _buildVariant(),
                              _buildAccessories(),
                              _buildOverView(),
                            ],
                          ),
                        ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: SafeArea(
        child: Obx(
          () => Container(
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
                      onPressed: _detailCon.isLoading.value ? null : () {},
                      child: Text(
                        "Request Rent".tr,
                        style: const TextStyle(color: Colors.white),
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
      ),
    );
  }

  Widget _buildSlider() {
    var attachments = _detailCon.propertyDetail.value.attachments ?? [];
    return Obx(
      () => Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              _detailCon.isLoading.value
                  ? AspectRatio(
                      aspectRatio: 1.7,
                      child: Container(
                        color: AppConstant.kPrimaryColor.withOpacity(0.1),
                        child: const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                    )
                  : Stack(
                      children: [
                        CarouselSlider(
                          items: attachments
                              .asMap()
                              .entries
                              .map(
                                (item) => SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ImageBuilder(
                                    fit: BoxFit.cover,
                                    canView: true,
                                  ).network(item.value),
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
                            aspectRatio: 1.7,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _indexSlider = index;
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: 3.py.px(6),
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.remove_red_eye),
                              5.gap,
                              Text(
                                "${_property.visit ?? ''}",
                                style: AppText.titleSmall,
                              ),
                            ],
                          ),
                        ).pt(15).pl(10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     ...attachments.asMap().entries.map(
                        //           (e) =>
                        //            Container(
                        //             height: 10,
                        //             width: _indexSlider != e.key ? 10 : 20,
                        //             margin: 5.pl,
                        //             decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 color: _indexSlider == e.key
                        //                     ? AppConstant.kPrimaryColor
                        //                     : Colors.white),
                        //           ),
                        //         ),
                        //   ],
                        // ).pt(15).pl(10),
                      ],
                    ),
            ],
          ),
          15.gap,
          SizedBox(
            width: double.infinity,
            height: 115,
            child: _detailCon.isLoading.value
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      3,
                      (index) => ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 110,
                          width: 110,
                          child: const ShimmerBox(),
                        ),
                      ).pr(20),
                    ),
                  ).pl(15)
                : ListView(
                    scrollDirection: Axis.horizontal,
                    padding: 15.px,
                    children: attachments
                        .asMap()
                        .entries
                        .map(
                          (e) => Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.5,
                                color: _indexSlider == e.key
                                    ? AppConstant.kPrimaryColor
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _indexSlider = e.key;
                                  });
                                  _controller.jumpToPage(_indexSlider);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 110,
                                  width: 110,
                                  child: ImageBuilder(fit: BoxFit.cover)
                                      .network(e.value),
                                ),
                              ),
                            ),
                          ).pr(20),
                        )
                        .toList(),
                  ),
          )
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return Column(
      children: [
        const Row(
          children: [
            ShimmerBox(
              width: 260,
              height: 30,
            ),
          ],
        ),
        15.gap,
        Row(
          children: [
            const Expanded(
              flex: 3,
              child: ShimmerBox(height: 20),
            ),
            15.gap,
            const Expanded(
              flex: 5,
              child: ShimmerBox(height: 20),
            ),
            15.gap,
            const Expanded(
              flex: 2,
              child: ShimmerBox(height: 20),
            ),
          ],
        ),
        20.gap,
        ...List.generate(
          3,
          (index) => Column(
            children: [
              10.gap,
              Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: ShimmerBox(height: 50),
                  ),
                  15.gap,
                  const Expanded(
                    flex: 3,
                    child: ShimmerBox(height: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ).p(15);
  }

  Widget _buildPostAddressBlock() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_property.title != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  _property.title ?? "",
                  style: AppText.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              15.gap,
              SizedBox(
                height: 50,
                width: 50,
                child: IconButton(
                  splashRadius: 45,
                  onPressed: () {
                    _detailCon.propertyDetail.value.favorite =
                        !_detailCon.propertyDetail.value.favorite;
                    setState(() {});
                    _detailCon.onFavorit(
                      propertyId: _detailCon.propertyDetail.value.id.toString(),
                    );
                  },
                  icon: ImageBuilder().asset(
                    _property.favorite
                        ? 'assets/image2/active_favorite.svg'
                        : 'assets/image/favorite.svg',
                  ),
                ),
              ),
            ],
          ),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageBuilder().asset("assets/image2/icon_map.svg"),
                  10.gap,
                  Text(
                    _property.distance ?? "N/A",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey[500]),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _property.price != null ? "${_property.price}/" : "N/A",
                    style: AppText.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppConstant.kPrimaryColor,
                    ),
                  ),
                  Text("Month".tr,
                      style: AppText.titleLarge!
                          .copyWith(fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        splashRadius: 45,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: AppConstant.kPrimaryColor,
                        )),
                  ).pr(5)
                ],
              ),
            ),
          ],
        ).py(10),
        const Divider(height: 0),
        10.gap,
        Text(
          "Property Location".tr,
          style: AppText.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        10.gap,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              child: SvgPicture.asset(
                'assets/icons/location.svg',
                fit: BoxFit.contain,
                color: Colors.grey,
                width: 24,
              ),
            ),
            6.gap,
            Expanded(
              child: Text(
                _property.address ?? 'N/A',
                style: AppText.bodyLarge,
              ).pb(10),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVariant() {
    return Column(
      children: [
        const Divider(height: 0),
        20.gap,
        Column(
          children: _getData.map((element) {
            if (jsonFields.containsKey(element)) {
              var display = jsonFields[element]?["required"] ?? false;
              if (!display) {
                return 0.gap;
              }
              return _buildSpecsItem(
                label: langCode == "km"
                    ? "${jsonFields[element]?["alias"] ?? ""}"
                    : jsonFields[element]?["label"] ?? '',
                value: jsonFields[element]?["placeholder"] ?? 'N/A',
              );
            }
            return 0.gap;
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSpecsItem({
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            padding: 10.p,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              label,
              style: AppText.bodyMedium,
            ),
          ),
        ),
        20.gap,
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: AppText.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
        )
      ],
    ).pb(10);
  }

  Widget _buildAccessories() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.gap,
        const Divider(height: 0),
        10.gap,
        Text(
          "Accessories".tr,
          style: AppText.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        if (_getAccessories.isNotEmpty)
          GridView.builder(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 3,
              crossAxisCount: 4,
            ),
            itemCount: _getAccessories.length,
            itemBuilder: (BuildContext context, int index) {
              return AccessoryItem(accessoryModel: _getAccessories[index]);
            },
          )
        else
          SizedBox(
            height: 140,
            width: double.infinity,
            child: Center(
              child: Text(
                'No Accessory'.tr,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          )
      ],
    );
  }

  Widget _buildOverView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.gap,
        const Divider(height: 0),
        10.gap,
        Text(
          "Overview".tr,
          style: AppText.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        10.gap,
        ReadMoreText(
          _property.description ?? '',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: '   ${"Read more".tr}',
          trimExpandedText: '\n${"See less".tr}',
          style: AppText.bodyMedium,
          moreStyle: AppText.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppConstant.kPrimaryColor),
          lessStyle: AppText.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppConstant.kPrimaryColor),
        ),
        20.gap,
      ],
    );
  }
}
