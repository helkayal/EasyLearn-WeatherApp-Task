import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/core/helpers/local_storage_helper.dart';
import 'package:weather_app/core/widgets/app_container.dart';
import 'package:weather_app/features/models/weather_response_model.dart';
import 'package:weather_app/features/search/widgets/bottom_widget.dart';
import 'package:weather_app/features/search/widgets/city_list.dart';
import 'package:weather_app/features/search/widgets/search_box.dart';
import 'package:weather_app/features/utils/api_utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _restoreCities();
  }

  Future<void> _restoreCities() async {
    final cities = LocalStorageHelper.getSavedCities();

    for (final city in cities) {
      final exists = weatherList.any(
        (e) => e.location.name.toLowerCase() == city.toLowerCase(),
      );

      if (!exists) {
        await ApiUtils.loadCityWeather(city: city);
      }
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: AppContainer(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(MediaQuery.of(context).padding.top),

                SearchBox(),

                Gap(20),

                CityList(),
              ],
            ),

            BottomWidget(),
          ],
        ),
      ),
    );
  }
}
