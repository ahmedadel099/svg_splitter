## 1.0.4

- Fixed Windows path handling bug - now correctly handles backslashes (`\`) on Windows
- Improved cross-platform path parsing using Dart's `File` and `Directory` APIs
- Better error handling for file paths and extensions
- Fixes `RangeError` when running on Windows with paths like `assets\images\file.svg`

## 1.0.3

- Improved example app UI with separate comparison screen
- Better error handling and user feedback

## 1.0.1

- Fixed GIF preview display on pub.dev (using GitHub raw URL)
- Updated documentation version references

## 1.0.0

- Initial release of SVG Splitter
- Automatic detection of dynamic colors (#DB1C42, #FF0000 by default)
- Support for custom dynamic colors via `--dynamic-color` flag
- Support for custom output directory via `--output-dir` flag
- Help documentation with `--help` flag
- Flexible SVG parsing that handles various attribute orders
- Fallback parsing for edge cases

