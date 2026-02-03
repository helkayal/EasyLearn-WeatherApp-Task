import 'package:flutter/material.dart';
import 'package:weather_app/features/models/weather_details_model.dart';
import 'package:weather_app/features/weather/widgets/weather_view.dart';

class WeatherDetails extends StatelessWidget {
  final String city;
  const WeatherDetails({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherView(
        model: weatherDetailsMockList.firstWhere((e) => e.city == city),
      ),
    );
  }
}
