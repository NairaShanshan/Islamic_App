import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/hijri_calendar/data/services/hijri_service.dart';

class PrayerHeader extends StatelessWidget {
  const PrayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final hijri = HijriService.getCurrentHijri();
    final today = DateTime.now();
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10) ,

      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.sunny) ,
              Gap(10) ,
              Text('prayer now ' ,style: TextStyles.textStyle24,),
            ],
          ) ,
          Gap(10) ,
          Text('03:33' , style: TextStyles.textStyle24,) ,
          Gap(10) ,
          Row(
            children: [
              Icon(Icons.calendar_month_outlined) ,
              Gap(5),
              Text(
                HijriService.formatHijriDate(hijri),
                style: TextStyles.textStyle14,
              ),
              const Gap(5),
              Text(
                HijriService.formatGregorianDate(today),
                style: TextStyles.textStyle14,
              ),

            ],
          ) ,
          Row(
            children: [
              Text('موعد الصلاة القادمه بعد ' , style: TextStyles.textStyle20,) ,
              Gap(10) ,
              Text('03:44:00'  , style: TextStyles.textStyle20,)
            ],
          )
        ],
      ),
    ) ;
  }
}
