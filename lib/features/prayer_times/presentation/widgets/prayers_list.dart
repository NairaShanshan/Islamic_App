import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:adhan_dart/adhan_dart.dart';

class PrayersList extends StatelessWidget {
  final PrayerTimes prayerTimes;
  const PrayersList({super.key, required this.prayerTimes});

  @override
  Widget build(BuildContext context) {

    final prayers = [
      {'name': 'الفجر', 'time': prayerTimes.fajr , 'icon' : Icons.wb_cloudy},
      {'name': 'الشروق', 'time': prayerTimes.sunrise , 'icon' : Icons.cloud_queue_rounded},
      {'name': 'الظهر', 'time': prayerTimes.dhuhr , 'icon' : Icons.wb_sunny_outlined},
      {'name': 'العصر', 'time': prayerTimes.asr , 'icon' : Icons.sunny},
      {'name': 'المغرب', 'time': prayerTimes.maghrib , 'icon' : Icons.wb_twilight},
      {'name': 'العشاء', 'time': prayerTimes.isha , 'icon' : Icons.nightlight_outlined},
    ];

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: prayers.length,
      separatorBuilder: (context, index) => Gap(10),
      itemBuilder: (context, index) {
        final prayer = prayers[index];
        final time = prayer['time'] as DateTime;

        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.cardColor
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(prayer['icon'] as IconData ,),
              Text(prayer['name'] as String, style: TextStyles.textStyle20),
              Text(
                '${time.toLocal().hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                style: TextStyles.textStyle20,
              )
            ],
          ),
        );
      },
    );
  }
}