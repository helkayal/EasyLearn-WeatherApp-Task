import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/features/onboarding/widgets/onboarding_button.dart';
import 'package:weather_app/features/onboarding/widgets/weather_cloud_sun.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            WeatherClouldSun(),
            Spacer(),
            OnboardingButton(),
            Gap(30),
          ],
        ),
      ),
    );
  }
}
