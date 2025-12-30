# Adding Video Preview to Package

## Quick Guide

### Option 1: YouTube (Recommended) ⭐

1. **Upload your video to YouTube**
   - Record a demo showing:
     - Running `svg_splitter` command
     - The example app with color changes
     - Icon splitting process

2. **Get the video URL and ID**
   - Example: `https://www.youtube.com/watch?v=ABC123xyz`
   - Video ID: `ABC123xyz`

3. **Update README.md** - Replace the placeholder:

```markdown
<div align="center">
  <a href="https://www.youtube.com/watch?v=YOUR_VIDEO_ID">
    <img src="https://img.youtube.com/vi/YOUR_VIDEO_ID/maxresdefault.jpg" alt="SVG Splitter Demo" width="600">
  </a>
  <p><a href="https://www.youtube.com/watch?v=YOUR_VIDEO_ID">Watch on YouTube</a></p>
</div>
```

### Option 2: GitHub Video (Easy)

1. **Create a GitHub issue or PR** in your repository
2. **Drag and drop your .mp4/.mov/.webm video** into the issue
3. **Copy the generated URL** (looks like: `https://user-images.githubusercontent.com/...`)
4. **Update README.md**:

```markdown
<div align="center">
  <video src="YOUR_GITHUB_VIDEO_URL" controls width="600"></video>
  <p>Demo: SVG Splitter in action</p>
</div>
```

### Option 3: GIF Animation

1. **Create a GIF** from your video:
   - Use tools like: [ScreenToGif](https://www.screentogif.com/), [LICEcap](https://www.cockos.com/licecap/), or [Kap](https://getkap.co/)
   
2. **Add to repository**:
   - Save as `demo.gif` in package root
   
3. **Update README.md**:

```markdown
<div align="center">
  <img src="demo.gif" alt="SVG Splitter Demo" width="600">
</div>
```

4. **Add to pubspec.yaml** (if needed):
```yaml
flutter:
  assets:
    - demo.gif
```

### Option 4: Direct Video Hosting

Host your video on:
- Vimeo
- Cloudinary
- Your own server

Then embed in README.md:

```markdown
<div align="center">
  <video src="YOUR_VIDEO_URL" controls width="600"></video>
  <p>Demo: SVG Splitter in action</p>
</div>
```

## What to Show in the Video

1. **Command-line usage** (5-10 seconds):
   - Running `dart pub run svg_splitter assets/icons/icon.svg`
   - Showing output files created

2. **Example app demo** (30-60 seconds):
   - Opening the app
   - Tapping different color buttons
   - Showing icon color changes
   - Highlighting static vs dynamic parts

3. **Quick workflow** (10-15 seconds):
   - Figma export → Split → Use in Flutter

## Recommended Video Format

- **Length**: 30-90 seconds
- **Resolution**: 1080p or higher
- **Format**: MP4 (H.264)
- **Aspect Ratio**: 16:9 (for YouTube) or match your screen

## Example README Section

```markdown
## 🎥 Video Preview

<div align="center">
  <a href="https://www.youtube.com/watch?v=YOUR_VIDEO_ID">
    <img src="https://img.youtube.com/vi/YOUR_VIDEO_ID/maxresdefault.jpg" alt="SVG Splitter Demo" width="600">
  </a>
  <p><a href="https://www.youtube.com/watch?v=YOUR_VIDEO_ID">▶️ Watch Demo Video</a></p>
</div>
```

## After Adding Video

1. ✅ Update README.md with your video link
2. ✅ Commit and push to GitHub
3. ✅ Video will appear on pub.dev automatically (pub.dev shows GitHub README)

## Tips

- Keep it short and focused
- Show real usage, not just features
- Add captions/text overlays for clarity
- Make sure it works on mobile (small screens)

