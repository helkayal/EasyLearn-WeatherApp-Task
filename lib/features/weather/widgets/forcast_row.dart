import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/models/forecast_day_model.dart';

class ForecastRow extends StatelessWidget {
  final ForecastDayModel model;

  const ForecastRow({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final dayName = DateFormat('EEE').format(model.date);

    return Row(
      children: [
        Image.network(model.day.condition.icon, width: 40, height: 40),
        const Gap(8),
        Expanded(
          child: Text(
            '$dayName. ${model.day.condition.text}',
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '${model.day.maxTempC}° / ${model.day.minTempC}°',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
