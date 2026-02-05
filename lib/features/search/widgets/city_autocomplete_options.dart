import 'package:flutter/material.dart';
import 'package:weather_app/features/models/city_search_model.dart';

class CityAutocompleteOptions extends StatelessWidget {
  final Iterable<CitySearchModel> options;
  final AutocompleteOnSelected<CitySearchModel> onSelected;

  const CityAutocompleteOptions({
    super.key,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(20),
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options.elementAt(index);
              return InkWell(
                onTap: () => onSelected(option),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${option.city} - ${option.country}',
                    style: textStyle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
