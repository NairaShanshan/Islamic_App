import 'package:flutter/material.dart';
import 'package:islamic_app/features/hijri_calendar/data/services/hijri_service.dart';
import '../cubit/calender_state.dart';
import 'day_item.dart';

class DaysGrid extends StatelessWidget {
  final CalendarLoadedState state;

  const DaysGrid({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final days =
    HijriService.generateMonthDays(state.currentMonth);

    final today = HijriService.getCurrentHijri();

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: days.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        final day = days[index];

        final isToday =
            day.hDay == today.hDay &&
                day.hMonth == today.hMonth &&
                day.hYear == today.hYear;

        final isSelected =
            state.selectedDate?.hDay == day.hDay;

        return DayItem(
          day: day,
          isToday: isToday,
          isSelected: isSelected,
        );
      },
    );
  }
}