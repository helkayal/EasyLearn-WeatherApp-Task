import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/core/widgets/app_container.dart';
import 'package:weather_app/features/search/widgets/bottom_widget.dart';
import 'package:weather_app/features/search/widgets/city_list.dart';
import 'package:weather_app/features/search/widgets/search_box.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
