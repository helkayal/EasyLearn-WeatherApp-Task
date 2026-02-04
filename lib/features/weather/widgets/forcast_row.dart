import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/features/models/forecast_day_model.dart';

class ForecastRow extends StatelessWidget {
  final ForecastDayModel model;

  const ForecastRow({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          model.day.condition.icon,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(8),
        Text(
          '${model.day} ${model.day.condition.text}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        Text(
          '${model.day.maxTempC}° / ${model.day.maxTempC}°',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
