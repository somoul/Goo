import 'package:flutter/material.dart';
import 'package:goo_rent/src/property_detail/data/property_models.dart';
import 'package:goo_rent/src/property_detail/presentation/widget/custom_property_grid_card.dart';

class CustomPropertyGrid extends StatelessWidget {
  final List<PropertyModel> propertyList;
  const CustomPropertyGrid({super.key, required this.propertyList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      itemCount: propertyList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 2 / 2.9,
      ),
      itemBuilder: (context, index) => CustomGridCard(
        propertyModel: propertyList[index],
      ),
    );
  }
}
