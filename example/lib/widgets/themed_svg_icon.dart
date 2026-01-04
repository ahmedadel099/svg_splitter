import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that displays an SVG icon with selective coloring.
/// 
/// This widget automatically uses split SVG files:
/// - {name}_static.svg (static parts - unchanged)
/// - {name}_dynamic.svg (dynamic parts - colored with theme)
class ThemedSvgIcon extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final Color? dynamicColor;

  const ThemedSvgIcon({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.dynamicColor,
  });

  String _getBasePath(String path) {
    final lastDot = path.lastIndexOf('.');
    if (lastDot == -1) return path;
    return path.substring(0, lastDot);
  }

  String _getExtension(String path) {
    final lastDot = path.lastIndexOf('.');
    if (lastDot == -1) return '';
    return path.substring(lastDot);
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = dynamicColor ?? Theme.of(context).colorScheme.primary;
    final basePath = _getBasePath(assetPath);
    final extension = _getExtension(assetPath);
    final staticPath = '${basePath}_static$extension';
    final dynamicPath = '${basePath}_dynamic$extension';

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Static parts - no color filter
          SvgPicture.asset(
            staticPath,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
          // Dynamic parts - with color filter
          SvgPicture.asset(
            dynamicPath,
            width: width,
            height: height,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(themeColor, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}





