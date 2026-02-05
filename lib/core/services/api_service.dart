import 'package:dio/dio.dart';
import 'package:weather_app/core/helpers/api_helper.dart';
import 'package:weather_app/core/helpers/local_storage_helper.dart';
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
  static const pexelsApiKey =
      'agEr9PbnwZBH1EoJ8oACkeuR04ftDJMGeoA3o9A9evY3W4wvUBU68OWE';

  static Future<String?> getCityImage(String city) async {
    final cached = LocalStorageHelper.getCityImage(city);
    if (cached != null) return cached;

    final response = await ApiHelper.dio.get(
      '${pexelsApiBaseUrl}search',
      queryParameters: {'query': city, 'per_page': 1},
      options: Options(headers: {'Authorization': pexelsApiKey}),
    );

    final photos = response.data['photos'] as List;
    if (photos.isEmpty) return null;

    return photos.first['src']['portrait'];
  }
}
