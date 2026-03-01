import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri_date/hijri_date.dart';
import 'package:islamic_app/features/hijri_calendar/data/services/hijri_service.dart';
import 'package:islamic_app/features/hijri_calendar/presentation/cubit/calender_state.dart';

class CalendarCubit extends Cubit<CalendarStates> {
  CalendarCubit() : super(InitialCalendarState());

  void loadCurrentMonth() {
    final now = HijriService.getCurrentHijri();
    emit(CalendarLoadedState(currentMonth: now));
  }

  void nextMonth() {
    if (state is CalendarLoadedState) {
      final current = (state as CalendarLoadedState).currentMonth;

      int newMonth = current.hMonth + 1;
      int newYear = current.hYear;

      if (newMonth > 12) {
        newMonth = 1;
        newYear++;
      }

      final next = HijriDate.fromHijri(newYear, newMonth, 1);

      emit(CalendarLoadedState(currentMonth: next));
    }
  }

  void previousMonth() {
    if (state is CalendarLoadedState) {
      final current = (state as CalendarLoadedState).currentMonth;

      int newMonth = current.hMonth - 1;
      int newYear = current.hYear;

      if (newMonth < 1) {
        newMonth = 12;
        newYear--;
      }

      final previous = HijriDate.fromHijri(newYear, newMonth, 1);

      emit(CalendarLoadedState(currentMonth: previous));
    }
  }

  void selectDay(HijriDate date) {
    if (state is CalendarLoadedState) {
      final current = (state as CalendarLoadedState).currentMonth;

      emit(CalendarLoadedState(
        currentMonth: current,
        selectedDate: date,
      ));
    }
  }
}