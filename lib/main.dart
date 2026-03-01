import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/routes/routes.dart';
import 'package:islamic_app/core/services/local/shared_pref.dart';
import 'package:islamic_app/core/theme_cubit/theme_cubit.dart';
import 'package:islamic_app/core/theme_cubit/theme_states.dart';
import 'package:islamic_app/core/utils/themes.dart';
import 'package:islamic_app/features/hijri_calendar/data/services/hijri_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPref.init();
  HijriService.init() ;
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      startLocale: Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          bool isDark = context.read<ThemeCubit>().isDarkTheme;
          return Container(
            decoration: !isDark
                ? BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill,
                    ),
                  )
                : null,
            child: MaterialApp.router(
              routerConfig: Routes.routes,
              debugShowCheckedModeBanner: false,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
            ),
          );
        },
      ),
    );
  }
}
