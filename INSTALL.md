# Installation Guide

## Option 1: As a Dev Dependency (Recommended)

Add to your `pubspec.yaml`:

```yaml
dev_dependencies:
  svg_splitter: ^1.0.0
```

Then install:

```bash
dart pub get
```

Use it:

```bash
dart run svg_splitter assets/icons/icon.svg
```

## Option 2: Global Installation

Activate globally:

```bash
dart pub global activate svg_splitter
```

**Important:** Add `$HOME/.pub-cache/bin` to your PATH:

### macOS / Linux

Add to `~/.zshrc` or `~/.bashrc`:

```bash
export PATH="$PATH:$HOME/.pub-cache/bin"
```

Then reload:
```bash
source ~/.zshrc  # or source ~/.bashrc
```

### Windows

Add to your system PATH:
1. Open System Properties → Environment Variables
2. Add `%USERPROFILE%\AppData\Local\Pub\Cache\bin` to Path

Then use it from anywhere:

```bash
svg_splitter assets/icons/icon.svg
```

## Option 3: Clone and Use Locally

If you want to use it directly from source:

```bash
cd packages/svg_splitter
dart run bin/svg_splitter.dart assets/icons/icon.svg
```

## Verification

Check if installation worked:

```bash
dart run svg_splitter --help
```

You should see the help message with usage instructions.





