import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/api_helper.dart';
import 'package:weather_app/core/helpers/local_storage_helper.dart';
import 'package:weather_app/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageHelper.init();
  ApiHelper.init();
  runApp(const WeatherApp());
}
