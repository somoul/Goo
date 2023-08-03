import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/data/slide_categorie_model/slide_categorie_model.dart';
import 'package:goo_rent/src/post_property/presentation/screens/rent_step_1_.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.clear, color: Colors.black),
            )),
        title: Text('Rent'.tr, style: AppText.bodyLarge),
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
                onTap: () =>
                    Get.to(const RentStepOne()), //_onShowSelectAccessory(),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.grey[200]!,
                        )
                      ]),
                  child: Column(
                    children: [
                      Image.network(
                        categModel.icon ?? '',
                        width: 45,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${categModel.name}',
                        style: AppText.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
