import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:islamic_app/features/prayer_times/presentation/widgets/prayer_utils.dart';

import '../../../../core/utils/text_styles.dart';


class PrayerNextSection extends StatelessWidget {

  final Prayer nextPrayer;
  final Duration remaining;

  const PrayerNextSection({
    super.key,
    required this.nextPrayer,
    required this.remaining,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Text(
          "متبقي على ${PrayerUtils.getPrayerName(nextPrayer)}",
          style: TextStyles.textStyle20.copyWith(
            color: Colors.white
          ),
        ),

        const Gap(10),

        Text(
          PrayerUtils.formatRemaining(remaining),
          style: TextStyles.textStyle20.copyWith(
              color: Colors.white
          ),
        ),

      ],
    );
  }
}