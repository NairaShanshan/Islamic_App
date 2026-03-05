import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamic_app/features/prayer_times/presentation/cubit/prayer_states.dart';

import '../../../../core/services/local/shared_pref.dart';
import '../../data/services/location_service.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesStates> {

  PrayerTimesCubit() : super(PrayerTimesInitialState()) ;

  Future<void> loadPrayerTimes() async {
    emit(PrayerTimesLoadingState());

    try {
      double? lat = SharedPref.getLatitude();
      double? lng = SharedPref.getLongitude();

      Coordinates coordinates;

      if (lat != null && lng != null) {
        coordinates = Coordinates(lat, lng);
      } else {
        print("Requesting location...");
        Position position = await LocationService.getCurrentLocation();

        lat = position.latitude;
        lng = position.longitude;
        print("Position: ${position.latitude}, ${position.longitude}");

        SharedPref.saveLocation(lat, lng);

        coordinates = Coordinates(lat, lng);
      }
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