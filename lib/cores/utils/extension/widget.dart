import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/cores/utils/extension/edge_insets.dart';
import 'package:goo_rent/cores/utils/extension/num.dart';

extension ExtendWidget on Widget {
  RenderObjectWidget get sliver {
    return SliverToBoxAdapter(
      child: this,
    );
  }

  Widget pt(double size) {
    if (this is Padding) {
      return Padding(
        padding: ((this as Padding).padding as EdgeInsets).pt(size),
        child: (this as Padding).child,
      );
    } else if (this is SliverPadding) {
      return SliverPadding(
        padding: ((this as SliverPadding).padding as EdgeInsets).pt(size),
        sliver: (this as SliverPadding).child,
      );
    } else {
      return Padding(
        padding: size.pt,
        child: this,
      );
    }
  }

  Widget pb(double size) {
    if (this is Padding) {
      return Padding(
        padding: ((this as Padding).padding as EdgeInsets).pb(size),
        child: (this as Padding).child,
      );
    } else if (this is SliverPadding) {
      return SliverPadding(
        padding: ((this as SliverPadding).padding as EdgeInsets).pb(size),
        sliver: (this as SliverPadding).child,
      );
    } else {
      return Padding(
        padding: size.pb,
        child: this,
      );
    }
  }

  Widget pr(double size) {
    if (this is Padding) {
      return Padding(
        padding: ((this as Padding).padding as EdgeInsets).pr(size),
        child: (this as Padding).child,
      );
    } else if (this is SliverPadding) {
      return SliverPadding(
        padding: ((this as SliverPadding).padding as EdgeInsets).pr(size),
        sliver: (this as SliverPadding).child,
      );
    } else {
      return Padding(
        padding: size.pr,
        child: this,
      );
    }
  }

  Widget pl(double size) {
    if (this is Padding) {
      return Padding(
        padding: ((this as Padding).padding as EdgeInsets).pl(size),
        child: (this as Padding).child,
      );
    } else if (this is SliverPadding) {
      return SliverPadding(
        padding: ((this as SliverPadding).padding as EdgeInsets).pl(size),
        sliver: (this as SliverPadding).child,
      );
    } else {
      return Padding(
        padding: size.pl,
        child: this,
      );
    }
  }

  Widget px(double size) {
    if (this is Padding) {
      return Padding(
        padding: ((this as Padding).padding as EdgeInsets).px(size),
        child: (this as Padding).child,
      );
    } else if (this is SliverPadding) {
      return SliverPadding(
        padding: ((this as SliverPadding).padding as EdgeInsets).px(size),
        sliver: (this as SliverPadding).child,
      );
    } else {
      return Padding(
        padding: size.px,
        child: this,
      );
    }
  }

  Widget pxy(double sizeX, double sizeY) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizeY, horizontal: sizeX),
      child: this,
    );
  }

  Widget py(double size) {
    if (this is Padding) {
      return Padding(
        padding: ((this as Padding).padding as EdgeInsets).py(size),
        child: (this as Padding).child,
      );
    } else if (this is SliverPadding) {
      return SliverPadding(
        padding: ((this as SliverPadding).padding as EdgeInsets).py(size),
        sliver: (this as SliverPadding).child,
      );
    } else {
      return Padding(
        padding: size.py,
        child: this,
      );
    }
  }

  Widget p(double size) {
    return Padding(
      padding: size.p,
      child: this,
    );
  }

  Widget get ps {
    return p(AppConstant.padding);
  }

  Widget get psx {
    return px(AppConstant.padding);
  }

  Widget rotate({
    Duration speed = const Duration(milliseconds: 1500),
    bool antiClockwise = false,
  }) {
    return _RotateWidget(
      speed: speed,
      antiClockwise: antiClockwise,
      child: this,
    );
  }
}

class _RotateWidget extends StatefulWidget {
  final Widget child;
  final Duration speed;
  final bool antiClockwise;

  const _RotateWidget({
    required this.child,
    required this.speed,
    this.antiClockwise = false,
  });

  @override
  State<_RotateWidget> createState() => _RotateWidgetState();
}

class _RotateWidgetState extends State<_RotateWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.speed,
      lowerBound: 0,
      upperBound: 2 * math.pi,
    );

    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (
        context,
        child,
      ) {
        return Transform.rotate(
          angle: animationController.value * (widget.antiClockwise ? -1 : 1),
          child: child,
        );
      },
    );
  }
}
