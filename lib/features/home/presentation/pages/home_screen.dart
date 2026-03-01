import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/constants/app_images.dart';
import 'package:islamic_app/core/routes/navigations.dart';
import 'package:islamic_app/core/routes/routes.dart';
import 'package:islamic_app/core/theme_cubit/theme_cubit.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/hijri_calendar/data/services/hijri_service.dart';
import 'package:islamic_app/features/home/presentation/widgets/gridview.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final hijri = HijriService.getCurrentHijri();
    final today = DateTime.now();



    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr() , style: TextStyles.textStyle24,),
        actions: [
          IconButton(onPressed: (){
            context.read<ThemeCubit>().changeTheme() ;
          }, icon: Icon(Icons.nights_stay_outlined)) ,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      HijriService.formatHijriDate(hijri),
                      style: TextStyles.textStyle20,
                    ),
                    const Gap(6),
                    Text(
                      HijriService.formatGregorianDate(today),
                      style: TextStyles.textStyle16,
                    ),
                  ],
                ),
              ),
              Gap(25),
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: BoxBorder.all(color: AppColors.brownColor),
                    borderRadius: BorderRadius.circular(25) ,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.quran , width: 50, height: 50,) ,
                      Gap(10) ,
                      Text('quran_kareem'.tr() , style: TextStyles.textStyle20,) ,
                    ],
                  ),
                ),
              ) ,
              Gap(25),
              GridviewHome(),
              Gap(25),
              GestureDetector(
                onTap: (){
                  pushTo(context, Routes.calender) ;
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: AppColors.brownColor),
                    borderRadius: BorderRadius.circular(25) ,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Icon(Icons.calendar_month_outlined , size: 35, color: AppColors.brownColor,) ,
                      Gap(10) ,
                      Text(
                      'calender'.tr(), style: TextStyles.textStyle20,) ,
                    ],
                  ),
                ),
              ) ,




            ],
          ),
        ),
      ),
    );
  }
}
