# Setup Guide for Flutter Projects

This guide shows how to integrate SVG Splitter into your Flutter project workflow.

## Step 1: Add to pubspec.yaml

Add `svg_splitter` as a dev dependency:

```yaml
dev_dependencies:
  svg_splitter: ^1.0.0
```

Run:
```bash
flutter pub get
# or
dart pub get
```

## Step 2: Add Assets to pubspec.yaml

Make sure your assets directory is declared:

```yaml
flutter:
  assets:
    - assets/icons/
    # or wherever you keep your SVG files
```

## Step 3: Use the Tool

Split your SVG files:

```bash
dart run svg_splitter assets/icons/my_icon.svg
```

This creates:
- `assets/icons/my_icon_static.svg`
- `assets/icons/my_icon_dynamic.svg`

## Step 4: Use in Your Flutter App

If you have a `ThemedSvgIcon` widget (or similar), use it like this:

```dart
ThemedSvgIcon(
  assetPath: 'assets/icons/my_icon.svg',
  width: 45,
  height: 56,
)
```

The widget automatically finds the `_static` and `_dynamic` files.

## Workflow Example

1. **Export from Figma** → `assets/icons/home_icon.svg`
2. **Split the SVG:**
   ```bash
   dart run svg_splitter assets/icons/home_icon.svg
   ```
3. **Use in code:**
   ```dart
   ThemedSvgIcon(assetPath: 'assets/icons/home_icon.svg')
   ```

## Batch Processing

To split multiple files, you can create a simple script:

**create `tool/split_icons.sh`**:
```bash
#!/bin/bash
for file in assets/icons/*.svg; do
  if [[ ! "$file" =~ _static\.svg$ ]] && [[ ! "$file" =~ _dynamic\.svg$ ]]; then
    dart run svg_splitter "$file"
  fi
done
```

Make it executable:
```bash
chmod +x tool/split_icons.sh
```

Run it:
```bash
./tool/split_icons.sh
```

## Integration with CI/CD

You can add SVG splitting to your build process:

```yaml
# .github/workflows/build.yml (example)
- name: Split SVG files
  run: |
    dart pub get
    dart run svg_splitter assets/icons/*.svg
```

## Tips

- ✅ Split files once and commit them to version control
- ✅ Use consistent dynamic colors across your design system
- ✅ Keep original SVG files for reference
- ✅ Document which colors are dynamic in your design system

