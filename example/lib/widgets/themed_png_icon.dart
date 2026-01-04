import 'package:flutter/material.dart';

/// A widget that displays a PNG icon with ColorFiltered.
/// 
/// This demonstrates different BlendMode options:
/// - BlendMode.srcIn: Replaces all pixels with the color (full tint)
/// - BlendMode.hue: Shifts the hue while preserving saturation/brightness (tutorial approach)
/// 
/// ⚠️ LIMITATION: Both apply to the ENTIRE image uniformly.
/// They cannot selectively color parts like SVG splitting does.
class ThemedPngIcon extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final Color? color;
  final BlendMode blendMode;

  const ThemedPngIcon({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.color,
    this.blendMode = BlendMode.srcIn,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = color ?? Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: width,
      height: height,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(themeColor, blendMode),
        child: Image.asset(
          assetPath,
          width: width,
          height: height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

