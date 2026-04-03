import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

class NawafilList extends StatelessWidget {
  const NawafilList({super.key});

  @override
  Widget build(BuildContext context) {

    final nawafils = [
      {'name': 'الفجر', 'count': ' قبل الفريضه' , 'title' : '2 ركعه'  },
      {'name': 'الظهر', 'count': 'قبل و بعد الفريضه' ,'title' : '(2 ثم 2 ) قبل (2) بعد  '  },
      {'name': 'العصر', 'count': 'لا يوجد' , 'title' : ''  },
      {'name': 'المغرب', 'count': ' بعد الفريضه' , 'title' : '2 ركعه' },
      {'name': 'العشاء', 'count': ' بعد الفريضه' , 'title' : '2 ركعه'  },
    ] ;
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (context , index ) => Gap(10),
      itemBuilder: (context , index) {
        final nawafil = nawafils[index] ;
        return  Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10) ,
            border: Border.all(
              color: AppColors.cardColor
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(nawafil['name'] as String , style: TextStyles.textStyle20,),
                  Text(nawafil['count'] as String ,style: TextStyles.textStyle18, ),
                ],
              ),
              Gap(5),
              Text(nawafil['title'] as String ,style: TextStyles.textStyle18, ),
            ],
          ),
        ) ;
      },

    );
  }
}
