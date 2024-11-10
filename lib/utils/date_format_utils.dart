import 'package:intl/intl.dart';

abstract class DateFormatUtils {
  static String formatDate(DateTime date) {
    String day = date.day.toString();
    String month = (date.month).toString();
    String year = date.year.toString().substring(2);

    if (date.day <= 9) {
      day = "0$day";
    }
    if (date.month <= 9) {
      month = "0$month";
    }

    return "$day/$month/$year";
  }

  static String formatToStringDateTime(String date) {
    date = date.replaceAll('/', '-');
    DateFormat inputFormat = DateFormat("dd-MM-yy");
    DateFormat outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");

    DateTime parsedDate = inputFormat.parse(date);
    date = outputFormat.format(parsedDate);

    return date;
  }
}
