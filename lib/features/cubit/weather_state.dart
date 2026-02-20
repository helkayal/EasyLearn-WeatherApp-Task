import 'package:weather_app/features/models/weather_response_model.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final List<WeatherResponseModel> weatherList;
  final WeatherResponseModel weatherModel;
  WeatherLoaded(this.weatherList, this.weatherModel);
}

final class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

//////////////////////////////////////////////////////

final class SearchInitial extends WeatherState {}

final class SearchLoading extends WeatherState {}

final class SearchLoaded extends WeatherState {
  final List<String> cities;
  SearchLoaded(this.cities);
}

final class SearchError extends WeatherState {
  final String message;

  SearchError(this.message);
}
