import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/data/popular_property.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  final _propertyController = Get.put(PropertyController());

  @override
  void initState() {
    _propertyController.getFavoriteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'.tr),
      ),
      body: Obx(
        () => _propertyController.isLoadFavorite.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _propertyController.isEmptyFavorite
                ? const Center(
                    child: Text('No Data'),
                  )
                : GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: false,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    itemCount:
                        _propertyController.favoriteData.value.data?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 2 / 2.9,
                      mainAxisExtent: 260,
                    ),
                    itemBuilder: (context, index) {
                      var propertyModel =
                          _propertyController.favoriteData.value.data?[index] ??
                              PopularModel();
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.width *
                                        0.35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            propertyModel.thumbnail ?? ''),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      right: 10,
                                      top: 10,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xFFFFFFFF),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.remove_red_eye,
                                                size: 14),
                                            const SizedBox(width: 3),
                                            Text(
                                              '${propertyModel.like}',
                                              style:
                                                  AppText.bodySmall!.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                              const SizedBox(height: 5),
                              // Text(
                              //   '${propertyModel.title}',
                              //   maxLines: 1,
                              //   overflow: TextOverflow.ellipsis,
                              //   style: AppText.titleSmall!.copyWith(fontSize: 14),
                              // ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 8,
                                  ),
                                  Text(
                                    '4.5',
                                    style: AppText.titleSmall!.copyWith(
                                        fontSize: 13,
                                        color: AppConstant.kPrimaryColor),
                                  ),
                                  const SizedBox(width: 3),
                                  Icon(Icons.circle,
                                      size: 5, color: Colors.grey[300]!),
                                  const SizedBox(width: 3),
                                  Expanded(
                                    child: Text(
                                      '{propertyModel.distance}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppText.titleSmall!.copyWith(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    '${propertyModel.price}/',
                                    style: AppText.titleSmall!.copyWith(
                                        fontSize: 14,
                                        color: AppConstant.kPrimaryColor),
                                  ),
                                  Text(
                                    'Month'.tr,
                                    style: AppText.titleSmall!
                                        .copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              const Divider(height: 5, thickness: 0.5),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/image/beds.svg'),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      '4 បន្ទប់គេង',
                                      style: AppText.bodySmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: SvgPicture.asset(
                                      'assets/image/favorite.svg',
                                      width: 22,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
