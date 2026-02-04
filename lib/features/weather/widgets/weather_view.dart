import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/features/models/weather_response_model.dart';
import 'package:weather_app/features/weather/widgets/aqi_chip.dart';
import 'package:weather_app/features/weather/widgets/forcast_card.dart';
import 'package:weather_app/features/weather/widgets/top_bar.dart';

class WeatherView extends StatelessWidget {
  final WeatherResponseModel model;

  const WeatherView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top - 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/city_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const TopBar(),

          Text(
            model.location.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          const Gap(60),

          Text(
            '${model.current.tempC}°',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Gap(5),

          Text(
            '${model.current.condition.text} ${model.forecast.forecastDays.first.day.maxTempC}°C - ${model.forecast.forecastDays.first.day.minTempC}°C',
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          const Gap(8),

          AqiChip(aqi: '${model.current.airQuality.usEpaIndex}'),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ForecastCard(forecast: model.forecast),
          ),
        ],
      ),
    );
  }
}
