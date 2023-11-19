// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:goo_rent/helper/image_builder.dart';

class CustomImage extends StatelessWidget {
  String imageUrl;
  CustomImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ImageBuilder(fit: BoxFit.cover).network(imageUrl),
      ),
    );
  }
}
