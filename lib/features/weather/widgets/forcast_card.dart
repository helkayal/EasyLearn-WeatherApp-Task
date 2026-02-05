import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:weather_app/features/models/forecast_model.dart';
import 'package:weather_app/features/weather/widgets/forcast_row.dart';

class ForecastCard extends StatelessWidget {
  final ForecastModel forecast;
  const ForecastCard({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return LiquidGlassLayer(
      settings: LiquidGlassSettings(
        blur: 10,
        glassColor: Theme.of(context).colorScheme.primary.withValues(alpha: .2),
      ),
      child: LiquidGlass(
        shape: LiquidRoundedRectangle(borderRadius: 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '3-day forecast',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const Gap(8),

              SizedBox(
                height: 140,
                width: MediaQuery.of(context).size.width * .8,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return ForecastRow(model: forecast.forecastDays[index]);
                  },
                  separatorBuilder: (context, index) => const Gap(2),
                  itemCount: forecast.forecastDays.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
