import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/weather_cloud_sun.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -60,
          left: 0,
          right: 0,
          child: Image.asset("assets/images/oval.png"),
        ),
        const Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: WeatherClouldSun(),
        ),
      ],
    );
  }
}
