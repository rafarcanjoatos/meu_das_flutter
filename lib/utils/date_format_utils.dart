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
}
