// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomDefaultShimmer extends StatelessWidget {
  final bool isShimmer;
  final EdgeInsetsGeometry padding;
  final double heightShimmer;
  final double widthShimmer;
  final Widget child;
  const CustomDefaultShimmer(
      {super.key,
      required this.isShimmer,
      required this.heightShimmer,
      this.widthShimmer = double.infinity,
      required this.padding,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        duration: const Duration(seconds: 2),
        colorOpacity: 0.2,
        enabled: isShimmer,
        color: Colors.grey,
        child: isShimmer == true
            ? Padding(
                padding: padding,
                child: Container(
                  height: heightShimmer,
                  width: widthShimmer,
                  decoration: BoxDecoration(
                    color: Colors.grey[200]!,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 0.8, color: Colors.white60),
                  ),
                ),
              )
            : child);
  }
}
