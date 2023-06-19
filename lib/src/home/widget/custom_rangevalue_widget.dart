import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/src/home/controler/animation_background_banner_provider/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomRangeValueWidget extends StatefulWidget {
  // final Function(int, dynamic, dynamic)? onDragging;
  // final List<double> valueSlider;
  const CustomRangeValueWidget({
    Key? key,
    // required this.onDragging,
    //  required this.valueSlider
  }) : super(key: key);

  @override
  State<CustomRangeValueWidget> createState() => _CustomRangeValueWidgetState();
}

class _CustomRangeValueWidgetState extends State<CustomRangeValueWidget> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    SfRangeValues values =
        SfRangeValues(homeController.startSlider, homeController.endSlider);

    return StatefulBuilder(builder: (context, setStateSlider) {
      return Center(
        child: SfRangeSliderTheme(
          data: SfRangeSliderThemeData(
            activeTrackHeight: 7.5,
            inactiveTrackHeight: 7.5,
            overlayRadius: 0,
            tooltipBackgroundColor: const Color(0xff21A6F8),
            overlappingTooltipStrokeColor: Colors.black,
            tooltipTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          child: SfRangeSlider(
            inactiveColor: const Color(0xffEEEEEE),
            activeColor: const Color(0xff21A6F8),
            // stepSize: ,
            min: 0,
            max: 100,
            values: values,
            interval: 1,
            startThumbIcon: Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            endThumbIcon: Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            labelPlacement: LabelPlacement.onTicks,
            edgeLabelPlacement: EdgeLabelPlacement.auto,
            numberFormat: NumberFormat("\$"),
            enableTooltip: true,
            shouldAlwaysShowTooltip: true,
            enableIntervalSelection: false,
            minorTicksPerInterval: 0,
            onChanged: (SfRangeValues values) {
              setState(() {
                homeController.startSlider = values.start;
                homeController.endSlider = values.end;
                values = values;
                // labels = RangeLabels('${values.start.toInt().toString()}\$',
                //     '${values.end.toInt().toString()}\$');
              });
            },
          ),
        ),
      );
    });
  }
}
