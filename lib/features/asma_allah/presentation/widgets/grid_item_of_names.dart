import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

class GridItemForNames extends StatelessWidget {
  const GridItemForNames({super.key, required this.title, required this.subTitle});
  final String title ;
  final String subTitle ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        border: BoxBorder.all(
          color: AppColors.brownColor
        )

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyles.textStyle24 , textAlign: TextAlign.center,),
          Gap(5),
          Text(
            subTitle,
            style: TextStyles.textStyle14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
