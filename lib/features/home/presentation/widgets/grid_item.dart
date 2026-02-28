import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

Widget gridItem({required String imageName,required String name, required Function() onTap}) {

  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(5) ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10) ,
        border: BoxBorder.all(color: AppColors.brownColor)

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageName , width: 50, height: 50,) ,
          Gap(4) ,
          Text(name , style: TextStyles.textStyle14,) ,
        ],
      ),
    ),
  );
}