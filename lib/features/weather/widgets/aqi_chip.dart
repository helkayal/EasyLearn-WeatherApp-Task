import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class AqiChip extends StatelessWidget {
  final String aqi;
  const AqiChip({super.key, required this.aqi});

  @override
  Widget build(BuildContext context) {
    return LiquidGlassLayer(
      settings: LiquidGlassSettings(
        blur: 10,
        glassColor: Theme.of(
          context,
        ).colorScheme.onPrimary.withValues(alpha: .4),
      ),
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(borderRadius: 30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '🌿 AQI $aqi',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
