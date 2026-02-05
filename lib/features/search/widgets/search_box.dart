import 'package:flutter/material.dart';
import 'package:weather_app/features/models/city_search_model.dart';
import 'package:weather_app/features/utils/api_utils.dart';
import 'package:weather_app/features/weather/screens/weather_details.dart';
import 'package:weather_app/features/search/widgets/search_text_field.dart';
import 'package:weather_app/features/search/widgets/city_autocomplete_options.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
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
          await ApiUtils.loadCityWeather(city: selection.city);
          if (!context.mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => WeatherDetails(city: selection.city),
            ),
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
