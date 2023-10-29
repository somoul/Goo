import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? highlightColor;
  final Color? baseColor;
  final bool circle;
  final double borderRadius;

  const ShimmerBox({
    super.key,
    this.height,
    this.width,
    this.circle = false,
    this.highlightColor,
    this.baseColor,
    this.borderRadius = 7,
  });

  static Widget pill({
    required double width,
    double height = 18,
    Color color = const Color(0xFFEEEEEE),
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  static Widget ball({
    required double diameter,
  }) {
    return Container(
      height: diameter,
      width: diameter,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFEEEEEE),
      ),
    );
  }

  static Widget wrap({
    required Widget child,
    Color? highlightColor,
    Color? baseColor,
  }) {
    return Shimmer.fromColors(
      highlightColor: highlightColor ?? Colors.grey[200]!.withOpacity(0),
      baseColor: baseColor ?? Colors.grey[200]!,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: highlightColor ?? Colors.grey[200]!.withOpacity(0),
      baseColor: baseColor ?? Colors.grey[200]!,
      // highlightColor: highlightColor ?? Colors.white,
      // baseColor: baseColor ?? Colors.grey[200]!,
      child: Container(
        height: height ?? 13,
        width: width ?? 100,
        decoration: circle
            ? BoxDecoration(color: Colors.grey[200]!, shape: BoxShape.circle)
            : BoxDecoration(
                color: Colors.grey[200]!,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
      ),
    );
  }
}
