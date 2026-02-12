import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/asma_allah/presentation/widgets/grid_item_of_names.dart';
import 'package:islamic_app/features/asmaa_mohamed/presentation/cubit/cubit.dart';
import 'package:islamic_app/features/asmaa_mohamed/presentation/cubit/states.dart';

class MohamedNamesScreen extends StatelessWidget {
  const MohamedNamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('namesProphet'.tr()), centerTitle: true
      ),
      body: BlocBuilder<MohamedNamesCubit , MohamedNamesStates>(
        builder: (context , state) {
          if(state is LoadingMohamedNamesState ){
            return Center(child: CircularProgressIndicator());
          }
          if (state is ErrorMohamedNamesState) {
            return Center(child: Text(state.message),) ;
          }
          if(state is SuccessMohamedNamesState) {
            return  GridView.builder(
              padding: EdgeInsets.all(12),
              itemCount: state.names.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10 ,
                mainAxisSpacing: 10 ,
              ),
              itemBuilder: (context , index) {
                final item =state.names[index] ;
                return  GridItemForNames(title: item.name, subTitle: item.meaning) ;
              },
            ) ;
          }
          return SizedBox() ;
        },

      ),
    ) ;
  }
}
