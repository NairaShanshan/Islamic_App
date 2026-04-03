import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';

class PrayerUtils {

  static String getPrayerName(Prayer prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return "الفجر";
      case Prayer.sunrise:
        return "الشروق";
      case Prayer.dhuhr:
        return "الظهر";
      case Prayer.asr:
        return "العصر";
      case Prayer.maghrib:
        return "المغرب";
      case Prayer.isha:
      case Prayer.ishaBefore :
        return "العشاء " ;
      case Prayer.fajrAfter :
        return "الفجر";

    }
  }

  static IconData getPrayerIcon(Prayer prayer) {
    switch (prayer) {
      case Prayer.fajr:
      case Prayer.fajrAfter:
        return Icons.wb_twilight;
      case Prayer.sunrise:
        return Icons.wb_sunny_outlined;
      case Prayer.dhuhr:
        return Icons.wb_sunny;
      case Prayer.asr:
        return Icons.sunny;
      case Prayer.maghrib:
        return Icons.nightlight_round;
      case Prayer.isha:
      case Prayer.ishaBefore :
        return Icons.nightlight_outlined ;

    }
  }

  static String formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'م' : 'ص';

    return "$hour:$minute $period";
  }

  static String formatRemaining(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    return "${hours.toString().padLeft(2,'0')}:"
        "${minutes.toString().padLeft(2,'0')}:"
        "${seconds.toString().padLeft(2,'0')}";
  }
}