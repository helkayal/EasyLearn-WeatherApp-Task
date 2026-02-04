import 'condition_model.dart';

class DayWeatherModel {
  final double maxTempC;
  final double minTempC;
  final ConditionModel condition;

  const DayWeatherModel({
    required this.maxTempC,
    required this.minTempC,
    required this.condition,
  });

  factory DayWeatherModel.fromJson(Map<String, dynamic> json) {
    return DayWeatherModel(
      maxTempC: (json['maxtemp_c'] as num).toDouble(),
      minTempC: (json['mintemp_c'] as num).toDouble(),
      condition: ConditionModel.fromJson(json['condition']),
    );
  }
}
