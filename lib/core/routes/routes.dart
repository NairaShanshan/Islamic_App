import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/asma_allah/data/services/asmaa_allah_service.dart';
import 'package:islamic_app/features/asma_allah/presentation/cubit/cubit.dart';
import 'package:islamic_app/features/asma_allah/presentation/pages/asma_allah_screen.dart';
import 'package:islamic_app/features/asmaa_mohamed/data/services/mohamed_names_service.dart';
import 'package:islamic_app/features/asmaa_mohamed/presentation/cubit/cubit.dart';
import 'package:islamic_app/features/asmaa_mohamed/presentation/pages/mohamed_names_screen.dart';
import 'package:islamic_app/features/azkar/data/models/azkar_model.dart';
import 'package:islamic_app/features/azkar/data/services/azkar_service.dart';
import 'package:islamic_app/features/azkar/presentation/cubit/cubit.dart';
import 'package:islamic_app/features/azkar/presentation/pages/azkar_details_screen.dart';
import 'package:islamic_app/features/azkar/presentation/pages/azkar_screen.dart';
import 'package:islamic_app/features/home/presentation/pages/home_screen.dart';

class Routes {
  static const String home = '/';
  static const String asmaaAllah = '/asmaaAllah';
  static const String asmaaMohamed = '/asmaaMohamed';
  static const String azkar = '/azkar';
  static const String azkarDetails = '/azkarDetails';

  static final routes = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(path: home, builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: asmaaAllah,
        builder: (context, state) => BlocProvider(
          create: (context) => AsmaaAllahCubit(AsmaaService())..getAsmaaAllah(),
          child: const AsmaAllahScreen(),
        ),
      ),
      GoRoute(
        path: asmaaMohamed,
        builder: (context, state) => BlocProvider(
          create: (context) => MohamedNamesCubit(MohamedNamesService())..getMohamedNames(),
          child:  MohamedNamesScreen(),
        ),
      ),
      GoRoute(
        path: azkar,
        builder: (context, state) => BlocProvider(create: (context) => AzkarCubit(AzkarService())..getAzkar() , child: const AzkarScreen()),
      ),
      GoRoute(
        path: azkarDetails,
        builder: (context, state) {
          final azkarList = state.extra as List<AzkarModel>;
          return AzkarDetailsScreen(azkarList: azkarList) ;
        }
        ,
      ),
    ],
  );
}
