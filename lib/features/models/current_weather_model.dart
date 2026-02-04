import 'package:weather_app/features/models/air_quality_model.dart';

import 'condition_model.dart';

class CurrentWeatherModel {
  final double tempC;
  final bool isDay;
  final ConditionModel condition;
  final AirQualityModel airQuality;

  const CurrentWeatherModel({
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.airQuality,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      tempC: (json['temp_c'] as num).toDouble(),
      isDay: json['is_day'] == 1,
      condition: ConditionModel.fromJson(json['condition']),
      airQuality: AirQualityModel.fromJson(json['air_quality']),
    );
  }
}
