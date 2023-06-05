import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/cores/constant/app_constant.dart';
import 'package:goo_rent/src/home/presentation/provider/animation_background_banner_provider/home_controller.dart';

class CustomRangeValueWidget extends StatefulWidget {
  final Function(int, dynamic, dynamic)? onDragging;
  final List<double> valueSlider;
  const CustomRangeValueWidget(
      {Key? key, required this.onDragging, required this.valueSlider})
      : super(key: key);

  @override
  State<CustomRangeValueWidget> createState() => _CustomRangeValueWidgetState();
}

class _CustomRangeValueWidgetState extends State<CustomRangeValueWidget> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    // List<double> value = [0.0, 50.0];
    return StatefulBuilder(builder: (context, setStateSlider) {
      RangeValues values =
          RangeValues(homeController.startSlider, homeController.endSlider);
      RangeLabels labels = RangeLabels(
          '${homeController.startSlider}', '${homeController.endSlider}');
      return Center(
        child: RangeSlider(
          activeColor: AppConstant.kPrimaryColor,
          inactiveColor: const Color(0xffEEEEEE),
          // mouseCursor:
          // mouseCursor:
          // overlayColor: MaterialStateProperty.resolveWith((states) {
          //   // If the button is pressed, return green, otherwise blue
          //   if (states.contains(MaterialState.pressed)) {
          //     return Colors.green;
          //   }
          //   return Colors.red;
          // }),
          min: 1,
          max: 100,
          values: values,
          divisions: 5,
          labels: labels,
          onChanged: (value) {
            print('START: ${value.start}, END: ${value.end}');
            setState(() {
              homeController.startSlider = value.start;
              homeController.endSlider = value.end;
              values = value;
              labels = RangeLabels('${value.start.toInt().toString()}\$',
                  '${value.end.toInt().toString()}\$');
            });
          },
        ),
      );
    });

    //  FlutterSlider(
    //   handler: FlutterSliderHandler(
    //       decoration: BoxDecoration(
    //           color: Colors.white,
    //           border: Border.all(color: Colors.blue, width: 4),
    //           shape: BoxShape.circle),
    //       child: const SizedBox()),
    //   rightHandler: FlutterSliderHandler(
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         border: Border.all(color: Colors.blue, width: 4),
    //         shape: BoxShape.circle,
    //       ),
    //       child: const SizedBox()),
    //   tooltip: FlutterSliderTooltip(
    //     boxStyle: FlutterSliderTooltipBox(
    //         decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(5),
    //       color: Colors.blue,
    //     )),
    //     textStyle: const TextStyle(
    //         color: Colors.white, fontSize: 22, fontWeight: FontWeight.normal),
    //     leftPrefix: const Icon(
    //       Icons.attach_money,
    //       size: 22,
    //       color: Colors.white,
    //     ),
    //     rightSuffix: const Icon(
    //       Icons.attach_money,
    //       size: 22,
    //       color: Colors.white,
    //     ),
    //   ),
    //   values: valueSlider,
    //   rangeSlider: true,
    //   minimumDistance: 50,
    //   handlerHeight: 25,
    //   handlerWidth: 25,
    //   max: 500,
    //   min: 0,
    //   onDragging: (handlerIndex, lowerValue, upperValue) {
    //     onDragging!(handlerIndex, lowerValue, upperValue);
    //     // if (handlerIndex == 0) {
    //     //   value.first = lowerValue;
    //     //   print("=====================slider 1   :$lowerValue ");
    //     //   setStateSlider(() {});
    //     // } else {
    //     //   value.last = upperValue;
    //     //   print("=====================slider 2   :$upperValue ");
    //     //   setStateSlider(() {});
    //     // }
    //   },
    // );

    // });
  }
}
