class DailyForecastModel {
  final String day;
  final String condition;
  final String icon;
  final int maxTemp;
  final int minTemp;

  const DailyForecastModel({
    required this.day,
    required this.condition,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
  });
}
