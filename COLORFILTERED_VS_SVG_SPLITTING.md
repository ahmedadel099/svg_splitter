# ColorFiltered vs SVG Splitting

## Quick Answer

**`ColorFiltered` applies to the entire widget uniformly**, but with proper image preparation, it can appear to do selective coloring. However, **SVG splitting is the only way to truly selectively color parts** while keeping other parts unchanged.

## Important Clarification

Based on [this tutorial](https://github.com/vijayinyoutube/colorfilterapp), `ColorFiltered` can appear to change only certain parts IF:
1. The image is prepared with transparent backgrounds
2. Only the parts to be colored are visible (non-transparent)
3. Static parts are removed/transparent in the source image

**But**: This requires preprocessing the image and doesn't allow true selective coloring on a single image with both static and dynamic parts visible.

## The Key Difference

### ColorFiltered Widget
- ⚠️ **Applies color filter to the ENTIRE widget uniformly**
- ⚠️ **Can appear selective IF image is preprocessed** (transparent background, only target parts visible)
- ✅ Works with PNG, JPEG, and any widget
- ❌ **Cannot selectively color parts within a single image** that has both static and dynamic parts visible
- ⚠️ Requires preprocessing: Static parts must be removed/transparent from source image

**Reference**: [ColorFilter App Tutorial](https://github.com/vijayinyoutube/colorfilterapp)

### SVG Splitting Approach
- ✅ **Selective coloring** - Only dynamic parts change
- ✅ **Static parts remain unchanged** (grey, black, etc.)
- ✅ Perfect for icons with mixed static/dynamic parts
- ✅ Requires SVG format and splitting step

## Visual Comparison

### With SVG Splitting:
```
Original Icon:
- Grey frame (static) → Stays grey ✅
- Red heart (dynamic) → Changes with theme ✅

Result: Only the heart changes color, frame stays grey
```

### With ColorFiltered:
```
Option 1: Full Image Tinting (Current Implementation)
- Grey frame → Gets tinted with theme color ❌
- Red heart → Gets tinted with theme color ❌
Result: ENTIRE icon is tinted - both frame and heart change

Option 2: Preprocessed Image (Like the tutorial)
- Image must have transparent background
- Only dynamic parts (heart) are visible
- Static parts (frame) must be removed from source ❌
Result: Only visible parts are colored, but static parts are missing!
```

**The Problem**: You need TWO separate images - one for static parts, one for dynamic parts. This is essentially what SVG splitting does, but SVG splitting keeps both parts in the same icon!

## When to Use Each

### Use SVG Splitting When:
- ✅ Icon has static parts that must stay unchanged
- ✅ Icon has dynamic parts that should change with theme
- ✅ You need selective coloring
- ✅ Example: Heart icon with grey frame + red heart

### Use ColorFiltered When:
- ✅ Simple icons where you want to tint the entire icon
- ✅ Icons without static parts
- ✅ PNG/JPEG format (not SVG)
- ✅ Example: Simple solid color icon

## Code Comparison

### SVG Splitting (Selective):
```dart
ThemedSvgIcon(
  assetPath: 'assets/icons/icon.svg',
  width: 100,
  height: 100,
  dynamicColor: themeColor,
)
// Result: Only dynamic parts change
```

### ColorFiltered (Full Tint - srcIn):
```dart
ColorFiltered(
  colorFilter: ColorFilter.mode(themeColor, BlendMode.srcIn),
  child: Image.asset('assets/icons/icon.png'),
)
// Result: Entire image is tinted with single color - loses original colors
```

### ColorFiltered (Hue Shift - Tutorial Method):
```dart
ColorFiltered(
  colorFilter: ColorFilter.mode(themeColor, BlendMode.hue),
  child: Image.asset('assets/icons/icon.png'),
)
// Result: Shifts ALL colors' hue uniformly - preserves saturation/brightness
// Still affects entire image - cannot selectively color parts
```

**Key Point**: Both `BlendMode.srcIn` and `BlendMode.hue` apply to the ENTIRE image. Neither can selectively color only specific parts while leaving others unchanged.

## Example App

The example app now includes a comparison section showing:
- SVG splitting with selective coloring
- ColorFiltered PNG with full tinting

Run the app to see the difference!

## Conclusion

### For Multi-Tenant Apps with Mixed Static/Dynamic Parts:

**SVG Splitting** is the best solution because:
- ✅ Both static and dynamic parts visible in same icon
- ✅ True selective coloring
- ✅ No image preprocessing needed
- ✅ Works with complex icons

**ColorFiltered** limitations:
- ❌ Requires TWO separate images (static + dynamic parts separated)
- ❌ Static parts must be removed from source image
- ❌ Cannot have both static and dynamic parts visible in one icon
- ✅ Good for simple icons where entire icon should change

### What the Tutorial Shows

The [ColorFilter tutorial](https://github.com/vijayinyoutube/colorfilterapp) uses:
- `BlendMode.hue` instead of `BlendMode.srcIn`
- This shifts the hue of ALL colors in the image uniformly
- It preserves saturation and brightness, so images look more natural
- **But it still affects the ENTIRE image** - cannot selectively color parts

**Example from Tutorial Code:**
```dart
ColorFiltered(
  colorFilter: ColorFilter.mode(primaryColor, BlendMode.hue),
  child: Image.asset("assets/Images/product.png"),
)
```

**What BlendMode.hue does:**
- ✅ Preserves original saturation and brightness
- ✅ Shifts all colors' hue uniformly
- ❌ Still affects entire image - cannot selectively color parts
- ❌ Cannot keep static parts (grey) unchanged while coloring dynamic parts

**Bottom Line**: For icons with both static (grey) and dynamic (colored) parts in the same icon, **SVG splitting is the only solution that keeps both parts visible** and allows true selective coloring.

