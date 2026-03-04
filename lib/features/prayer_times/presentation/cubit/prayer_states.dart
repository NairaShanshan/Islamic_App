import 'package:adhan_dart/adhan_dart.dart';

class PrayerTimesStates{}

class PrayerTimesInitialState extends PrayerTimesStates {}

class PrayerTimesLoadingState extends PrayerTimesStates {}

class PrayerTimesSuccessState extends PrayerTimesStates {
  final PrayerTimes prayerTimes ;

  PrayerTimesSuccessState({required this.prayerTimes});
}

class PrayerTimesErrorState extends PrayerTimesStates {
  final String message ;

  PrayerTimesErrorState({required this.message});
}



