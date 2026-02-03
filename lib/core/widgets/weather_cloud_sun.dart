import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherClouldSun extends StatelessWidget {
  const WeatherClouldSun({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/images/cloud_sun.svg",
          semanticsLabel: 'Weather',
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        Text('Weather', style: Theme.of(context).textTheme.displayLarge),
        Text('@wolf', style: Theme.of(context).textTheme.displaySmall),
      ],
    );
  }
}
