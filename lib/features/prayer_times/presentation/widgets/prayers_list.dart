// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:islamic_app/core/utils/text_styles.dart';
//
// class PrayersList extends StatelessWidget {
//   const PrayersList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: 6,
//       separatorBuilder: (context , index ) => Gap(10),
//       itemBuilder: (context , index) {
//         return  Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10) ,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Icon(Icons.sunny) ,
//               Text('الفجر' , style: TextStyles.textStyle20,),
//               Text('ص 03:33' ,style: TextStyles.textStyle20, )
//             ],
//           ),
//         ) ;
//       },
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:adhan_dart/adhan_dart.dart';

class PrayersList extends StatelessWidget {
  final PrayerTimes prayerTimes;
  const PrayersList({super.key, required this.prayerTimes});

  @override
  Widget build(BuildContext context) {
    // قائمة الصلوات بالترتيب
    final prayers = [
      {'name': 'الفجر', 'time': prayerTimes.fajr},
      {'name': 'الشروق', 'time': prayerTimes.sunrise},
      {'name': 'الظهر', 'time': prayerTimes.dhuhr},
      {'name': 'العصر', 'time': prayerTimes.asr},
      {'name': 'المغرب', 'time': prayerTimes.maghrib},
      {'name': 'العشاء', 'time': prayerTimes.isha},
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
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.sunny),
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