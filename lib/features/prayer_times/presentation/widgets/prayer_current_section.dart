import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/app_colors.dart';

import 'package:islamic_app/features/prayer_times/presentation/widgets/prayer_utils.dart';

import '../../../../core/utils/text_styles.dart';

class PrayerCurrentSection extends StatelessWidget {
  final Prayer currentPrayer;
  final DateTime currentPrayerTime;

  const PrayerCurrentSection({
    super.key,
    required this.currentPrayer,
    required this.currentPrayerTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(PrayerUtils.getPrayerIcon(currentPrayer), size: 28 , color: AppColors.accentColor,),
            Text(
              PrayerUtils.getPrayerName(currentPrayer),
              style: TextStyles.textStyle24.copyWith(
                fontWeight: FontWeight.bold ,
                color: Colors.white
              ),
            ),
          ],
        ),
        Gap(8),
        Text(
          PrayerUtils.formatTime(currentPrayerTime),
          style: TextStyles.textStyle30.copyWith(
            color: Colors.white ,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}
