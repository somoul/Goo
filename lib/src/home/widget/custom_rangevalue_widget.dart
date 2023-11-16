import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../controler/search_type_rent_controler/search_controler.dart';

// ignore: must_be_immutable
class CustomRangeValueWidget extends StatefulWidget {
  double startRange = 0;
  double endRange = 0;
  double beginPoint;
  double endPoint;
  Function(SfRangeValues) onChanged;

  CustomRangeValueWidget(
      {Key? key,
      required this.startRange,
      required this.endRange,
      required this.onChanged,
      required this.beginPoint,
      required this.endPoint})
      : super(key: key);

  @override
  State<CustomRangeValueWidget> createState() => _CustomRangeValueWidgetState();
}

class _CustomRangeValueWidgetState extends State<CustomRangeValueWidget> {
  final searchController = Get.put(SearchTypeRentController());

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setStateSlider) {
      // SfRangeValues rangeValue = SfRangeValues(
      //     searchController.startSlider.value, searchController.endSlider.value);
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
            min: widget.beginPoint,
            max: widget.endPoint,
            values: SfRangeValues(widget.startRange, widget.endRange),
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
            onChanged: widget.onChanged,
            // onChanged: (SfRangeValues values) {
            //   // setState(() {
            //   if (values.start < values.end) {
            //     searchController.startSlider.value = values.start;
            //     searchController.endSlider.value = values.end;
            //     rangeValue = values;
            //   }
            //   // });
            // },
          ),
        ),
      );
    });
  }
}
