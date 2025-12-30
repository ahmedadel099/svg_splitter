# SVG Splitter

A Dart command-line tool to automatically split SVG files into static and dynamic parts for Flutter theming. Perfect for creating themed icons that change colors based on app themes.

[![pub package](https://img.shields.io/pub/v/svg_splitter.svg)](https://pub.dev/packages/svg_splitter)

## 🎥 Video Preview

<!-- TODO: Add your video preview here -->

<!-- Recommended: YouTube embed -->
<!-- 
<div align="center">
  <a href="https://www.youtube.com/watch?v=YOUR_VIDEO_ID">
    <img src="https://img.youtube.com/vi/YOUR_VIDEO_ID/maxresdefault.jpg" alt="SVG Splitter Demo" width="600">
  </a>
  <p><a href="https://www.youtube.com/watch?v=YOUR_VIDEO_ID">▶️ Watch Demo Video</a></p>
</div>
-->

<!-- Alternative: GitHub video (drag .mp4 to GitHub issue/PR to get URL) -->
<!-- 
<div align="center">
  <video src="YOUR_GITHUB_VIDEO_URL" controls width="600"></video>
  <p>Demo: SVG Splitter in action</p>
</div>
-->

<!-- Alternative: GIF animation -->
<div align="center">
  <img src="https://raw.githubusercontent.com/ahmedadel099/svg_splitter/main/demo.gif" alt="SVG Splitter Demo" width="200" height="600">
</div>


## Features

- 🎨 **Automatic splitting** - Detects dynamic colors and splits SVG files automatically
- 🔧 **Customizable** - Specify custom dynamic colors via command-line flags
- 🚀 **Easy to use** - Simple command-line interface
- 📦 **No dependencies** - Pure Dart, no external dependencies
- ✅ **Flutter ready** - Perfect for use with `ThemedSvgIcon` or similar widgets

## Installation

### As a dev dependency (Recommended)

Add to your `pubspec.yaml`:

```yaml
dev_dependencies:
  svg_splitter: ^1.0.2
```

Then run:
```bash
dart pub get
```

### Global installation

```bash
dart pub global activate svg_splitter
```

Make sure `$HOME/.pub-cache/bin` is in your PATH.

For detailed installation instructions, see [INSTALL.md](INSTALL.md).

## Usage

### Basic Usage

Split an SVG file with default dynamic colors (`#DB1C42`, `#FF0000`):

```bash
# If installed as dev dependency
dart pub run svg_splitter assets/icons/my_icon.svg

# Or if globally installed
svg_splitter assets/icons/my_icon.svg

# Or use direct path
dart run packages/svg_splitter/bin/svg_splitter.dart assets/icons/my_icon.svg
```

### With Custom Dynamic Colors

```bash
# Single custom color
dart pub run svg_splitter assets/icons/icon.svg --dynamic-color=#FF0000

# Multiple custom colors
dart pub run svg_splitter assets/icons/icon.svg \
  --dynamic-color=#FF0000 \
  --dynamic-color=#DB1C42
```

### Custom Output Directory

```bash
dart pub run svg_splitter assets/icons/icon.svg --output-dir=assets/icons/split
```

### Help

```bash
dart pub run svg_splitter --help
```

## How It Works

1. **Reads your SVG file** and parses all `<path>` elements
2. **Identifies dynamic parts** by their fill color (default: `#DB1C42`, `#FF0000`)
3. **Creates static SVG** with only non-dynamic paths (grey parts, etc.)
4. **Creates dynamic SVG** with only dynamic paths, replacing their color with `#000000` (black) so `ColorFilter` can tint them in Flutter

## Example

**Input:** `my_icon.svg`
```xml
<svg>
  <path fill="#B4B4B4" d="..."/> <!-- Static grey -->
  <path fill="#DB1C42" d="..."/> <!-- Dynamic red -->
</svg>
```

**Output:** `my_icon_static.svg`
```xml
<svg>
  <path fill="#B4B4B4" d="..."/> <!-- Only static parts -->
</svg>
```

**Output:** `my_icon_dynamic.svg`
```xml
<svg>
  <path fill="#000000" d="..."/> <!-- Dynamic parts in black -->
</svg>
```

## Complete Workflow

### 1. Design in Figma
- Design your icon
- Use **static colors** (grey `#B4B4B4`, black, etc.) for parts that should never change
- Use **dynamic colors** (`#FF0000`, `#DB1C42`, etc.) for parts that should change with theme

### 2. Export from Figma
- Export as SVG
- Save to your project: `assets/icons/my_icon.svg`

### 3. Split the SVG
```bash
dart pub run svg_splitter assets/icons/my_icon.svg
```

### 4. Use in Flutter

Use with a widget that supports selective coloring (like `ThemedSvgIcon`):

```dart
ThemedSvgIcon(
  assetPath: 'assets/icons/my_icon.svg',
  width: 45,
  height: 56,
)
```

The widget will automatically:
- Load `my_icon_static.svg` (unchanged grey parts)
- Load `my_icon_dynamic.svg` (tinted with theme color)

For detailed Flutter setup, see [SETUP.md](SETUP.md).

## Command Reference

```bash
dart pub run svg_splitter <input.svg> [options]

Options:
  --dynamic-color=<color>    Colors to treat as dynamic (can be used multiple times)
                            Default: #DB1C42, #FF0000
  --output-dir=<dir>        Output directory (default: same as input file)
  --help, -h                Show this help message
```

## Tips

- **Default dynamic colors**: `#DB1C42` (red), `#FF0000` (pure red) - detected automatically
- **Static colors**: Everything else (grey `#B4B4B4`, black, etc.)
- **One-time setup**: Split once, use forever!
- **File naming**: Generated files follow pattern `{name}_static.svg` and `{name}_dynamic.svg`

## Documentation

- [Installation Guide](INSTALL.md) - Detailed installation instructions
- [Setup Guide](SETUP.md) - Integration with Flutter projects
- [Publishing Guide](PUBLISH.md) - How to publish updates
- [Adding Video Preview](ADD_VIDEO_PREVIEW.md) - How to add video demos

## Example App

A complete example Flutter app is included in the `example/` directory that demonstrates:

- ✅ Interactive SVG icon with theme color changes
- ✅ Color picker buttons to change theme colors
- ✅ Visual demonstration of static vs dynamic parts
- ✅ Complete working implementation

**Run the example:**
```bash
cd example
flutter pub get
flutter run
```

See `example/README.md` for detailed instructions.

## Troubleshooting

**Tool not found?**
```bash
dart pub get
dart pub run svg_splitter --help
```

**Wrong colors detected?**
Specify your exact dynamic colors:
```bash
dart pub run svg_splitter icon.svg --dynamic-color=#YOUR_EXACT_COLOR
```

**Paths not split correctly?**
- Ensure SVG uses `fill="#COLOR"` format (not CSS classes)
- Check that colors are in hex format
- Verify SVG structure is valid

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - see [LICENSE](LICENSE) file for details

## Related Packages

- Use the generated files with themed SVG widgets for Flutter
- Perfect for multi-tenant app theming
- Works great with `flutter_svg` package
