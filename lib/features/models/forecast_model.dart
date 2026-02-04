import 'forecast_day_model.dart';

class ForecastModel {
  final List<ForecastDayModel> forecastDays;

  const ForecastModel({required this.forecastDays});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      forecastDays: (json['forecastday'] as List)
          .map((e) => ForecastDayModel.fromJson(e))
          .toList(),
    );
  }
}
