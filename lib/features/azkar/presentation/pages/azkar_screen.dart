import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/routes/navigations.dart';
import 'package:islamic_app/core/routes/routes.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/features/azkar/presentation/cubit/cubit.dart';
import 'package:islamic_app/features/azkar/presentation/cubit/states.dart';
import 'package:islamic_app/features/azkar/presentation/widgets/list_item.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('azkar'.tr()), centerTitle: true),
      body: BlocBuilder<AzkarCubit, AzkarStates>(
        builder: (context, state) {
          if (state is LoadingAzkarState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ErrorAzkarState) {
            return Center(child: Text(state.message));
          }
          if (state is LoadedAzkarState) {
            final categories = state.azkarByCategory.keys.toList();
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final category = categories[index] ;
                  return ListItem(
                    title: category,
                    onTap: () {
                      pushTo(context, Routes.azkarDetails , extra: state.azkarByCategory[category]) ;
                    }
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: AppColors.accentColor);
                },
                itemCount: categories.length,
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
