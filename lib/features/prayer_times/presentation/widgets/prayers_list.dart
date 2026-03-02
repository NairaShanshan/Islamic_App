import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

class PrayersList extends StatelessWidget {
  const PrayersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (context , index ) => Gap(10),
      itemBuilder: (context , index) {
        return  Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10) ,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.sunny) ,
              Text('الفجر' , style: TextStyles.textStyle20,),
              Text('ص 03:33' ,style: TextStyles.textStyle20, )
            ],
          ),
        ) ;
      },

    );
  }
}
