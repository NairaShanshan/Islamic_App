import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/constants/app_images.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/home/presentation/widgets/gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr()),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.nights_stay_outlined)) ,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
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
                    color: AppColors.primaryColor,
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
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
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
