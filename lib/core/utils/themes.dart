
import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/app_colors.dart';
import 'package:islamic_app/core/utils/app_fonts.dart';
import 'package:islamic_app/core/utils/text_styles.dart';


class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.brownColor,
        titleTextStyle: TextStyle(
          color: AppColors.brownColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.cairo,
        ),

      ),
      fontFamily: AppFonts.cairo,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.darkColor),
      ),
      cardColor: AppColors.cardColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.brownColor,
        onSurface: AppColors.darkColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      dividerTheme: DividerThemeData(color: AppColors.greyColor),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.accentColor,
        filled: true,
        prefixIconColor: AppColors.primaryColor,
        suffixIconColor: AppColors.primaryColor,
        hintStyle: TextStyles.textStyle16.copyWith(color: AppColors.greyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.darkColor,
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.darkColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.cairo,
        ),

      ),
      cardColor: AppColors.darkColor,
      fontFamily: AppFonts.cairo,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.accentColor),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.accentColor,
        secondary: AppColors.primaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      dividerTheme: DividerThemeData(color: AppColors.greyColor),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.accentColor,
        filled: true,
        prefixIconColor: AppColors.primaryColor,
        suffixIconColor: AppColors.primaryColor,
        hintStyle: TextStyles.textStyle16.copyWith(color: AppColors.greyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
