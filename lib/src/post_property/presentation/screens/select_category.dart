import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_constant.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/data/slide_categorie_model/slide_categorie_model.dart';
import 'package:goo_rent/src/post_property/controller/post_property_controller.dart';
import 'package:goo_rent/src/post_property/presentation/screens/rent_step_1_.dart';
import 'package:goo_rent/src/post_property/presentation/widgets/select_categories_mixin.dart';
import 'package:goo_rent/utils/extension/num.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen>
    with SelectCategoryMixin {
  final _homeController = Get.put(HomeController());
  final postController = Get.put(PostPropertyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        title: Text('Rent'.tr),
      ),
      body: ListView(
        children: [
          Align(
            child: Column(
              children: [
                25.gap,
                Text(
                  "Please choose rent property as following".tr,
                  style: AppText.titleLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppConstant.kPrimaryColor,
                  ),
                ),
                Text(
                  "Lot of customers are waiting!".tr,
                  style: AppText.bodyMedium!.copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
          20.gap,
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Property Types'.tr,
              style: AppText.titleMedium,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: _homeController.listSideBarDataCategorie.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              mainAxisExtent: 95,
              // childAspectRatio: 2 / 2.9,
            ),
            itemBuilder: (context, index) {
              SlideCategorieModel categModel =
                  _homeController.listSideBarDataCategorie[index];
              return InkWell(
                onTap: () {
                  _homeController.selectedCategory.value = categModel;
                  // postController.fieldListStep1.clear();
                  postController.imageList.clear();
                  postController.fieldListStep2.clear();

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RentStepOne(),
                      ));
                }, //_onShowSelectAccessory(),
                child: buildSelectItem(categModel),
              );
            },
          ),
        ],
      ),
    );
  }
}
