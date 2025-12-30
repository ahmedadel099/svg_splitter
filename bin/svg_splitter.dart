#!/usr/bin/env dart

/// SVG Splitter Tool
/// 
/// Automatically splits SVG files into static and dynamic parts for theming.
/// 
/// Usage:
///   dart run svg_splitter <input.svg> [--dynamic-color=#DB1C42] [--output-dir=assets]
/// 
/// Example:
///   dart run svg_splitter assets/icons/Group4.svg --dynamic-color=#DB1C42
/// 
/// This will create:
///   - assets/icons/Group4_static.svg (static parts, unchanged colors)
///   - assets/icons/Group4_dynamic.svg (dynamic parts, set to #000000 for theming)

import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.contains('--help') || arguments.contains('-h')) {
    _printHelp();
    exit(0);
  }

  final inputPath = arguments.first;
  final dynamicColors = _parseDynamicColors(arguments);
  final outputDir = _parseOutputDir(arguments);

  print('🎨 SVG Splitter');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

  try {
    _splitSvg(inputPath, dynamicColors, outputDir);
    print('\n✅ Successfully split SVG file!');
  } catch (e) {
    print('\n❌ Error: $e');
    exit(1);
  }
}

void _printHelp() {
  print('''
SVG Splitter - Automatically split SVG files for Flutter theming

Usage:
  dart run svg_splitter <input.svg> [options]

Options:
  --dynamic-color=<color>    Colors to treat as dynamic (can be used multiple times)
                            Default: #DB1C42, #FF0000
  --output-dir=<dir>        Output directory (default: same as input file)
  --help, -h                Show this help message

Examples:
  # Split with default dynamic colors
  dart run svg_splitter assets/icons/icon.svg

  # Split with custom dynamic color
  dart run svg_splitter assets/icons/icon.svg --dynamic-color=#FF0000

  # Split with multiple dynamic colors
  dart run svg_splitter assets/icons/icon.svg \\
    --dynamic-color=#DB1C42 --dynamic-color=#FF0000

  # Specify output directory
  dart run svg_splitter assets/icons/icon.svg --output-dir=assets/icons
''');
}

List<String> _parseDynamicColors(List<String> arguments) {
  final colors = <String>[];
  
  for (final arg in arguments) {
    if (arg.startsWith('--dynamic-color=')) {
      colors.add(arg.substring('--dynamic-color='.length));
    }
  }
  
  // Default dynamic colors if none specified
  if (colors.isEmpty) {
    return ['#DB1C42', '#FF0000']; // Common theme red colors
  }
  
  return colors;
}

String? _parseOutputDir(List<String> arguments) {
  for (final arg in arguments) {
    if (arg.startsWith('--output-dir=')) {
      return arg.substring('--output-dir='.length);
    }
  }
  return null;
}

void _splitSvg(String inputPath, List<String> dynamicColors, String? outputDir) {
  // Validate input file
  final inputFile = File(inputPath);
  if (!inputFile.existsSync()) {
    throw Exception('Input file not found: $inputPath');
  }

  print('📁 Input file: $inputPath');
  print('🎨 Dynamic colors: ${dynamicColors.join(', ')}');
  
  // Read SVG content
  final svgContent = inputFile.readAsStringSync();
  print('📖 Read SVG file (${svgContent.length} bytes)');

  // Parse file path
  final inputPathParts = inputPath.split('/');
  final fileName = inputPathParts.last;
  final baseName = fileName.substring(0, fileName.lastIndexOf('.'));
  final extension = fileName.substring(fileName.lastIndexOf('.'));
  final basePath = inputPath.substring(0, inputPath.lastIndexOf('/'));
  
  final outputBasePath = outputDir ?? basePath;
  final staticPath = '$outputBasePath/${baseName}_static$extension';
  final dynamicPath = '$outputBasePath/${baseName}_dynamic$extension';

  print('📝 Output files:');
  print('   Static:  $staticPath');
  print('   Dynamic: $dynamicPath');

  // Normalize color formats for matching
  final normalizedDynamicColors = dynamicColors.map((c) => _normalizeColor(c)).toSet();
  
  // Split SVG
  final (staticSvg, dynamicSvg) = _parseAndSplitSvg(svgContent, normalizedDynamicColors);

  // Write output files
  File(staticPath).writeAsStringSync(staticSvg);
  File(dynamicPath).writeAsStringSync(dynamicSvg);

  print('\n✨ Generated files:');
  print('   ✅ ${File(staticPath).lengthSync()} bytes → $staticPath');
  print('   ✅ ${File(dynamicPath).lengthSync()} bytes → $dynamicPath');
}

(String staticSvg, String dynamicSvg) _parseAndSplitSvg(String svgContent, Set<String> dynamicColors) {
  // Extract SVG header
  final headerMatch = RegExp(r'<svg[^>]*>').firstMatch(svgContent);
  if (headerMatch == null) {
    throw Exception('Invalid SVG: No <svg> tag found');
  }
  final svgHeader = headerMatch.group(0)!;
  final svgFooter = '</svg>';

  // Find all path elements - more flexible regex that handles any attribute order
  // Pattern matches: <path ... fill="color" ... /> or <path ... fill="color" ... >
  final pathPattern = RegExp(
    r'<path\s+[^>]*?(?:fill="([^"]*)"[^>]*?d="([^"]*)"|d="([^"]*)"[^>]*?fill="([^"]*)")[^>]*?/?>',
    multiLine: true,
    dotAll: true,
  );
  
  final staticPaths = <String>[];
  final dynamicPaths = <String>[];

  // Find all path matches
  final allMatches = pathPattern.allMatches(svgContent);
  
  for (final match in allMatches) {
    final fullPath = match.group(0)!;
    // Try to extract fill color (could be in group 1 or 4 depending on order)
    final fillColor = match.group(1) ?? match.group(4);
    
    if (fillColor != null && fillColor.isNotEmpty) {
      final normalizedFill = _normalizeColor(fillColor);
      
      if (dynamicColors.contains(normalizedFill)) {
        // This is a dynamic path - replace color with black (#000000)
        final dynamicPath = fullPath.replaceAll(
          RegExp(r'fill="[^"]*"'),
          'fill="#000000"',
        );
        dynamicPaths.add(dynamicPath);
      } else {
        // This is a static path - keep original
        staticPaths.add(fullPath);
      }
    } else {
      // Path without fill attribute - treat as static
      staticPaths.add(fullPath);
    }
  }

  // Also catch paths that might be on single lines but regex missed
  // Use a simpler pattern as fallback
  if (allMatches.isEmpty) {
    final simplePathPattern = RegExp(r'<path[^>]*/?>', multiLine: true, dotAll: true);
    final simpleMatches = simplePathPattern.allMatches(svgContent);
    
    for (final match in simpleMatches) {
      final fullPath = match.group(0)!;
      final fillMatch = RegExp(r'fill="([^"]*)"').firstMatch(fullPath);
      
      if (fillMatch != null) {
        final fillColor = fillMatch.group(1)!;
        final normalizedFill = _normalizeColor(fillColor);
        
        if (dynamicColors.contains(normalizedFill)) {
          final dynamicPath = fullPath.replaceAll(
            RegExp(r'fill="[^"]*"'),
            'fill="#000000"',
          );
          dynamicPaths.add(dynamicPath);
        } else {
          staticPaths.add(fullPath);
        }
      } else {
        staticPaths.add(fullPath);
      }
    }
  }

  // Build output SVGs
  final staticSvg = '$svgHeader\n${staticPaths.join('\n')}\n$svgFooter';
  final dynamicSvg = '$svgHeader\n${dynamicPaths.join('\n')}\n$svgFooter';

  print('\n🔍 Analysis:');
  print('   Static paths:  ${staticPaths.length}');
  print('   Dynamic paths: ${dynamicPaths.length}');

  return (staticSvg, dynamicSvg);
}

String _normalizeColor(String color) {
  // Normalize color format:
  // - Remove whitespace
  // - Convert to uppercase
  // - Handle hex with/without #
  final normalized = color.trim().toUpperCase();
  if (normalized.startsWith('#')) {
    return normalized;
  }
  return '#$normalized';
}

