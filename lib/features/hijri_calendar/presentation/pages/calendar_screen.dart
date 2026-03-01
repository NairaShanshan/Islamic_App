import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/hijri_calendar/presentation/cubit/calendar_cubit.dart';

import 'package:islamic_app/features/hijri_calendar/presentation/cubit/calender_state.dart';
import 'package:islamic_app/features/hijri_calendar/presentation/widgets/calendar_header.dart';
import 'package:islamic_app/features/hijri_calendar/presentation/widgets/days_grid.dart';
import 'package:islamic_app/features/hijri_calendar/presentation/widgets/week_days_row.dart';


class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('calender'.tr()), centerTitle: true),
      body: BlocBuilder<CalendarCubit, CalendarStates>(
        builder: (context, state) {
          if (state is CalendarLoadedState) {
            return Column(
              children: [
                CalendarHeader(state: state),
                WeekDaysRow(),
                Expanded(
                  child: DaysGrid(state: state),
                ),
              ],
            );
          }

          return  Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}