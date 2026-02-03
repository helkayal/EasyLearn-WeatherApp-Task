import 'package:flutter/material.dart';
import 'package:weather_app/features/search/widgets/city_card.dart';
import 'package:weather_app/features/weather/screens/alexandria.dart';
import 'package:weather_app/features/weather/screens/cairo.dart';
import 'package:weather_app/features/weather/screens/tokro.dart';

class CityList extends StatelessWidget {
  const CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      children: [
        CityCard(
          city: 'Cairo',
          temp: '38°',
          aqi: 'AQI 53',
          range: '38° / 25°',
          navigateTo: const Cairo(),
        ),
        CityCard(
          city: 'Alexandra',
          temp: '35°',
          aqi: 'AQI 53',
          range: '35° / 25°',
          navigateTo: const Alexandria(),
        ),
        CityCard(
          city: 'Tokyo',
          temp: '38°',
          aqi: 'AQI 53',
          range: '38° / 25°',
          navigateTo: const Tokro(),
        ),
      ],
    );
  }
}
