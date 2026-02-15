import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/asmaa_mohamed/data/services/mohamed_names_service.dart';
import 'package:islamic_app/features/asmaa_mohamed/presentation/cubit/states.dart';

class MohamedNamesCubit extends Cubit<MohamedNamesStates> {

  MohamedNamesCubit(this.service) : super(InitialMohamedNamesState()) ;

  final MohamedNamesService service ;

 Future<void> getMohamedNames()async{

    try {
      emit(LoadingMohamedNamesState()) ;
      final names = await service.loadNames() ;
      emit(SuccessMohamedNamesState(names)) ;
    } catch (e) {
     log(e.toString()) ;
     emit(ErrorMohamedNamesState('Failed to load data')) ;
    }

  }


}