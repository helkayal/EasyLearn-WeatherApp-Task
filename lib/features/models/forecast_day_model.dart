import 'day_weather_model.dart';

class ForecastDayModel {
  final DateTime date;
  final DayWeatherModel day;

  const ForecastDayModel({required this.date, required this.day});

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: DateTime.parse(json['date']),
      day: DayWeatherModel.fromJson(json['day']),
    );
  }
}
