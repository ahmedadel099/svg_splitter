# SVG Splitter Example App

A complete Flutter example app demonstrating how to use SVG Splitter and create themed SVG icons that change colors dynamically.

## ✨ Features

- 🎨 **Interactive Demo** - See themed SVG icons in action
- 🎯 **Live Color Changes** - Tap buttons to change theme colors instantly
- 📚 **Step-by-Step Guide** - Learn how to use SVG Splitter
- 💡 **Visual Explanation** - Understand static vs dynamic parts
- 🎨 **8 Color Presets** - Red, Green, Blue, Orange, Lime, Purple, Deep Orange, Cyan

## 🚀 Quick Start

### Step 1: Split the Demo Icon (Already Done!)

The demo icon has been split for you. If you want to split it again:

```bash
# From project root
dart pub run svg_splitter packages/svg_splitter/example/assets/icons/demo_icon.svg

# Or from example directory
cd packages/svg_splitter/example
dart run ../../bin/svg_splitter.dart assets/icons/demo_icon.svg
```

### Step 2: Run the App

```bash
cd packages/svg_splitter/example
flutter pub get
flutter run
```

## 📱 What You'll See

### 1. Header Section
- App title and description

### 2. Instructions Card
- Step-by-step guide on using SVG Splitter
- How to use ThemedSvgIcon widget

### 3. Icon Demo Section
- Large themed SVG icon
- Current theme color display
- Visual representation of color changes

### 4. Theme Color Changer
- 8 color buttons to choose from
- Instant theme color updates
- Icon dynamic parts change immediately

### 5. How It Works
- Explanation of the splitting process
- Code examples
- Technical details

## 🎯 Try It Out!

1. **Run the app** using the commands above
2. **Tap different color buttons** (Red, Green, Blue, etc.)
3. **Watch the icon change** - Notice:
   - Grey parts (static) stay unchanged
   - Colored parts (dynamic) change with theme
4. **Explore the code** to see how it works

## 🛠️ Customization

### Use Your Own Icon

1. **Create/Export SVG** from Figma:
   - Static parts: Use grey `#B4B4B4` or any static color
   - Dynamic parts: Use red `#FF0000` for parts that should change

2. **Split the SVG**:
   ```bash
   dart run svg_splitter packages/svg_splitter/example/assets/icons/your_icon.svg
   ```

3. **Update the code** in `lib/app.dart`:
   ```dart
   ThemedSvgIcon(
     assetPath: 'assets/icons/your_icon.svg',
     width: 120,
     height: 120,
     dynamicColor: primaryColor,
   )
   ```

### Add More Colors

Edit `lib/app.dart` and add more `ColorPickerButton` widgets in the `_buildThemeChanger` method.

## 📁 Project Structure

```
example/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── app.dart                     # Main app widget
│   ├── bloc/
│   │   └── theme_bloc.dart         # Theme color management
│   └── widgets/
│       ├── themed_svg_icon.dart    # Themed SVG icon widget
│       └── color_picker_button.dart # Color picker button
├── assets/
│   └── icons/
│       ├── demo_icon.svg           # Original icon
│       ├── demo_icon_static.svg    # Static parts (grey)
│       └── demo_icon_dynamic.svg   # Dynamic parts (will be themed)
└── pubspec.yaml
```

## 🔍 How It Works

1. **SVG Splitter** splits the icon into static and dynamic parts
2. **ThemedSvgIcon widget** loads both files
3. **Static parts** render unchanged (grey circles)
4. **Dynamic parts** get colored with `ColorFilter.mode()` using theme color
5. **ThemeBloc** manages color state
6. **Color buttons** trigger color changes

## 🎨 Screenshots

The app demonstrates:
- ✅ Static parts (grey) that never change
- ✅ Dynamic parts that change with theme color
- ✅ Smooth color transitions
- ✅ Clear visual feedback

## 📚 Learn More

- Main package documentation: `../README.md`
- Installation guide: `../INSTALL.md`
- Setup guide: `../SETUP.md`

## 🐛 Troubleshooting

**Icons not showing?**
- Check that `demo_icon_static.svg` and `demo_icon_dynamic.svg` exist
- Run `flutter pub get` and hot restart

**Colors not changing?**
- Make sure you're tapping the color buttons
- Check that ThemeBloc is working (watch the color indicator)

**Want to use your own icon?**
- Follow the "Use Your Own Icon" section above
- Make sure to split it first using SVG Splitter
