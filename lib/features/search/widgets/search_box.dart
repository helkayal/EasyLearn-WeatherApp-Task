import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/core/services/api_service.dart';
import 'package:weather_app/features/cubit/weather_cubit.dart';
import 'package:weather_app/features/models/city_search_model.dart';
import 'package:weather_app/features/search/widgets/add_city_dialog.dart';
import 'package:weather_app/features/weather/screens/weather_details.dart';
import 'package:weather_app/features/search/widgets/search_text_field.dart';
import 'package:weather_app/features/search/widgets/city_autocomplete_options.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Autocomplete<CitySearchModel>(
        optionsBuilder: (TextEditingValue value) {
          if (value.text.isEmpty) return const Iterable.empty();

          return citySearchList.where(
            (city) =>
                city.city.toLowerCase().contains(value.text.toLowerCase()),
          );
        },

        displayStringForOption: (option) =>
            '${option.city} - ${option.country}',

        onSelected: (selection) async {
          /// 1️⃣ Fetch weather
          final weather = await cubit.fetchCityWeatherOnly(
            city: selection.city,
          );

          /// 2️⃣ Fetch city image (NO SAVE)
          final imageUrl = await ApiService.getCityImage(selection.city);

          if (!context.mounted) return;

          /// 3️⃣ Show dialog with preview image
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AddCityDialog(
                model: weather,
                imageUrl: imageUrl, // 👈 PASS IT
                onAdd: () async {
                  await cubit.addCity(
                    city: selection.city,
                    weather: weather,
                    imageUrl: imageUrl, // 👈 SAVE SAME IMAGE
                  );

                  if (!context.mounted) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WeatherDetails(city: selection.city),
                    ),
                  );
                },
              );
            },
          );
        },
        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
          return SearchTextField(
            controller: controller,
            focusNode: focusNode,
            onSubmitted: onFieldSubmitted,
          );
        },

        optionsViewBuilder:
            (context, onSelected, Iterable<CitySearchModel> options) {
              return CityAutocompleteOptions(
                options: options,
                onSelected: onSelected,
              );
            },
      ),
    );
  }
}
