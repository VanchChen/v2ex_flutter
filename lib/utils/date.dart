import 'package:intl/intl.dart';

class Date {
  static final formatter = DateFormat("yyyy-MM-dd");

  static String convertTimestamp2String(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = DateTime.now().difference(dateTime);
    if (diff.inMinutes <= 10) {
      //10分钟内算刚刚
      return "刚刚";
    } else if (diff.inMinutes < 60) {
      //一小时内
      return "${diff.inMinutes}分钟前";
    } else if (diff.inHours < 24) {
      //一天内
      return "${diff.inHours}小时前";
    } else if (diff.inDays < 30) {
      //一个月内
      return "${diff.inDays}天前";
    }
    return formatter.format(dateTime);
  }
}