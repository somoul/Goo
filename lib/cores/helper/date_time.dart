import 'package:intl/intl.dart';

class AppDateTime {
  /// Get defualt date and time in MPay by [defaultDateTime]

  static String defaultDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd kk:mm').format(dateTime);
  }

  /// Get defualt time in MPay by [getDate]

  static String getDate(String dateTime) {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(dateTime));
  }

  /// Get defualt time in MPay by [getTime]

  static String getTime(DateTime dateTime) {
    return DateFormat('kk:mm').format(dateTime);
  }

  // /// Get diplay with check peroid of date by [getDisplayDate]
  // static String getDisplayDate(DateTime dateTime) {
  //   bool isToday = dateTime.isToday();
  //   bool isYesterday = dateTime.isYesterday();

  //   if (isToday) {
  //     return '<Today> ${getTime(dateTime)}'.tr;
  //   } else if (isYesterday) {
  //     return '<Yesterday> ${getTime(dateTime)}'.tr;
  //   } else {
  //     return defaultDateTime(dateTime);
  //   }
  // }
}
