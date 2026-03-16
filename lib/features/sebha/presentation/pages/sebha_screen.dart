import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:islamic_app/features/sebha/presentation/cubit/sebha_cubit.dart';
import 'package:islamic_app/features/sebha/presentation/cubit/sebha_states.dart';
import 'package:islamic_app/features/sebha/presentation/widgets/sebha_beads.dart';
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
          IconButton(onPressed: () {
            context.read<SebhaCubit>().resetCounter() ;
          }, icon: Icon(Icons.refresh_sharp , size: 30,)),
        ],
      ),
      body: BlocBuilder<SebhaCubit, SebhaStates>(
        builder: (context, state) {
          final cubit = context.read<SebhaCubit>();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
            child: Column(
              children: [
                SebhaContainer(
                  zeker: cubit.currentZeker.zekr,
                  nextButton: cubit.previousZekr,
                  previousButton: cubit.nextZekr,
                ),
                Spacer(flex: 1),
                BeadsArcWidget(counter: cubit.counter),
                Spacer(flex: 2),
                SebhaButton(
                  counterButton: cubit.incrementCounter,
                  counterText: '${cubit.currentZeker.count} / ${cubit.counter}',
                ),
                Gap(30),
              ],
            ),
          );
        },
      ),
    );
  }
}
