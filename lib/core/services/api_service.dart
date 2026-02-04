import 'package:weather_app/core/helpers/api_helper.dart';
import 'package:weather_app/features/models/weather_response_model.dart';

class ApiService {
  static const weatherApiKey = '7319c78c20574782aba165546243107';
  static const weatherApiBaseUrl = 'http://api.weatherapi.com/v1/';

  static Future<WeatherResponseModel> getWeather(String city) async {
    final response = await ApiHelper.dio.get(
      '${weatherApiBaseUrl}forecast.json',
      queryParameters: {
        'key': weatherApiKey,
        'q': city,
        'days': 3,
        'aqi': 'yes',
        'alerts': 'no',
      },
    );

    return WeatherResponseModel.fromJson(response.data);
  }

  /////////////////////////////////////////////////////////

  static const pexelsApiBaseUrl = 'https://api.pexels.com/v1/';

  static Future<String?> getCityImage(String city) async {
    final response = await ApiHelper.dio.get(
      '${pexelsApiBaseUrl}search',
      queryParameters: {'query': city, 'per_page': 1},
    );

    final photos = response.data['photos'] as List;
    if (photos.isEmpty) return null;

    return photos.first['src']['portrait'];
  }
}
