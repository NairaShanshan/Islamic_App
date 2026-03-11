import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

class NawafilList extends StatelessWidget {
  const NawafilList({super.key});

  @override
  Widget build(BuildContext context) {

    final nawafils = [
      {'name': 'الفجر', 'count': '2 قبل الفريضه' , 'title' : 'قبل'  },
      {'name': 'الظهر', 'count': '4 قبل الفريضه و 2 بعدها' ,'title' : 'قبل و بعد '  },
      {'name': 'العصر', 'count': 'لا يوجد' , 'title' : 'قبل'  },
      {'name': 'المغرب', 'count': '2 بعد الفريضه' , 'title' : 'قبل'  },
      {'name': 'العشاء', 'count': '2 بعد الفريضه' , 'title' : 'قبل'  },
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
                  Text(nawafil['title'] as String ,style: TextStyles.textStyle20, ),
                ],
              ),
              Text(nawafil['count'] as String ,style: TextStyles.textStyle20, ),
            ],
          ),
        ) ;
      },

    );
  }
}
