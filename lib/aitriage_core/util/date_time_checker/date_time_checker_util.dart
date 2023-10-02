class DateTimeCheckerUtil{
  static const maxDay = 31;
  static const maxMonth = 12;
  ///[minYear] cho người sống lâu nhất. María Branyas sinh 1907 và chưa mất.
  static const minYear = 1907;
  static const higherDayMonth = {1,3,5,7,8,10,12};
  static const lowerDayMonth = {4,6,9,11};
  
  ///[checkDay] for check a day. This include check for leap year.
  bool checkDate(String date){
    if(!_isValidDateInput(date)){
      return false;
    }
    final (day, month, year) = _parseData(date);
    return (_isValidDate(day, month, year));
  }
  
  
  bool _isValidDateInput(String date){
    var regrexForDate = RegExp(r'^([^/]*\/){2}[^/]*$');
    return regrexForDate.hasMatch(date) ? true : false;
  }
  
  bool _isValidDate(int day, int month, int year){
    if(year > DateTime.now().year || month > maxMonth || day > maxDay || year < minYear || month < 1 || day < 1){
      return false;
    }
    if(year == DateTime.now().year){
      if(month > DateTime.now().month){
        return false;
      } else if(month == DateTime.now().month){
        if(day > DateTime.now().day){
          return false;
        }
      }
    }
    if(lowerDayMonth.contains(month)){
      if(day > 30) return false;
    }
    if(month == 2){
      if(_isLeapYear(year)){
        if(day > 28) return false;
      } else {
        if(day > 29) return false;
      }
    }
    return true;
  }
  
  (int, int, int) _parseData(String date){
    final parsed = date.split('/');
    return (parsed[0] == '' ? 0 : int.parse(parsed[0]), 
            parsed[1] == '' ? 0 : int.parse(parsed[1]), 
            parsed[2] == '' ? 0 : int.parse(parsed[2]));
  }
  
  bool _isLeapYear(int year){
    return ((year % 4 == 0) && (year % 100 != 0));
  }
}