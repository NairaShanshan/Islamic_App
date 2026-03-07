import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';

class PrayerUtils {

  static String getPrayerName(Prayer prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return "الفجر";
      case Prayer.dhuhr:
        return "الظهر";
      case Prayer.asr:
        return "العصر";
      case Prayer.maghrib:
        return "المغرب";
      case Prayer.ishaBefore:
        return "العشاء " ;
      case Prayer.isha:
        return "العشاء";
      default:
        return "";
    }
  }

  static IconData getPrayerIcon(Prayer prayer) {
    switch (prayer) {
      case Prayer.fajr:
        return Icons.wb_twilight;
      case Prayer.dhuhr:
        return Icons.wb_sunny;
      case Prayer.asr:
        return Icons.sunny;
      case Prayer.maghrib:
        return Icons.nightlight_round;
      case Prayer.ishaBefore :
        return Icons.nightlight_outlined ;
      case Prayer.isha:
        return Icons.nightlight_outlined;
      default:
        return Icons.access_time;
    }
  }

  static String formatTime(DateTime time) {
    return "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
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