import 'package:hijri_date/hijri_date.dart';

abstract  class CalendarStates {}

class InitialCalendarState extends CalendarStates {}


class CalendarLoadedState extends CalendarStates {
  final HijriDate currentMonth;
  final HijriDate? selectedDate;

  CalendarLoadedState({
    required this.currentMonth,
    this.selectedDate,
  });
}