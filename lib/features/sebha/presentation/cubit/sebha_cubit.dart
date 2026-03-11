import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/sebha/data/sebha_model.dart';
import 'package:islamic_app/features/sebha/presentation/cubit/sebha_states.dart';

class SebhaCubit extends Cubit<SebhaStates> {
  SebhaCubit(): super(InitialSebhaState()) ;

  final List<SebhaModel> azkar = [
    SebhaModel(zekr: 'سبحان الله', count: 33) ,
    SebhaModel(zekr: 'الحمد الله', count: 33) ,
    SebhaModel(zekr: 'لا اله الا الله', count: 33) ,
    SebhaModel(zekr: '  الله اكبر ', count: 33) ,
    SebhaModel(zekr: 'لا حول و لا قوه الا بالله', count: 33) ,
    SebhaModel(zekr: 'سبحان الله و بحمده سبحان الله العظيم', count: 33) ,
    SebhaModel(zekr: 'استغفر الله العظيم واتوب اليه', count: 33) ,
    SebhaModel(zekr: 'اللهم صلى وسلم وبارك على سيدنا محمد', count: 33) ,
    SebhaModel(zekr: 'لا اله الا انت سبحانك انى كنت من الظالمين', count: 33) ,
    SebhaModel(zekr: 'حسبى الله لا اله الا هو عليه توكلت وهو رب العرش العظيم', count: 33) ,
  ] ;

  int counter = 0 ;
  int currentIndex = 0 ;

  SebhaModel get currentZeker => azkar[currentIndex] ;

  void nextZekr (){
    if(currentIndex < azkar.length -1) {
      currentIndex ++ ;
    }else{
      currentIndex =0 ;
    }
    counter = 0 ;
    emit(SuccessSebhaState()) ;
  }

  void previousZekr(){
    if(currentIndex > 0){
      currentIndex-- ;
    }else{
      currentIndex = azkar.length -1 ;
    }

    counter =0 ;
    emit(SuccessSebhaState());
  }

  void resetCounter (){
    counter =0 ;
    emit(SuccessSebhaState()) ;
  }

  void incrementCounter(){
    if(counter < currentZeker.count) {
      counter++ ;
      emit(SuccessSebhaState()) ;
    }
  }
}