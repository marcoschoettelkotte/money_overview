import 'package:intl/intl.dart';
import 'package:quiver/time.dart';

class TimeService{
  static String calcStartEndTime(DateTime date, int startMonth, int endMonth){
    return DateFormat("dd.MM.yyyy").format(DateTime.utc(date.year, startMonth, 1)) +
        " - " +
        DateFormat("dd.MM.yyyy").format(DateTime.utc(date.year, endMonth, daysInMonth(date.year, endMonth)));
  }
}
