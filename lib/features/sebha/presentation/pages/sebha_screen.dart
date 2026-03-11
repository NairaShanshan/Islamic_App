import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/features/sebha/presentation/cubit/sebha_cubit.dart';
import 'package:islamic_app/features/sebha/presentation/cubit/sebha_states.dart';
import 'package:islamic_app/features/sebha/presentation/widgets/sebha.dart';
import 'package:islamic_app/features/sebha/presentation/widgets/sebha_button.dart';
import 'package:islamic_app/features/sebha/presentation/widgets/sebha_container.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tasbih'.tr()),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh_sharp)),
        ],
      ),
      body: BlocBuilder<SebhaCubit, SebhaStates>(
        builder: (context, state) {
          final cubit = context.read<SebhaCubit>();
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SebhaContainer(
                  zeker: cubit.currentZeker.zekr,
                  nextButton: cubit.previousZekr,
                  previousButton: cubit.nextZekr,
                ),
                Gap(20),
                SebhaBeads(count: 10),
                Gap(30),
                SebhaButton(
                  counterButton: cubit.incrementCounter,
                  counterText: '${cubit.counter} / ${cubit.currentZeker.count}',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
