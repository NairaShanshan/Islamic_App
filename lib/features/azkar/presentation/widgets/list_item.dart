import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.title, required this.onTap});
  final String title ;
  final Function() onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10) ,
          color: AppColors.cardColor
        ),
        child: Row(

          children: [
            Expanded(child: Text(title , style: TextStyles.textStyle18, maxLines: 2, overflow: TextOverflow.ellipsis,)) ,
            Icon(Icons.arrow_forward_ios_rounded) ,
          ],
        ),
      ),
    );
  }
}
