import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/azkar/data/models/azkar_model.dart';
import 'package:islamic_app/features/azkar/data/services/azkar_service.dart';
import 'package:islamic_app/features/azkar/presentation/cubit/states.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit(this.service) : super(InitialAzkarState());

  final AzkarService service;

  Future<void> getAzkar() async {
    try {
      emit(LoadingAzkarState());

      final azkar = await service.loadAzkar();
      final categories = azkar.fold<Map<String, List<AzkarModel>>>({}, (
        map,
        item,
      ) {
        map.putIfAbsent(item.category, () => []).add(item);
        return map;
      });
      emit(LoadedAzkarState(azkarByCategory: categories));
    } catch (e) {
      log(e.toString());
      emit(ErrorAzkarState(message: 'Failed to load Azkar'));
    }
  }
}
