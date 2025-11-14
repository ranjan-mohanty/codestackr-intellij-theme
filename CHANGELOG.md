# Changelog

All notable changes to the codeSTACKr Theme for IntelliJ will be documented in
this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2025-11-14

### Changed

- **Major Platform Upgrade**: Upgraded to IntelliJ Platform 2024.3, Gradle 9.2,
  and Java 21
- **Extended Compatibility**: Now supports IntelliJ IDEA 2019.1+ (6 years
  backward compatibility)
- **Build System**: Upgraded to Gradle 9.2.0 and Java 21 LTS for better
  performance and modern features
- **CI/CD Improvements**:
  - Restructured GitHub Actions workflows with parallel job execution
  - Added comprehensive compatibility verification across 6 major IntelliJ
    versions
  - Auto-detection of latest IntelliJ releases for future-proof testing
  - Build workflow now runs on every commit for continuous feedback

### Technical

- Upgraded IntelliJ Platform Gradle Plugin to 2.10.4
- Build platform upgraded to IntelliJ IDEA 2024.3
- Compatibility range: 2019.1+ to unlimited future versions
- Optimized CI workflows with caching and parallel execution
- Added detailed verification reports for compatibility testing

## [1.1.0] - 2024-11-13

### Added

- Light theme variant for daytime coding with optimized readability
  - Darker text colors for better contrast on white background
  - Proper terminal colors with black text instead of white
  - Enhanced selection colors for better visibility
- High Contrast theme for better accessibility
- Now includes 4 theme variants: Regular, Muted, Light, and High Contrast

## [1.0.0] - 2024-11-12

### Added

- Initial release of codeSTACKr Theme for IntelliJ
- Two theme variants: Regular and Muted
- Full syntax highlighting support for:
  - Java
  - Kotlin
  - JavaScript/TypeScript
  - Python
  - HTML/XML
  - CSS
  - JSON
  - Markdown
  - SQL
- Comprehensive UI theming
- Support for IntelliJ IDEA 2023.2+
- Compatible with all JetBrains IDEs

### Features

- Deep dark background (#09131b) for reduced eye strain
- Vibrant syntax highlighting with carefully chosen colors
- Consistent color scheme across all UI elements
- Optimized for long coding sessions
- Based on the popular VS Code theme by codeSTACKr

[1.2.0]:
  https://github.com/ranjan-mohanty/codestackr-intellij-theme/releases/tag/v1.2.0
[1.1.0]:
  https://github.com/ranjan-mohanty/codestackr-intellij-theme/releases/tag/v1.1.0
[1.0.0]:
  https://github.com/ranjan-mohanty/codestackr-intellij-theme/releases/tag/v1.0.0
