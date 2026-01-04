# Research: ColorFiltered Selective Coloring

## Repository Found
https://github.com/vijayinyoutube/colorfilterapp

## Key Question
Can ColorFiltered do selective coloring (not tint entire image)?

## Possible Techniques in the Tutorial:

### 1. Using Blend Modes
Different BlendMode values can create different effects:
- `BlendMode.srcIn` - Replaces pixels with color
- `BlendMode.modulate` - Multiplies colors
- `BlendMode.colorBurn` - Darkens image
- `BlendMode.hue` - Changes hue only

### 2. Image Preparation
The tutorial might be using:
- Pre-processed images with transparency
- Masks to define which parts change
- Multiple layers

### 3. Multiple ColorFiltered Widgets
Stacking multiple ColorFiltered widgets with masks

## Need to Investigate
- Check the actual implementation in the repository
- See what BlendMode they're using
- Check if they're using masks or image preparation

## Important Note
ColorFiltered still applies to the entire widget/image it wraps. 
Selective coloring would require:
- Masking techniques
- Multiple layers
- Pre-processed images

Let me check the repository code to see their exact approach.





