import 'daily_forecast_model.dart';

class WeatherDetailsModel {
  final String city;
  final int temperature;
  final String condition;
  final int maxTemp;
  final int minTemp;
  final int aqi;
  final String backgroundImage;
  final List<DailyForecastModel> forecast;

  const WeatherDetailsModel({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
    required this.aqi,
    required this.backgroundImage,
    required this.forecast,
  });
}

final List<WeatherDetailsModel> weatherDetailsMockList = [
  WeatherDetailsModel(
    city: 'Cairo',
    temperature: 38,
    condition: 'clear',
    maxTemp: 38,
    minTemp: 25,
    aqi: 53,
    backgroundImage: 'assets/images/cairo.png',
    forecast: const [
      DailyForecastModel(
        day: 'Mon',
        condition: 'clear',
        icon: "🌟",
        maxTemp: 39,
        minTemp: 26,
      ),
      DailyForecastModel(
        day: 'Tue',
        condition: 'clear',
        icon: "🌟",
        maxTemp: 39,
        minTemp: 26,
      ),
      DailyForecastModel(
        day: 'Wed',
        condition: 'sunny',
        icon: "☀️",
        maxTemp: 40,
        minTemp: 27,
      ),
      DailyForecastModel(
        day: 'Thu',
        condition: 'clear',
        icon: "🌟",
        maxTemp: 38,
        minTemp: 25,
      ),
      DailyForecastModel(
        day: 'Fri',
        condition: 'sunny',
        icon: "☀️",
        maxTemp: 37,
        minTemp: 24,
      ),
    ],
  ),

  WeatherDetailsModel(
    city: 'Alexandria',
    temperature: 35,
    condition: 'cloudy',
    maxTemp: 35,
    minTemp: 24,
    aqi: 48,
    backgroundImage: 'assets/images/alexandria.png',
    forecast: const [
      DailyForecastModel(
        day: 'Mon',
        condition: 'cloudy',
        icon: "☁️",
        maxTemp: 34,
        minTemp: 23,
      ),
      DailyForecastModel(
        day: 'Tue',
        condition: 'clear',
        icon: "☀️",
        maxTemp: 35,
        minTemp: 24,
      ),
      DailyForecastModel(
        day: 'Wed',
        condition: 'windy',
        icon: "💨",
        maxTemp: 33,
        minTemp: 22,
      ),
      DailyForecastModel(
        day: 'Thu',
        condition: 'cloudy',
        icon: "☁️",
        maxTemp: 34,
        minTemp: 23,
      ),
      DailyForecastModel(
        day: 'Fri',
        condition: 'sunny',
        icon: "☀️",
        maxTemp: 36,
        minTemp: 25,
      ),
    ],
  ),

  WeatherDetailsModel(
    city: 'Tokyo',
    temperature: 30,
    condition: 'rainy',
    maxTemp: 31,
    minTemp: 22,
    aqi: 61,
    backgroundImage: 'assets/images/tokyo.png',
    forecast: const [
      DailyForecastModel(
        day: 'Mon',
        condition: 'rain',
        icon: "🌧️",
        maxTemp: 29,
        minTemp: 21,
      ),
      DailyForecastModel(
        day: 'Tue',
        condition: 'cloudy',
        icon: "☁️",
        maxTemp: 30,
        minTemp: 22,
      ),
      DailyForecastModel(
        day: 'Wed',
        condition: 'clear',
        icon: "☀️",
        maxTemp: 31,
        minTemp: 23,
      ),
      DailyForecastModel(
        day: 'Thu',
        condition: 'rain',
        icon: "🌧️",
        maxTemp: 28,
        minTemp: 21,
      ),
      DailyForecastModel(
        day: 'Fri',
        condition: 'sunny',
        icon: "☀️",
        maxTemp: 32,
        minTemp: 24,
      ),
    ],
  ),

  WeatherDetailsModel(
    city: 'Paris',
    temperature: 35,
    condition: 'cloudy',
    maxTemp: 35,
    minTemp: 24,
    aqi: 48,
    backgroundImage: 'assets/images/alexandria.png',
    forecast: const [
      DailyForecastModel(
        day: 'Mon',
        condition: 'cloudy',
        icon: "☁️",
        maxTemp: 34,
        minTemp: 23,
      ),
      DailyForecastModel(
        day: 'Tue',
        condition: 'clear',
        icon: "☀️",
        maxTemp: 35,
        minTemp: 24,
      ),
      DailyForecastModel(
        day: 'Wed',
        condition: 'windy',
        icon: "💨",
        maxTemp: 33,
        minTemp: 22,
      ),
      DailyForecastModel(
        day: 'Thu',
        condition: 'cloudy',
        icon: "☁️",
        maxTemp: 34,
        minTemp: 23,
      ),
      DailyForecastModel(
        day: 'Fri',
        condition: 'sunny',
        icon: "☀️",
        maxTemp: 36,
        minTemp: 25,
      ),
    ],
  ),

  WeatherDetailsModel(
    city: 'London',
    temperature: 35,
    condition: 'cloudy',
    maxTemp: 35,
    minTemp: 24,
    aqi: 48,
    backgroundImage: 'assets/images/alexandria.png',
    forecast: const [
      DailyForecastModel(
        day: 'Mon',
        condition: 'cloudy',
        icon: "☁️",
        maxTemp: 34,
        minTemp: 23,
      ),
      DailyForecastModel(
        day: 'Tue',
        condition: 'clear',
        icon: "☀️",
        maxTemp: 35,
        minTemp: 24,
      ),
      DailyForecastModel(
        day: 'Wed',
        condition: 'windy',
        icon: "💨",
        maxTemp: 33,
        minTemp: 22,
      ),
      DailyForecastModel(
        day: 'Thu',
        condition: 'cloudy',
        icon: "☁️",
        maxTemp: 34,
        minTemp: 23,
      ),
      DailyForecastModel(
        day: 'Fri',
        condition: 'sunny',
        icon: "☀️",
        maxTemp: 36,
        minTemp: 25,
      ),
    ],
  ),
];
