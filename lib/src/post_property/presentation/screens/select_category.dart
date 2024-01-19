import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/constant/app_text.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/data/slide_categorie_model/slide_categorie_model.dart';
import 'package:goo_rent/src/post_property/presentation/screens/rent_step_1_.dart';
import 'package:goo_rent/src/post_property/presentation/widgets/select_categories_mixin.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen>
    with SelectCategoryMixin {
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        title: Text('Rent'.tr),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Property Types'.tr,
              style: AppText.titleSmall,
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
                  print(_homeController.selectedCategory.value.toString());
                  Get.to(const RentStepOne());
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
