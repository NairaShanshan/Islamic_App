import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri_date/hijri_date.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/hijri_calendar/presentation/cubit/calendar_cubit.dart';


class DayItem extends StatelessWidget {
  final HijriDate day;
  final bool isToday;
  final bool isSelected;

  const DayItem({
    super.key,
    required this.day,
    required this.isToday,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.transparent;

    if (isSelected) {
      bgColor = Colors.green;
    } else if (isToday) {
      bgColor = Colors.grey.shade300;
    }

    return GestureDetector(
      onTap: () {
        context.read<CalendarCubit>().selectDay(day);
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Center(
          child: Text(
            day.hDay.toString(),
            style:TextStyles.textStyle16,
          ),
        ),
      ),
    );
  }
}