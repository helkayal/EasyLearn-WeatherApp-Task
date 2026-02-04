import 'current_weather_model.dart';
import 'forecast_model.dart';

class WeatherResponseModel {
  final LocationModel location;
  final CurrentWeatherModel current;
  final ForecastModel forecast;

  const WeatherResponseModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherResponseModel(
      location: LocationModel.fromJson(json['location']),
      current: CurrentWeatherModel.fromJson(json['current']),
      forecast: ForecastModel.fromJson(json['forecast']),
    );
  }
}

class LocationModel {
  final String name;

  const LocationModel({required this.name});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json['name'] as String);
  }
}

List<WeatherResponseModel> weatherList = [];
