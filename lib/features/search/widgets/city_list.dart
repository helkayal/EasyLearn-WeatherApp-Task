import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/features/models/weather_details_model.dart';
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
          city: weatherDetailsMockList[index].city,
          temp: '${weatherDetailsMockList[index].temperature}°',
          aqi: 'AQI ${weatherDetailsMockList[index].aqi}',
          range:
              '${weatherDetailsMockList[index].maxTemp}° / ${weatherDetailsMockList[index].minTemp}°',
        ),
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: weatherDetailsMockList.length,
      ),
    );
  }
}
