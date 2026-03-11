import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';

class SebhaContainer extends StatelessWidget {
  const SebhaContainer({
    super.key,
    required this.zeker,
    required this.nextButton,
    required this.previousButton,
  });

  final String zeker;

  final void Function() nextButton;
  final void Function() previousButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          children: [
            IconButton(onPressed: nextButton, icon: Icon(Icons.arrow_back_ios)),
            Expanded(
              child: Text(
                zeker,
                style: TextStyles.textStyle20.copyWith(
                  color: Colors.black
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: previousButton,
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
