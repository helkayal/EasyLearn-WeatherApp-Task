// import 'package:flutter/material.dart';
// import 'package:weather_app/features/search/screen/search_screen.dart';

// class OnboardingButton extends StatelessWidget {
//   const OnboardingButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const SearchScreen()),
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           gradient: LinearGradient(
//             colors: [
//               Theme.of(context).colorScheme.tertiary,
//               Theme.of(context).colorScheme.onTertiary,
//             ],
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Theme.of(
//                 context,
//               ).colorScheme.primary.withValues(alpha: 0.4),
//               blurRadius: 5,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Text(
//           "let's start",
//           style: Theme.of(context).textTheme.displayMedium,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/local_storage_helper.dart';
import 'package:weather_app/features/search/screen/search_screen.dart';
import 'package:weather_app/features/weather/screens/weather_details.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final lastCity = LocalStorageHelper.getLastCity();

        if (lastCity != null && lastCity.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => WeatherDetails(city: lastCity)),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const SearchScreen()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.tertiary,
              Theme.of(context).colorScheme.onTertiary,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          "let's start",
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
