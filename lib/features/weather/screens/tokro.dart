import 'package:flutter/material.dart';
import 'package:weather_app/features/models/weather_details_model.dart';
import 'package:weather_app/features/weather/widgets/weather_view.dart';

class Tokro extends StatelessWidget {
  const Tokro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherView(
        model: weatherDetailsMockList.firstWhere((e) => e.city == 'Tokyo'),
      ),
    );
  }
}
