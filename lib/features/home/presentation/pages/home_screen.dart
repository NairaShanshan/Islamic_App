import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/constants/app_images.dart';
import 'package:islamic_app/core/theme_cubit/theme_cubit.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/home/presentation/widgets/gridview.dart';
import 'package:hijri_date/hijri_date.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HijriDate.setLocal("ar"); // حطيه مرة واحدة قبل build
    HijriDate hijri = HijriDate.now();



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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10) ,

                ),
                child: Text(hijri.toFormat("dd MMMM yyyy")),
              ),
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
                onTap: (){},
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
                      Image.asset(AppImages.quran , width: 50, height: 50,) ,
                      Gap(10) ,
                      Text('quran_kareem'.tr() , style: TextStyles.textStyle20,) ,
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
