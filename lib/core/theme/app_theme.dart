import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,

    fontFamily: GoogleFonts.kadwa.toString(),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.black40Bold,
      displayMedium: AppTextStyles.white24Bold,
      displaySmall: AppTextStyles.grey14Regular,

      headlineLarge: AppTextStyles.black70Bold,
      headlineMedium: AppTextStyles.black32Bold,
      headlineSmall: AppTextStyles.black20Bold,

      bodyLarge: AppTextStyles.white40Bold,
      bodyMedium: AppTextStyles.white24Bold,
      bodySmall: AppTextStyles.white14Bold,

      titleLarge: AppTextStyles.lightGrey20Bold,
      titleMedium: AppTextStyles.white18Bold,
      titleSmall: AppTextStyles.lightGrey18Regular,
    ),

    colorScheme: const ColorScheme.light(
      primary: AppColors.blackColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.purpleColor,
      onSecondary: AppColors.lightPurpleColor,
      tertiary: AppColors.tealColor,
      onTertiary: AppColors.lightTealColor,
      surface: AppColors.darkPurpleColor,
      onSurface: AppColors.greyColor,
    ),
  );
}
