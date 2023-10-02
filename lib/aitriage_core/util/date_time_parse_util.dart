import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeParserUtil {
  DateTimeParserUtil();

  String parseDateWithHour(String dateWithHour) {
    final rawString = DateTime.parse(dateWithHour).toLocal();
    final day = _dayParser(rawString.day);
    final month = _monthParser(rawString.month);
    final year = rawString.year.toString();
    final hourString =
        _hourParser(rawString.hour, rawString.minute, should12Hours: true);
    final result = '$day-$month-$year $hourString';
    return result;
  }

  String _dayParser(int day) {
    return _prefixForLessThanTen(day);
  }

  String _monthParser(int month) {
    return _prefixForLessThanTen(month);
  }

  String appFormatToBackendFormat(String str) {
    if (str.isNumericOnly && str.length == 4) return str;

    var sourceFormatter = DateFormat('dd/MM/yyyy');
    var targetFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime dateTime = sourceFormatter.parse(str);
    // Set the hour, minute, and second to 0.
    dateTime = dateTime.copyWith(hour: 0, minute: 0, second: 0);
    String formattedString = targetFormatter.format(dateTime);

    return formattedString;
  }

  String backendFormatToAppFormat(String str) {
    if (str.isNumericOnly && str.length == 4) return str;

    final inputFormatter = DateFormat("yyyy-MM-ddTHH:mm:ss.mmmZ");
    final outputFormatter = DateFormat("dd/MM/yyyy");
    final date = inputFormatter.parse(str);
    return outputFormatter.format(date);
  }

  String _hourParser(int hour, int minutes, {bool should12Hours = false}) {
    String suffixString = '';
    String hourString = '';
    String minutesString = _minutesParser(minutes);

    if (should12Hours == true) {
      if (hour > 12) {
        hourString = (hour - 12).toString();
        suffixString = 'PM';
      } else {
        hourString = _prefixForLessThanTen(hour);
        suffixString = 'AM';
      }
      return '$hourString:$minutesString $suffixString';
    } else {
      hourString = _prefixForLessThanTen(hour);
      return '$hourString:$minutesString';
    }
  }

  String _minutesParser(int minutes) {
    return _prefixForLessThanTen(minutes);
  }

  String _prefixForLessThanTen(int num) {
    return num < 10 ? '0$num' : '$num';
  }
}
