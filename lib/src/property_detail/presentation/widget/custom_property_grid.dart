import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/home/screen/detail_property_type/property_detail.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid_card.dart';
import 'package:goo_rent/src/widgets/shimmer_box.dart';
import 'package:goo_rent/utils/extension/edge_insets.dart';
import 'package:goo_rent/utils/extension/num.dart';
import 'package:goo_rent/utils/extension/widget.dart';

class CustomPropertyGrid extends StatefulWidget {
  final String? title;
  final String? actionTitle;
  final Function? onAction;
  final List<PropertyModel> propertyList;
  final bool loading;
  final Function(int id, int index) onFavorit;
  final int loadingLength;
  final bool isGrid;
  const CustomPropertyGrid(
      {super.key,
      required this.propertyList,
      this.title,
      this.actionTitle,
      this.onAction,
      this.loading = false,
      this.isGrid = false,
      // this.loadingMore = false,
      this.loadingLength = 2,
      required this.onFavorit});

  @override
  State<CustomPropertyGrid> createState() => _CustomPropertyGridState();
}

class _CustomPropertyGridState extends State<CustomPropertyGrid> {
  @override
  Widget build(BuildContext context) {
    return !widget.loading && widget.propertyList.isEmpty
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.title == null || widget.title == ''
                  ? const SizedBox()
                  : widget.loading
                      ? const ShimmerBox(height: 14).pl(15)
                      : Padding(
                          padding: 15.pl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${widget.title}".tr,
                                  style: AppText.titleSmall),
                              SizedBox(
                                height: 30,
                                child: TextButton(
                                  style:
                                      TextButton.styleFrom(padding: 0.p.px(20)),
                                  onPressed: () => widget.onAction!(),
                                  child: Text("${widget.actionTitle}",
                                      style: AppText.titleSmall!.copyWith(
                                          color: AppConstant.kPrimaryColor)),
                                ),
                              )
                            ],
                          ),
                        ),
              GridView.builder(
                physics: widget.title == null && widget.title == ''
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                shrinkWrap:
                    widget.title == null && widget.title == '' ? false : true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                itemCount: widget.loading
                    ? widget.loadingLength
                    : widget.propertyList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.isGrid == true ? 2 : 1, //2
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 13,
                  // childAspectRatio: 2 / 2.9, //2 / 2.9
                  mainAxisExtent: widget.isGrid == true ? 275 : 130, //
                ),
                itemBuilder: (context, index) =>
                    // widget.loading
                    //     ? _buildShimer()
                    //     :
                    GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPropertyScreen(
                            id: widget.propertyList[index].id),
                      ), //TabBarDemo
                    );
                  },
                  child: widget.isGrid == true && widget.propertyList.isNotEmpty
                      ? CustomGridCard(
                          isLoading: widget.loading,
                          propertyModel: widget.propertyList[index],
                          isFavorite: widget.propertyList[index].favorite,
                          onFavorite: () {
                            widget.onFavorit(
                                widget.propertyList[index].id, index);
                            // widget.propertyList[index].favorite =
                            //     !widget.propertyList[index].favorite;
                            // setState(() {});
                            // widget.propertyController.onFavorit(
                            //     propertyId: '${widget.propertyList[index].id}');
                          },
                        )
                      : PropertyCartOne(
                          isLoading: widget.loading,
                          propertyModel: widget.propertyList[index],
                          isFavorite: widget.propertyList[index].favorite,
                          onFavorite: () {
                            widget.onFavorit(
                                widget.propertyList[index].id, index);
                            // widget.propertyList[index].favorite =
                            //     !widget.propertyList[index].favorite;
                            // setState(() {});
                            // widget.propertyController.onFavorit(
                            //     propertyId: '${widget.propertyList[index].id}');
                          },
                        ),
                ),
              ),
            ],
          ).pt(10);
  }

  // Widget _buildShimer() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(15),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Stack(
  //             children: [
  //               ShimmerBox(
  //                 width: double.infinity,
  //                 height: MediaQuery.of(context).size.width * 0.35,
  //                 highlightColor: Colors.grey[100],
  //                 baseColor: Colors.white,
  //               ),
  //               const Positioned(
  //                 right: 10,
  //                 top: 10,
  //                 child: ShimmerBox(height: 20, width: 50),
  //               )
  //             ],
  //           ),
  //           const ShimmerBox().py(15),
  //           const Row(
  //             children: [
  //               ShimmerBox(width: 60),
  //               Spacer(),
  //               ShimmerBox(width: 40),
  //             ],
  //           ),
  //           10.gap,
  //           Row(
  //             children: [
  //               const ShimmerBox(
  //                 height: 20,
  //                 width: 20,
  //                 circle: true,
  //               ),
  //               15.gap,
  //               const ShimmerBox(),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
