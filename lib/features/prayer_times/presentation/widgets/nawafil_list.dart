import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

class NawafilList extends StatelessWidget {
  const NawafilList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
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
              Text('الفجر' , style: TextStyles.textStyle20,),
              Text(' 2 قبل' ,style: TextStyles.textStyle20, ),
              Text('بعد 0' ,style: TextStyles.textStyle20, ),
            ],
          ),
        ) ;
      },

    );
  }
}
