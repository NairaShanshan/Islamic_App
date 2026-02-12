import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/asma_allah/data/services/asmaa_allah_service.dart';
import 'package:islamic_app/features/asma_allah/presentation/cubit/states.dart';

class AsmaaAllahCubit extends Cubit<AsmaaAllahStates> {

  AsmaaAllahCubit(this.service): super(InitialAsmaaAllahState()) ;

  final AsmaaService service ;

  Future<void> getAsmaaAllah () async {

    try {
      emit(LoadingAsmaaAllahState()) ;

      final names =await service.loadAsmaa() ;
      emit(SuccessAsmaaAllahState(names)) ;
    } on Exception catch (e) {
      e.toString();
      emit(ErrorAsmaaAllahState("Failed to load data")) ;
    }

  }


}