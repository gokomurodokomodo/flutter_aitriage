class DateTimeParserUtil{
  DateTimeParserUtil();

  String parseDateWithHour(String dateWithHour){
    final rawString = DateTime.parse(dateWithHour);
    final day = _dayParser(rawString.day);
    final month = _monthParser(rawString.month);
    final year = rawString.year.toString();
    final hourString = _hourParser(rawString.hour, rawString.minute, should12Hours: true);
    final result = '$day-$month-$year $hourString';
    return result;
  }

  String _dayParser(int day){
    return _prefixForLessThanTen(day);
  }

  String _monthParser(int month){
    return _prefixForLessThanTen(month);
  }

  String _hourParser(int hour, int minutes, {bool should12Hours = false}){
    String suffixString = '';
    String hourString = '';
    String minutesString = _minutesParser(minutes);

    if(should12Hours == true){
      if(hour > 12){
        hourString = (hour - 12).toString();
        suffixString = 'PM';
      } else {
        hourString = _prefixForLessThanTen(hour);
        suffixString = 'AM';
      }
      return '$hourString:$minutesString $suffixString';
    } else{
        hourString = _prefixForLessThanTen(hour);
        return '$hourString:$minutesString';
    }
  }

  String _minutesParser(int minutes){
    return _prefixForLessThanTen(minutes);
  }

  String _prefixForLessThanTen(int num){
    return num < 10 ? '0$num' : '$num';
  }
}