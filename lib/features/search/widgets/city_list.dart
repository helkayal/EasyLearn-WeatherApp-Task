import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        itemBuilder: (context, index) => CityCard(
          city: weatherList[index].location.name,
          temp: '${weatherList[index].current.tempC}°',
          aqi: 'AQI ${weatherList[index].current.airQuality.usEpaIndex}',
          range:
              '${weatherList[index].forecast.forecastDays.first.day.maxTempC}° / ${weatherList[index].forecast.forecastDays.first.day.minTempC}°',
        ),
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: weatherList.length,
      ),
    );
  }
}
