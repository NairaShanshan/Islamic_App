import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

class SebhaButton extends StatelessWidget {
  const SebhaButton({super.key , required this.counterButton, required this.counterText});
  final void Function()? counterButton ;
  final String counterText ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: counterButton,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50) ,
          color: AppColors.cardColor ,
          border: Border.all(
            color: AppColors.brownColor ,
          )
        ),
        child: Text(counterText , style: TextStyles.textStyle24.copyWith(
          color: AppColors.brownColor
        ), ),
      ),
    );
  }
}
