import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static String formatDate(String value) {
    DateTime date = DateFormat('yyyy-mm-dd').parse(value);
    return DateFormat('dd MMM').format(date);
  }

  static DateTime timestampToDateTime(Timestamp value) {
    return Timestamp.fromMillisecondsSinceEpoch(value.millisecondsSinceEpoch)
        .toDate();
  }

  static String timestampToString(Timestamp value) {
    return dateTimeToString(
        Timestamp.fromMillisecondsSinceEpoch(value.millisecondsSinceEpoch)
            .toDate());
  }

  static Timestamp dateTimeToTimestamp(DateTime value) {
    return Timestamp.fromDate(value);
  }

  static String dateTimeToString(DateTime value) {
    return DateFormat('yyyy-MM-dd').format(value);
  }

  static DateTime stringToDateTime(String value) {
    return DateTime.parse(value);
  }

  static Timestamp stringToTimestamp(String value) {
    return Timestamp.fromDate(DateTime.parse(value));
  }
}
