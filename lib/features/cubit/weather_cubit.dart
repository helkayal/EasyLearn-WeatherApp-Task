import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/local_storage_helper.dart';
import 'package:weather_app/core/services/api_service.dart';
import 'package:weather_app/features/cubit/weather_state.dart';
import 'package:weather_app/features/models/weather_response_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  List<WeatherResponseModel> weatherList = [];

  Future<void> loadCityWeather({required String city}) async {
    final WeatherResponseModel weather = await ApiService.getWeather(city);

    final String? imageUrl = await ApiService.getCityImage(city);

    await LocalStorageHelper.saveLastCity(city);

    if (imageUrl != null) {
      await LocalStorageHelper.saveCityImage(city: city, imageUrl: imageUrl);
    }

    weatherList.removeWhere(
      (e) => e.location.name.toLowerCase() == city.toLowerCase(),
    );
    weatherList.insert(0, weather);
  }

  Future<WeatherResponseModel> fetchCityWeatherOnly({
    required String city,
  }) async {
    return await ApiService.getWeather(city);
  }

  Future<void> addCity({
    required String city,
    required WeatherResponseModel weather,
    String? imageUrl,
  }) async {
    await LocalStorageHelper.saveLastCity(city);

    // Always save the city (with or without image)
    if (imageUrl != null) {
      await LocalStorageHelper.saveCityImage(city: city, imageUrl: imageUrl);
    } else {
      // Save city even without image by using a placeholder
      await LocalStorageHelper.saveCityImage(city: city, imageUrl: '');
    }

    weatherList.removeWhere(
      (e) => e.location.name.toLowerCase() == city.toLowerCase(),
    );

    weatherList.insert(0, weather);

    // Emit new state with the newly added city as the current weather model
    emit(WeatherLoaded(weatherList, weather));
  }

  Future<void> loadWeather({String city = ""}) async {
    emit(WeatherLoading());
    try {
      if (city == "") {
        final savedCities = LocalStorageHelper.getSavedCities();

        if (savedCities.isEmpty) {
          city = "cairo";
          await loadCityWeather(city: city);
        } else {
          // Load all saved cities
          for (final savedCity in savedCities) {
            final existing = weatherList.where(
              (e) => e.location.name == savedCity,
            );
            if (existing.isEmpty) {
              await loadCityWeather(city: savedCity);
            }
          }

          // Get the last saved city
          city = LocalStorageHelper.getLastCity() ?? savedCities.first;

          // Move last saved city to first position
          final lastCityModel = weatherList.firstWhere(
            (e) => e.location.name == city,
            orElse: () => weatherList.first,
          );
          weatherList.removeWhere((e) => e.location.name == city);
          weatherList.insert(0, lastCityModel);
        }
      } else {
        final existing = weatherList.where((e) => e.location.name == city);
        if (existing.isEmpty) {
          await loadCityWeather(city: city);
        } else {
          // Move clicked city to first position
          final cityModel = existing.first;
          weatherList.removeWhere((e) => e.location.name == city);
          weatherList.insert(0, cityModel);
        }
      }

      await LocalStorageHelper.saveLastCity(city);
      final model = weatherList.firstWhere((e) => e.location.name == city);
      emit(WeatherLoaded(weatherList, model));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
