import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/screens/weather_setails.dart';

class CityCard extends StatelessWidget {
  final String city;
  final String temp;
  final String aqi;
  final String range;

  const CityCard({
    super.key,
    required this.city,
    required this.temp,
    required this.aqi,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WeatherDetails(city: city)),
          );
        },
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.onTertiary,
              ],
            ),
          ),
          child: Row(
            children: [
              /// Left
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    city,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '$aqi   $range',
                    style: const TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ],
              ),

              const Spacer(),

              /// Right
              Text(
                temp,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
