import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/core/helpers/local_storage_helper.dart';
import 'package:weather_app/features/models/weather_response_model.dart';
import 'package:weather_app/features/weather/widgets/aqi_chip.dart';
import 'package:weather_app/features/weather/widgets/forcast_card.dart';
import 'package:weather_app/features/weather/widgets/top_bar.dart';

class WeatherView extends StatelessWidget {
  final WeatherResponseModel model;

  const WeatherView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // debugPrint(LocalStorageHelper.getAll().toString());
    final cityImage = LocalStorageHelper.getCityImage(model.location.name);

    return Stack(
      children: [
        /// Background image
        Positioned.fill(
          child: Image(
            image: cityImage != null
                ? NetworkImage(cityImage)
                : const AssetImage('assets/images/city_bg.jpg')
                      as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),

        /// White calming overlay
        Positioned.fill(
          child: Container(
            color: Theme.of(
              context,
            ).colorScheme.onPrimary.withValues(alpha: 0.4),
          ),
        ),

        /// Content
        SafeArea(
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
                '${model.current.condition.text} '
                '${model.forecast.forecastDays.first.day.maxTempC}°C - '
                '${model.forecast.forecastDays.first.day.minTempC}°C',
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const Gap(8),

              AqiChip(aqi: '${model.current.airQuality.o3}'),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ForecastCard(forecast: model.forecast),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
