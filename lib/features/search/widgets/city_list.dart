import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/core/helpers/local_storage_helper.dart';
import 'package:weather_app/features/models/weather_response_model.dart';
import 'package:weather_app/features/search/widgets/city_card.dart';

class CityList extends StatefulWidget {
  const CityList({super.key});

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: weatherList.length,
        separatorBuilder: (_, __) => const Gap(10),
        itemBuilder: (context, index) {
          final cityModel = weatherList[index];
          final cityName = cityModel.location.name;

          return Dismissible(
            key: ValueKey(cityName), // ✅ stable key

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
                      content: Text('Remove $cityName from list?'),
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
                  ) ??
                  false;
            },

            onDismissed: (_) async {
              /// ✅ Remove by value (SAFE)
              setState(() {
                weatherList.removeWhere((e) => e.location.name == cityName);
              });

              /// Remove from storage
              await LocalStorageHelper.deleteCity(cityName);
            },

            child: CityCard(
              city: cityName,
              temp: '${cityModel.current.tempC}°',
              aqi: 'AQI ${cityModel.current.airQuality.usEpaIndex}',
              range:
                  '${cityModel.forecast.forecastDays.first.day.maxTempC}° / '
                  '${cityModel.forecast.forecastDays.first.day.minTempC}°',
            ),
          );
        },
      ),
    );
  }
}
