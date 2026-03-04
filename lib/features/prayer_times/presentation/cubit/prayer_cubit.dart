import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamic_app/features/prayer_times/presentation/cubit/prayer_states.dart';

import '../../data/services/location_service.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesStates> {

  PrayerTimesCubit() : super(PrayerTimesInitialState()) ;

  Future<void> loadPrayerTimes() async {
    emit(PrayerTimesLoadingState());

    try {
      print("Requesting location...");
      Position position = await LocationService.getCurrentLocation();
      print("Position: ${position.latitude}, ${position.longitude}");

      final coordinates = Coordinates(position.latitude, position.longitude);

      final params = CalculationMethodParameters.egyptian();
      params.madhab = Madhab.hanafi;

      DateTime date = DateTime.now();

      final prayerTimes = PrayerTimes(date: date, coordinates: coordinates, calculationParameters: params);

      emit(PrayerTimesSuccessState(prayerTimes: prayerTimes));


    } catch (e) {
      print("Error getting location: $e");
      emit(PrayerTimesErrorState(message: e.toString())) ;
    }
  }


}