import 'dart:async';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/constants/app_images.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/hijri_calendar/data/services/hijri_service.dart';
import 'package:islamic_app/features/prayer_times/presentation/widgets/prayer_current_section.dart';
import 'package:islamic_app/features/prayer_times/presentation/widgets/prayer_next_section.dart';

class PrayerHeader extends StatefulWidget {
  final PrayerTimes prayerTimes;

  const PrayerHeader({super.key, required this.prayerTimes});

  @override
  State<PrayerHeader> createState() => _PrayerHeaderState();
}

class _PrayerHeaderState extends State<PrayerHeader> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) => setState(() {}));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPrayer = widget.prayerTimes.currentPrayer(
      date: DateTime.now(),
    );

    final currentPrayerTime = widget.prayerTimes.timeForPrayer(currentPrayer);

    final nextPrayer = widget.prayerTimes.nextPrayer();

    final nextPrayerTime = widget.prayerTimes.timeForPrayer(nextPrayer);

    final remaining = nextPrayerTime.difference(DateTime.now());

    final hijri = HijriService.getCurrentHijri();

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(AppImages.mosque3),
          fit: BoxFit.fill,

        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined , color: AppColors.accentColor,),
                  Gap(5),
                  Text(
                    HijriService.formatHijriDate(hijri),
                    style: TextStyles.textStyle20.copyWith(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              const Gap(5),
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined , color: AppColors.accentColor,),
                  Gap(5),
                  Text(
                    HijriService.formatGregorianDate(DateTime.now()),
                    style: TextStyles.textStyle20.copyWith(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(10),
          PrayerCurrentSection(
            currentPrayer: currentPrayer,
            currentPrayerTime: currentPrayerTime,
          ),
          Gap(10),
          PrayerNextSection(nextPrayer: nextPrayer, remaining: remaining),
        ],
      ),
    );
  }
}
