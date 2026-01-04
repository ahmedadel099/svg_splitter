import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'widgets/themed_svg_icon.dart';
import 'widgets/color_picker_button.dart';
import 'screens/comparison_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SVG Splitter Demo'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
            // Header
            _buildHeader(context),
            const SizedBox(height: 24),
            
            // Theme Color Changer (Move to top for easier access)
            _buildThemeChanger(context),
            const SizedBox(height: 24),
            
            // Icon Demo
            _buildIconDemo(context),
            const SizedBox(height: 24),
            
            // Comparison Button
            _buildComparisonButton(context),
            const SizedBox(height: 24),
            
            // Instructions
            _buildInstructionsCard(context),
            const SizedBox(height: 24),
            
            // How It Works
            _buildHowItWorks(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
        ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.auto_fix_high,
          size: 64,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 16),
        Text(
          'SVG Splitter Demo',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'See how dynamic SVG parts change with theme colors',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInstructionsCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'How to Use',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildStep(context, '1', 'Split your SVG:', 'Run: dart run svg_splitter assets/icons/demo_icon.svg'),
            const SizedBox(height: 8),
            _buildStep(context, '2', 'Use ThemedSvgIcon:', 'ThemedSvgIcon(assetPath: \'assets/icons/demo_icon.svg\')'),
            const SizedBox(height: 8),
            _buildStep(context, '3', 'Change theme:', 'Tap buttons below to see dynamic parts change!'),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context, String number, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconDemo(BuildContext context) {
    return BlocBuilder<ThemeBloc, Color>(
      builder: (context, primaryColor) {
        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.palette,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Themed SVG Icon',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Static parts (grey) stay unchanged',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Dynamic parts change with theme',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 1.5,
                    ),
                  ),
                  child: ThemedSvgIcon(
                    assetPath: 'assets/icons/demo_icon.svg',
                    width: 120,
                    height: 120,
                    dynamicColor: primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Current Theme: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withValues(alpha: 0.3),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          _colorToHex(primaryColor),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildComparisonButton(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ComparisonScreen(),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.compare_arrows,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SVG vs ColorFiltered',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'View detailed comparison with examples',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeChanger(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.color_lens,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Change Theme Color',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Tap any color to see the icon\'s dynamic parts change:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ColorPickerButton(
                  color: const Color(0xFFE71E46),
                  label: 'Red',
                  onTap: () => context.read<ThemeBloc>().changeColor(const Color(0xFFE71E46)),
                ),
                ColorPickerButton(
                  color: const Color(0xFF239947),
                  label: 'Green',
                  onTap: () => context.read<ThemeBloc>().changeColor(const Color(0xFF239947)),
                ),
                ColorPickerButton(
                  color: const Color(0xFF408AEB),
                  label: 'Blue',
                  onTap: () => context.read<ThemeBloc>().changeColor(const Color(0xFF408AEB)),
                ),
                ColorPickerButton(
                  color: const Color(0xFFED7A44),
                  label: 'Orange',
                  onTap: () => context.read<ThemeBloc>().changeColor(const Color(0xFFED7A44)),
                ),
                ColorPickerButton(
                  color: const Color(0xFF7DB329),
                  label: 'Lime',
                  onTap: () => context.read<ThemeBloc>().changeColor(const Color(0xFF7DB329)),
                ),
                ColorPickerButton(
                  color: const Color(0xFF9C27B0),
                  label: 'Purple',
                  onTap: () => context.read<ThemeBloc>().changeColor(const Color(0xFF9C27B0)),
                ),
                ColorPickerButton(
                  color: const Color(0xFFFF5722),
                  label: 'Deep Orange',
                  onTap: () => context.read<ThemeBloc>().changeColor(const Color(0xFFFF5722)),
                ),
                ColorPickerButton(
                  color: const Color(0xFF00BCD4),
                  label: 'Cyan',
                  onTap: () => context.read<ThemeBloc>().changeColor(const Color(0xFF00BCD4)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHowItWorks(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.code,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'How It Works',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '1. SVG Splitter splits your icon into two files:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• demo_icon_static.svg - Grey parts (unchanged)',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'monospace',
                        ),
                  ),
                  Text(
                    '• demo_icon_dynamic.svg - Dynamic parts (colored)',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'monospace',
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '2. ThemedSvgIcon widget:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: SelectableText(
                '''ThemedSvgIcon(
  assetPath: 'assets/icons/demo_icon.svg',
  width: 120,
  height: 120,
  dynamicColor: primaryColor,
)''',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                    ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '3. Dynamic parts automatically update when theme changes!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }


  String _colorToHex(Color color) {
    // Convert color to hex string using toARGB32 (non-deprecated method)
    final argb = color.value.toRadixString(16).padLeft(8, '0');
    // Skip alpha channel (first 2 chars), keep RGB
    return '#${argb.substring(2).toUpperCase()}';
  }
}

