import 'package:intl/intl.dart';

class Date {
  static final formatter = DateFormat("yyyy-MM-dd HH:mm");

  static String convertTimestamp2String(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return formatter.format(dateTime);
  }
}