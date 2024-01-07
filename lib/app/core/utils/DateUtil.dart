import 'package:intl/intl.dart';

class DateUtil {
  DateUtil._();

  static const _DATE_PTBR_FORMAT = 'dd/MM/yyyy';
  static const _DATE_US_FORMAT = 'yyyy-MM-dd';

  static DateTime convertStringToDate(String dateString) {
    final dateFormat = DateFormat(_DATE_PTBR_FORMAT);
    DateTime dateTime = dateFormat.parseStrict(dateString);
    return dateTime;
  }

  static String _formatDateTimeToCustomString(
      DateTime dateTime, String format) {
    final dateFormat = DateFormat(format);
    return dateFormat.format(dateTime);
  }

  static String convertDateTimeFromPTBR(DateTime date) {
    String dateStr = _formatDateTimeToCustomString(date, _DATE_PTBR_FORMAT);
    return dateStr;
  }

  static String convertDateTimeFromUS(DateTime date) {
    String dateStr = _formatDateTimeToCustomString(date, _DATE_US_FORMAT);
    return dateStr;
  }

  static String convertDateTimeForStringDate(DateTime dateTime) {
    int day = dateTime.day;
    int month = dateTime.month;
    int year = dateTime.year;

    String formattedDate = '$day/${month < 10 ? '0$month' : month}/$year';

    return formattedDate;
  }
}
