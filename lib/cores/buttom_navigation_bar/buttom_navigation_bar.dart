import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goo_rent/cores/constant/app_text.dart';
import "dart:math" as math;

import 'button_navigation_item.dart';

class ButtonNavigationGooRent extends StatefulWidget {
  const ButtonNavigationGooRent(
      {Key? key,
      required this.items,
      required this.onTapChange,
      required this.backgroundColor,
      this.inactiveIconColor})
      : super(key: key);
  final List<BottomNavItem> items;
  final Function(int) onTapChange;
  final Color backgroundColor;
  final Color? inactiveIconColor;

  @override
  State<ButtonNavigationGooRent> createState() =>
      _ButtonNavigationGooRentState();
}

class _ButtonNavigationGooRentState extends State<ButtonNavigationGooRent>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController scaleAnimationController;
  late int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    scaleAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 280),
        animationBehavior: AnimationBehavior.normal)
      ..forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
      child: PhysicalShape(
        clipBehavior: Clip.antiAlias,
        elevation: 16.0,
        color: widget.backgroundColor,
        clipper: BottomBarViewClipper(
            radius: Tween<double>(begin: 0.0, end: 0.0)
                    .animate(CurvedAnimation(
                        parent: animationController,
                        curve: Curves.fastOutSlowIn))
                    .value *
                38.0),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.bottom,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _buildIcon(
                    index: _currentIndex,
                    activeIconColor: const Color(0xFF21A6F8),
                    inactiveIconColor: Colors.grey,
                  )),
            ),
            // Container(
            //   height: MediaQuery.of(context).padding.bottom,
            //   color: widget.backgroundColor ?? Theme.of(context).primaryColor,
            // )
          ],
        ),
      ),
    );
  }

  void onTap(index) {
    widget.onTapChange(index);
    _currentIndex = index;
  }

  _buildIcon({
    required int index,
    Color? activeIconColor = Colors.red,
    Color? inactiveIconColor = Colors.white,
  }) {
    return List.generate(
        widget.items.length,
        ((index) => Expanded(
              child: InkWell(
                enableFeedback: true,
                focusColor: Colors.red,
                onTap: () => onTap(index),
                splashColor: Colors.red,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ScaleTransition(
                        alignment: Alignment.center,
                        //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                        scale: scaleAnimationController,
                        child: SvgPicture.asset(
                          widget.items[index].svgPicturePath,
                          color: _currentIndex != index
                              ? inactiveIconColor
                              : activeIconColor,
                          width: widget.items[index].iconSize,
                          height: widget.items[index].iconSize,
                        ),
                      ),
                      Text(widget.items[index].label,
                          textAlign: TextAlign.center,
                          style: AppText.bodySmall!.copyWith(
                              color: _currentIndex != index
                                  ? inactiveIconColor
                                  : activeIconColor)),
                    ],
                  ),
                ),
              ),
            )));
  }
}

class BottomBarViewClipper extends CustomClipper<Path> {
  BottomBarViewClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    //  final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(BottomBarViewClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double radian = (math.pi / 180) * degree;
    return radian;
  }
}
