import 'package:flutter/material.dart';
import 'package:weather_app/features/models/weather_response_model.dart';
import 'package:weather_app/features/weather/widgets/weather_view.dart';

class AddCityDialog extends StatelessWidget {
  final WeatherResponseModel model;
  final String? imageUrl;
  final VoidCallback onAdd;

  const AddCityDialog({
    super.key,
    required this.model,
    required this.onAdd,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: WeatherView(
              model: model,
              backgroundImage: imageUrl,
              showTopBar: false,
            ),
          ),

          const Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onAdd();
                    },
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
