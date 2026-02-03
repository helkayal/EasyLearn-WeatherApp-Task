import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/weather_cloud_sun.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          bottom: -size.height * 0.55,
          left: -size.width * .45,
          right: -size.width * .45,
          child: Container(
            height: size.height * .9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
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
