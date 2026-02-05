import 'package:flutter/material.dart';
import 'package:weather_app/features/models/weather_response_model.dart';
import 'package:weather_app/features/utils/api_utils.dart';
import 'package:weather_app/features/weather/widgets/weather_view.dart';

class WeatherDetails extends StatefulWidget {
  final String city;
  const WeatherDetails({super.key, required this.city});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  WeatherResponseModel? model;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    try {
      /// 1️⃣ Check cache first
      final existing = weatherList.where((e) => e.location.name == widget.city);

      if (existing.isNotEmpty) {
        model = existing.first;
      } else {
        /// 2️⃣ Load from API
        await ApiUtils.loadCityWeather(city: widget.city);
        model = weatherList.firstWhere((e) => e.location.name == widget.city);
      }
    } catch (e) {
      debugPrint('Weather load error: $e');
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || model == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(body: WeatherView(model: model!));
  }
}
