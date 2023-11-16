import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/screen/detail_property_type/property_detail.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid_card.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

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
      body: Obx(() => _propertyController.isLoadFavorite.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                _propertyController.getFavoriteList();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: _propertyController.isEmptyFavorite
                    ? const Center(
                        child: Text('No Data'),
                      )
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        itemCount: _propertyController
                            .favoriteData.value.propertyList?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 2 / 2.9,
                          mainAxisExtent: 280,
                        ),
                        itemBuilder: (context, index) {
                          var item = _propertyController
                              .favoriteData.value.propertyList?[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPropertyScreen(
                                    id: item.id ?? 0,
                                  ),
                                ), //TabBarDemo
                              );
                            },
                            child: CustomGridCard(
                              propertyModel: item!,
                              isFavorite: item.favorite,
                              onFavorite: () {
                                // widget.propertyList[index].favorite =
                                //     !widget.propertyList[index].favorite;
                                // setState(() {});
                                // widget.propertyController.onFavorit(
                                //     propertyId: '${widget.propertyList[index].id}');
                              },
                            ),
                          );
                        }),
              ),
            )),
    );
  }

  Widget _buildShimer() {
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
                ShimmerBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.35,
                  highlightColor: Colors.grey[100],
                  baseColor: Colors.white,
                ),
                const Positioned(
                  right: 10,
                  top: 10,
                  child: ShimmerBox(height: 20, width: 50),
                )
              ],
            ),
            const ShimmerBox().py(15),
            const Row(
              children: [
                ShimmerBox(width: 60),
                Spacer(),
                ShimmerBox(width: 40),
              ],
            ),
            10.gap,
            Row(
              children: [
                const ShimmerBox(
                  height: 20,
                  width: 20,
                  circle: true,
                ),
                15.gap,
                const ShimmerBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
