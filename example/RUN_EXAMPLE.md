# How to Run the Example App

## Quick Start

```bash
# From project root
cd packages/svg_splitter/example
flutter pub get
flutter run
```

## Split the Demo Icon

The demo icon has already been split, but if you need to split it again:

### Option 1: From Example Directory

```bash
cd packages/svg_splitter/example
dart run ../../bin/svg_splitter.dart assets/icons/demo_icon.svg
```

### Option 2: From Project Root

```bash
# If package is added to main pubspec.yaml
dart pub run svg_splitter packages/svg_splitter/example/assets/icons/demo_icon.svg

# Or use direct path
dart run packages/svg_splitter/bin/svg_splitter.dart packages/svg_splitter/example/assets/icons/demo_icon.svg
```

### Option 3: Using Package Executable (After Publishing)

Once published to pub.dev, you can:

```bash
dart pub global activate svg_splitter
svg_splitter assets/icons/icon.svg
```

## What the Example Shows

- ✅ Themed SVG icon that changes with theme colors
- ✅ 8 color buttons to change theme instantly
- ✅ Visual demonstration of static vs dynamic parts
- ✅ Complete working implementation





