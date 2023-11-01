import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goo_rent/constant/app_text.dart';

void showButtomSheetPickDateIOSPlatForm({required BuildContext context}) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).copyWith().size.height / 3,
                // child: CupertinoDatePicker(
                //   initialDateTime: DateTime.now(),
                //   onDateTimeChanged: (DateTime newdate) {
                //     // setState(() {
                //     //   _currentdate = newdate;
                //     // });
                //   },
                //   use24hFormat: true,
                //   maximumDate: DateTime(2050, 12, 30),
                //   minimumYear: 2010,
                //   maximumYear: 2018,
                //   minuteInterval: 1,
                //   mode: CupertinoDatePickerMode.dateAndTime,
                // ),
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
// This is called when the user changes the date.
                  onDateTimeChanged: (DateTime newDate) {},
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: const Color(0xFF21A6F8),
                        ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "រក្សាទុក",
                      style: AppText.bodySmall!
                          .copyWith(fontSize: 16, color: Colors.white),
                    )),
              ),
            ],
          ),
        );
      });
}
