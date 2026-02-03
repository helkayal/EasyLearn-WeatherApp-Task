import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/features/models/daily_forecast_model.dart';

class ForecastRow extends StatelessWidget {
  final DailyForecastModel model;

  const ForecastRow({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(model.icon, style: Theme.of(context).textTheme.titleMedium),
        const Gap(8),
        Text(
          '${model.day} ${model.condition}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        Text(
          '${model.maxTemp}° / ${model.minTemp}°',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
