import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';

import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/prayer_times/presentation/cubit/prayer_cubit.dart';
import 'package:islamic_app/features/prayer_times/presentation/cubit/prayer_states.dart';

import 'package:islamic_app/features/prayer_times/presentation/widgets/nawafil_list.dart';
import 'package:islamic_app/features/prayer_times/presentation/widgets/prayer_header.dart';
import 'package:islamic_app/features/prayer_times/presentation/widgets/prayers_list.dart';


class PrayersScreen extends StatelessWidget {
  const PrayersScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(title: Text('praying'.tr()), centerTitle: true),
      body: BlocBuilder< PrayerTimesCubit, PrayerTimesStates>(
        builder: (context , state) {
          if (state is PrayerTimesLoadingState) {
            return Center(child: CircularProgressIndicator());
          }else if (state is PrayerTimesErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          }else if(state is PrayerTimesSuccessState) {
            final prayers = state.prayerTimes;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrayerHeader(prayerTimes: prayers,) ,
                    Gap(20),
                    PrayersList(prayerTimes: prayers,) ,
                    Gap(20),
                    Text('السنن والنوافل' , style: TextStyles.textStyle24,) ,
                    NawafilList() ,
                  ],
                ),
              ),
            );
          }

          return SizedBox();

        }

      ),
    );
  }
}
