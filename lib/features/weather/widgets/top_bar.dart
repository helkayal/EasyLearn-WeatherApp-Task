import 'package:flutter/material.dart';
import 'package:weather_app/features/search/screen/search_screen.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => SearchScreen()),
              );
            },
            icon: const Icon(Icons.search, size: 26),
            color: Colors.black,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 26),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
