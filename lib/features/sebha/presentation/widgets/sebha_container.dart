import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 120),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.brownColor.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.brownColor.withValues(alpha: 0.1),
              ),
              child: IconButton(
                onPressed: nextButton,
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            Gap(10),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  zeker,
                  key: ValueKey(zeker),
                  style: TextStyles.textStyle20.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.brownColor.withValues(alpha: 0.1),
              ),
              child: IconButton(
                onPressed: previousButton,
                icon: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
