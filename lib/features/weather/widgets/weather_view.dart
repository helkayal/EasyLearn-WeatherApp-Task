import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/features/models/weather_details_model.dart';
import 'package:weather_app/features/weather/widgets/aqi_chip.dart';
import 'package:weather_app/features/weather/widgets/forcast_card.dart';
import 'package:weather_app/features/weather/widgets/top_bar.dart';

class WeatherView extends StatelessWidget {
  final WeatherDetailsModel model;

  const WeatherView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top - 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(model.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const TopBar(),

          Text(model.city, style: Theme.of(context).textTheme.headlineMedium),

          const Gap(60),

          Text(
            '${model.temperature}°',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Gap(5),

          Text(
            '${model.condition} ${model.minTemp}°C - ${model.maxTemp}°C',
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          const Gap(8),

          AqiChip(aqi: '${model.aqi}'),

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
