import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/services/local/shared_pref.dart';
import 'package:islamic_app/core/theme_cubit/theme_states.dart';

class ThemeCubit extends Cubit<ThemeStates> {

  ThemeCubit() : super(InitialThemeState()) ;

  bool isDarkTheme = SharedPref.isDarkTheme() ;

  void changeTheme(){
    isDarkTheme = !isDarkTheme ;
    SharedPref.setDarkTheme(isDarkTheme) ;
    emit(ChangeThemeState()) ;
  }


}