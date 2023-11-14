import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:goo_rent/src/home/presentation/controller/map_controller.dart';
import 'package:goo_rent/src/property_detail/controller/property_controller.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid.dart';

class AllProperty extends StatefulWidget {
  const AllProperty({super.key});

  @override
  State<AllProperty> createState() => _AllPropertyState();
}

class _AllPropertyState extends State<AllProperty> {
  final _homeCon = Get.put(HomeController());
  final _mapController = Get.put(GMapController());
  @override
  void initState() {
    super.initState();
    _homeCon.getAllProperties(
        late: _mapController.addressModel.value.lattitude ?? '',
        long: _mapController.addressModel.value.longitude ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            'assets/image/arrow_back.svg',
            width: 15,
            height: 15,
          ),
        ),
        // centerTitle: false,
        title: Text(
          'All Properies'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/image/search.svg'),
          ),
        ],
      ),
      body: Obx(
        () => _homeCon.isLoadAllProperty.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 15,
                ),
                child: CustomPropertyGrid(
                  actionTitle: null,
                  title: null,
                  propertyList: _homeCon.propertyData.value.propertyList ?? [],
                  propertyController: PropertyController(),
                ),
              ),
      ),
    );
  }
}
