import 'package:weather_app/core/helpers/local_storage_helper.dart';
import 'package:weather_app/core/services/api_service.dart';
import 'package:weather_app/features/models/weather_response_model.dart';

class ApiUtils {
  static Future<void> loadCityWeather({required String city}) async {
    final WeatherResponseModel weather = await ApiService.getWeather(city);

    final String? imageUrl = await ApiService.getCityImage(city);

    await LocalStorageHelper.saveLastCity(city);

    if (imageUrl != null) {
      await LocalStorageHelper.saveCityImage(city: city, imageUrl: imageUrl);
    }

    weatherList.removeWhere(
      (e) => e.location.name.toLowerCase() == city.toLowerCase(),
    );
    weatherList.add(weather);
  }

  static Future<WeatherResponseModel> fetchCityWeatherOnly({
    required String city,
  }) async {
    return await ApiService.getWeather(city);
  }

  static Future<void> addCity({
    required String city,
    required WeatherResponseModel weather,
    String? imageUrl,
  }) async {
    await LocalStorageHelper.saveLastCity(city);

    if (imageUrl != null) {
      await LocalStorageHelper.saveCityImage(city: city, imageUrl: imageUrl);
    }

    weatherList.removeWhere(
      (e) => e.location.name.toLowerCase() == city.toLowerCase(),
    );

    weatherList.add(weather);
  }
}
