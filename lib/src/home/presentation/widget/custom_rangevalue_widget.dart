import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';

class CustomRangeValueWidget extends StatelessWidget {
  const CustomRangeValueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //RangeValues _currentRangeValues = const RangeValues(40, 80);
    List<double> value = [0.0, 50.0];
    // return StatefulBuilder(
    //   builder: (context,setStateValue) {
    //     return SliderTheme(
    //       data: const SliderThemeData(
    //           overlayColor:Colors.red
    //       ),
    //       child: RangeSlider(
    //         activeColor: Colors.blue,
    //         inactiveColor: Colors.grey.withOpacity(0.5),
    //         values: _currentRangeValues,
    //         max: 200,
    //         divisions: 10,
    //         labels: RangeLabels(
    //           "${_currentRangeValues.start.round()}\$",
    //           "${_currentRangeValues.end.round()}\$",
    //         ),
    //         onChanged: (RangeValues values) {
    //           setStateValue(() {
    //             _currentRangeValues = values;
    //           });
    //         },
    //       ),
    //     );
    //   }
    // );
    return StatefulBuilder(builder: (context, setStateSlider) {
      return FlutterSlider(
        handler: FlutterSliderHandler(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue, width: 4),
                shape: BoxShape.circle),
            child: const SizedBox()),
        rightHandler: FlutterSliderHandler(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue, width: 4),
              shape: BoxShape.circle,
            ),
            child: const SizedBox()),
        tooltip: FlutterSliderTooltip(
          boxStyle: FlutterSliderTooltipBox(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
          )),
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.normal),
          leftPrefix: const Icon(
            Icons.attach_money,
            size: 22,
            color: Colors.white,
          ),
          rightSuffix: const Icon(
            Icons.attach_money,
            size: 22,
            color: Colors.white,
          ),
        ),
        values: value,
        rangeSlider: true,
        minimumDistance: 50,
        handlerHeight: 25,
        handlerWidth: 25,
        max: 500,
        min: 0,
        onDragging: (handlerIndex, lowerValue, upperValue) {
          if (handlerIndex == 0) {
            value.first = lowerValue;
            setStateSlider(() {});
          } else {
            value.last = upperValue;
            setStateSlider(() {});
          }
        },
      );
    });
  }
}
