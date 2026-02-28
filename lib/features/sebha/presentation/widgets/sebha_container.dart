import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

class SebhaContainer extends StatelessWidget {
  const SebhaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.cardColor ,
        borderRadius: BorderRadius.circular(10) ,

      ),
      child: Center(child: Text('data' , style: TextStyles.textStyle20, )),
    );
  }
}
