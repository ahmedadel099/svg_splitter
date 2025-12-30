// Example showing how to use SVG Splitter programmatically
// Note: This is a CLI tool, but this example shows the pattern

void main() {
  print('SVG Splitter Example Usage');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('');
  print('To use SVG Splitter, run:');
  print('');
  print('  dart run svg_splitter <input.svg>');
  print('');
  print('Examples:');
  print('');
  print('  # Basic usage');
  print('  dart run svg_splitter assets/icons/icon.svg');
  print('');
  print('  # With custom color');
  print('  dart run svg_splitter assets/icons/icon.svg --dynamic-color=#FF0000');
  print('');
  print('  # Multiple colors');
  print('  dart run svg_splitter assets/icons/icon.svg \\');
  print('    --dynamic-color=#FF0000 \\');
  print('    --dynamic-color=#DB1C42');
  print('');
  print('For more information, run:');
  print('  dart run svg_splitter --help');
}

