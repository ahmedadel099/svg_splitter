import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme_bloc.dart';
import '../widgets/themed_svg_icon.dart';
import '../widgets/themed_png_icon.dart';

/// Screen showing comparison between SVG Splitting and ColorFiltered approaches
class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SVG vs ColorFiltered'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: BlocBuilder<ThemeBloc, Color>(
            builder: (context, primaryColor) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Row(
                    children: [
                      Icon(
                        Icons.compare_arrows,
                        color: Theme.of(context).colorScheme.primary,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'SVG Splitting vs ColorFiltered',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Compare selective coloring (SVG) vs full image tinting (PNG)',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 24),

                  // SVG Splitting Example
                  _buildComparisonCard(
                    context,
                    primaryColor,
                    title: 'SVG Splitting ✅',
                    description: 'Selective coloring - Static parts (grey) unchanged, dynamic parts change',
                    borderColor: Colors.green,
                    child: ThemedSvgIcon(
                      assetPath: 'assets/icons/demo_icon.svg',
                      width: 120,
                      height: 120,
                      dynamicColor: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ColorFiltered Examples Section
                  Text(
                    'ColorFiltered Examples',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'BlendMode.hue shifts colors while preserving saturation/brightness',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),

                  // BlendMode.hue (Tutorial Method) - Product PNG
                  _buildComparisonCard(
                    context,
                    primaryColor,
                    title: 'BlendMode.hue (Tutorial)',
                    description: 'Shifts hue, preserves saturation/brightness',
                    borderColor: Colors.blue,
                    child: ThemedPngIcon(
                      assetPath: 'assets/icons/product.png',
                      width: 120,
                      height: 120,
                      color: primaryColor,
                      blendMode: BlendMode.hue,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // BlendMode Comparison Row for Group9.png
                  MediaQuery.of(context).size.width < 500
                      ? Column(
                          children: [
                            _buildComparisonCard(
                              context,
                              primaryColor,
                              title: 'BlendMode.srcIn',
                              description: 'Full image tinting',
                              borderColor: Colors.orange,
                              child: ThemedPngIcon(
                                assetPath: 'assets/icons/Group9.png',
                                width: 80,
                                height: 80,
                                color: primaryColor,
                                blendMode: BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildComparisonCard(
                              context,
                              primaryColor,
                              title: 'BlendMode.hue',
                              description: 'Hue shift method',
                              borderColor: Colors.purple,
                              child: ThemedPngIcon(
                                assetPath: 'assets/icons/Group9.png',
                                width: 80,
                                height: 80,
                                color: primaryColor,
                                blendMode: BlendMode.hue,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildComparisonCard(
                                context,
                                primaryColor,
                                title: 'BlendMode.srcIn',
                                description: 'Full image tinting',
                                borderColor: Colors.orange,
                                child: ThemedPngIcon(
                                  assetPath: 'assets/icons/Group9.png',
                                  width: 80,
                                  height: 80,
                                  color: primaryColor,
                                  blendMode: BlendMode.srcIn,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildComparisonCard(
                                context,
                                primaryColor,
                                title: 'BlendMode.hue',
                                description: 'Hue shift method',
                                borderColor: Colors.purple,
                                child: ThemedPngIcon(
                                  assetPath: 'assets/icons/Group9.png',
                                  width: 80,
                                  height: 80,
                                  color: primaryColor,
                                  blendMode: BlendMode.hue,
                                ),
                              ),
                            ),
                          ],
                        ),

                  const SizedBox(height: 24),

                  // Key Differences Info Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.orange.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.info_outline, size: 18, color: Colors.orange),
                            const SizedBox(width: 8),
                            Text(
                              'Key Differences',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildDifferencePoint(
                          context,
                          '✅ SVG Splitting',
                          'Only dynamic parts change, static parts (grey) stay unchanged',
                          Colors.green,
                        ),
                        const SizedBox(height: 8),
                        _buildDifferencePoint(
                          context,
                          '⚡ BlendMode.hue',
                          'Shifts ALL colors\' hue uniformly - cannot selectively color parts',
                          Colors.blue,
                        ),
                        const SizedBox(height: 8),
                        _buildDifferencePoint(
                          context,
                          '🎨 BlendMode.srcIn',
                          'Tints entire image with single color - loses original colors',
                          Colors.orange,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.yellow.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('💡 ', style: TextStyle(fontSize: 16)),
                              Expanded(
                                child: Text(
                                  'Both BlendModes affect the ENTIRE image uniformly. They cannot selectively color only specific parts while leaving others unchanged.',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildComparisonCard(
    BuildContext context,
    Color primaryColor, {
    required String title,
    required String description,
    required Color borderColor,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            child,
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: borderColor,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDifferencePoint(
    BuildContext context,
    String label,
    String description,
    Color color,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: '$label: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                TextSpan(text: description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}





