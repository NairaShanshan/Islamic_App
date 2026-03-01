import 'package:intl/intl.dart';
import 'package:hijri_date/hijri_date.dart';

class HijriService {

  static void init() {
    HijriDate.setLocal("ar");
  }

  static HijriDate getCurrentHijri() {
    return HijriDate.now();
  }

  static String formatHijriDate(HijriDate date) {
    return "${date.hDay} ${date.longMonthName} ${date.hYear}";
  }


  static String formatGregorianDate(DateTime date) {
    final formatter = DateFormat("EEEE d MMMM yyyy", "ar");
    return formatter.format(date);
  }

  static HijriDate getMonthStart(HijriDate date) {
    return HijriDate()
      ..hYear = date.hYear
      ..hMonth = date.hMonth
      ..hDay = 1;
  }

  static int getMonthLength(HijriDate date) {
    return date.lengthOfMonth;
  }

  static List<HijriDate> generateMonthDays(HijriDate date) {
    final start = getMonthStart(date);
    final length = getMonthLength(date);

    return List.generate(length, (index) {
      return HijriDate()
        ..hYear = start.hYear
        ..hMonth = start.hMonth
        ..hDay = index + 1;
    });
  }
}