import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/core/helpers/local_storage_helper.dart';
import 'package:weather_app/features/models/weather_response_model.dart';
import 'package:weather_app/features/search/widgets/city_card.dart';

class CityList extends StatelessWidget {
  const CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          final cityModel = weatherList[index];

          return Dismissible(
            key: ValueKey(cityModel.location.name),

            direction: DismissDirection.endToStart,

            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.delete, color: Colors.white, size: 28),
            ),

            confirmDismiss: (_) async {
              return await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete city?'),
                  content: Text('Remove ${cityModel.location.name} from list?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },

            onDismissed: (_) async {
              final cityName = cityModel.location.name;

              /// Remove from memory
              weatherList.removeAt(index);

              /// Remove from storage
              await LocalStorageHelper.deleteCity(cityName);

              /// Refresh UI
              (context as Element).markNeedsBuild();
            },

            child: CityCard(
              city: weatherList[index].location.name,
              temp: '${weatherList[index].current.tempC}°',
              aqi: 'AQI ${weatherList[index].current.airQuality.usEpaIndex}',
              range:
                  '${weatherList[index].forecast.forecastDays.first.day.maxTempC}° / ${weatherList[index].forecast.forecastDays.first.day.minTempC}°',
            ),
          );
        },
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: weatherList.length,
      ),
    );
  }
}
