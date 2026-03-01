import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/hijri_calendar/presentation/cubit/calendar_cubit.dart';

import '../cubit/calender_state.dart';

class CalendarHeader extends StatelessWidget {
  final CalendarLoadedState state;

  const CalendarHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.read<CalendarCubit>().previousMonth();
            },
            icon:  Icon(Icons.arrow_back_ios),
          ),
          Text(
            "${state.currentMonth.longMonthName} ${state.currentMonth.hYear}",
            style:  TextStyles.textStyle20.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<CalendarCubit>().nextMonth();
            },
            icon:  Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}