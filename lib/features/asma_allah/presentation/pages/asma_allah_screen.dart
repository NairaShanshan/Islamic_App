import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/asma_allah/presentation/cubit/cubit.dart';
import 'package:islamic_app/features/asma_allah/presentation/cubit/states.dart';
import 'package:islamic_app/features/asma_allah/presentation/widgets/grid_item_of_names.dart';

class AsmaAllahScreen extends StatelessWidget {
  const AsmaAllahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('namesAllah'.tr()), centerTitle: true),
      body: BlocBuilder<AsmaaAllahCubit , AsmaaAllahStates>(
        builder: (context , state) {
          if(state is LoadingAsmaaAllahState ){
            return Center(child: CircularProgressIndicator());
          }
          if (state is ErrorAsmaaAllahState) {
            return Center(child: Text(state.message),) ;
          }
          if(state is SuccessAsmaaAllahState) {
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
                return GridItemForNames(title: item.name, subTitle: item.meaning) ;
              },
            ) ;
          }
          return SizedBox() ;
        },

      ),
    );
  }
}
