import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/azkar/data/models/azkar_model.dart';

class AzkarDetailsScreen extends StatelessWidget {
  const AzkarDetailsScreen({super.key, required this.azkarList});

  final List<AzkarModel> azkarList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(azkarList.first.category), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemCount: azkarList.length,
          separatorBuilder: (context, index) => Gap(10),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).cardColor,
                border: BoxBorder.all(
                  color: AppColors.brownColor
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text(
                    azkarList[index].zekr,
                    style: TextStyles.textStyle18,
                    textAlign: TextAlign.center,
                  ),
                  Gap(15),
                  if (azkarList[index].description?.isNotEmpty ?? false)
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: BoxBorder.all(
                          color: AppColors.brownColor
                        ) ,
                        color: Color(0xFFCFB8AA)
                      ),
                      child: Text(
                        azkarList[index].description!,
                        style: TextStyles.textStyle16.copyWith(
                          color: Colors.pink[900],
                        ),
                      ),
                    ),
                  if (azkarList[index].description?.isNotEmpty ?? false) Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        azkarList[index].count?.isNotEmpty ?? false
                            ? '<${azkarList[index].count} مرات>'
                            : "",
                        style: TextStyles.textStyle14,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


