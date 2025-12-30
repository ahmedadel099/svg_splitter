# Publishing Guide

This guide explains how to publish `svg_splitter` to pub.dev.

## Pre-Publication Checklist

- [ ] Update version in `pubspec.yaml`
- [ ] Update `CHANGELOG.md` with new version
- [ ] Update `README.md` if needed
- [ ] Test the package locally
- [ ] Run `dart pub publish --dry-run`

## Step 1: Prepare the Package

### Update Version

Edit `pubspec.yaml`:
```yaml
version: 1.0.0  # Update to new version
```

### Update CHANGELOG

Add new entries to `CHANGELOG.md`:
```markdown
## 1.0.1

- Bug fixes
- New features
```

### Verify Package Structure

```bash
cd packages/svg_splitter
dart pub get
dart analyze
dart pub publish --dry-run
```

## Step 2: Test Locally

### Test Installation

```bash
# From the package directory
dart pub global activate --source path .
```

### Test Usage

```bash
svg_splitter --help
dart run svg_splitter example/icons/test.svg
```

## Step 3: Publish to pub.dev

### First Time Publishing

1. **Create pub.dev account:**
   - Go to https://pub.dev
   - Sign in with Google account
   - Verify email

2. **Get authorization:**
   ```bash
   dart pub login
   ```

3. **Verify package:**
   ```bash
   dart pub publish --dry-run
   ```

4. **Publish:**
   ```bash
   dart pub publish
   ```

### Updating Published Package

1. Update version in `pubspec.yaml`
2. Update `CHANGELOG.md`
3. Run dry-run:
   ```bash
   dart pub publish --dry-run
   ```
4. Publish:
   ```bash
   dart pub publish
   ```

## Step 4: After Publishing

1. **Verify on pub.dev:**
   - Check package page: https://pub.dev/packages/svg_splitter
   - Verify README renders correctly
   - Test installation instructions

2. **Update documentation:**
   - Update any references to installation
   - Add package to related projects

## Package Requirements

- ✅ Valid `pubspec.yaml`
- ✅ README.md with clear documentation
- ✅ CHANGELOG.md with version history
- ✅ LICENSE file
- ✅ Valid Dart code (passes `dart analyze`)
- ✅ No errors in `dart pub publish --dry-run`

## Version Guidelines

Follow semantic versioning:
- **MAJOR** (1.0.0 → 2.0.0): Breaking changes
- **MINOR** (1.0.0 → 1.1.0): New features, backward compatible
- **PATCH** (1.0.0 → 1.0.1): Bug fixes, backward compatible

## Troubleshooting

**"Package already exists":**
- Check if package name is available
- Consider adding your username as prefix: `yourname_svg_splitter`

**"Validation failed":**
- Run `dart pub publish --dry-run` to see errors
- Fix all warnings and errors
- Ensure all required files exist

**"Upload failed":**
- Check internet connection
- Verify you're logged in: `dart pub login`
- Try again after a few minutes

