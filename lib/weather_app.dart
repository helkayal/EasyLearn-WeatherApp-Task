import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_theme.dart';
import 'package:weather_app/features/onboarding/screen/onboarding_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
