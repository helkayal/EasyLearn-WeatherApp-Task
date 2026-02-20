import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/cubit/weather_cubit.dart';
import 'package:weather_app/features/cubit/weather_state.dart';
import 'package:weather_app/features/weather/widgets/weather_view.dart';

class WeatherDetails extends StatelessWidget {
  final String city;
  const WeatherDetails({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherCubit>().loadWeather(city: city);
    });

    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          } else if (state is WeatherLoaded) {
            return WeatherView(model: state.weatherModel);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
