# Usage Guide

## Running SVG Splitter

### Option 1: As Dev Dependency (Recommended for Projects)

**Add to `pubspec.yaml`:**
```yaml
dev_dependencies:
  svg_splitter:
    path: packages/svg_splitter  # For local development
    # OR after publishing:
    # svg_splitter: ^1.0.0
```

**Use it:**
```bash
dart pub run svg_splitter assets/icons/icon.svg
```

### Option 2: Direct Path

```bash
dart run packages/svg_splitter/bin/svg_splitter.dart assets/icons/icon.svg
```

### Option 3: Global Installation (After Publishing)

```bash
dart pub global activate svg_splitter
svg_splitter assets/icons/icon.svg
```

## Common Commands

### Basic Split
```bash
dart pub run svg_splitter assets/icons/icon.svg
```

### Custom Dynamic Color
```bash
dart pub run svg_splitter assets/icons/icon.svg --dynamic-color=#FF0000
```

### Multiple Colors
```bash
dart pub run svg_splitter assets/icons/icon.svg \
  --dynamic-color=#FF0000 \
  --dynamic-color=#DB1C42
```

### Help
```bash
dart pub run svg_splitter --help
```

## Troubleshooting

**Command not found?**
- Make sure you ran `dart pub get` first
- Use `dart pub run svg_splitter` instead of `dart run svg_splitter`
- Or use the direct path method

**File not found?**
- Check the file path is correct
- Use quotes for paths with spaces: `'assets/anmation icons/icon.svg'`

