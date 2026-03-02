import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/core/utils/text_styles.dart';
import 'package:islamic_app/features/prayer_times/presentation/widgets/nawafil_list.dart';
import 'package:islamic_app/features/prayer_times/presentation/widgets/prayer_header.dart';
import 'package:islamic_app/features/prayer_times/presentation/widgets/prayers_list.dart';


class PrayersScreen extends StatelessWidget {
  const PrayersScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(title: Text('praying'.tr()), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            PrayerHeader() ,
            Gap(20),
            Expanded(child: PrayersList()) ,
            Gap(20),
            Text('السنن والنوافل' , style: TextStyles.textStyle24,) ,
            Expanded(child: NawafilList()) ,
          ],
        ),
      ),
    );
  }
}
