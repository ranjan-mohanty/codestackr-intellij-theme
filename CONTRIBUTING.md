# Contributing to codeSTACKr Theme

Thank you for your interest in contributing! This document provides guidelines
and instructions for contributing to the codeSTACKr IntelliJ Theme.

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on what is best for the community
- Show empathy towards other community members

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates.

**When submitting a bug report, include:**

- Clear and descriptive title
- Steps to reproduce the issue
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- IntelliJ IDEA version
- Theme variant (Regular or Muted)
- Operating system

**Example:**

```markdown
**Title:** Incorrect color for Java annotations

**Description:** Java annotations are displayed in the wrong color in the
Regular theme variant.

**Steps to Reproduce:**

1. Open a Java file
2. Add an annotation like @Override
3. Observe the color

**Expected:** Yellow (#FFE400) **Actual:** Blue (#5eb7ee)

**Environment:**

- IntelliJ IDEA 2023.2
- Theme: codeSTACKr Theme (Regular)
- OS: macOS 14.0
```

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues.

**When suggesting an enhancement, include:**

- Clear and descriptive title
- Detailed description of the proposed feature
- Why this enhancement would be useful
- Examples or mockups (if applicable)

### Pull Requests

1. **Fork the repository**

   ```bash
   git clone https://github.com/YOUR-USERNAME/codestackr-intellij-theme.git
   cd codestackr-intellij-theme
   ```

2. **Create a branch**

   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

3. **Make your changes**
   - Follow the coding standards below
   - Test your changes thoroughly
   - Update documentation if needed

4. **Commit your changes**

   ```bash
   git add .
   git commit -m "Add: Brief description of your changes"
   ```

   **Commit message format:**
   - `Add:` for new features
   - `Fix:` for bug fixes
   - `Update:` for updates to existing features
   - `Docs:` for documentation changes
   - `Refactor:` for code refactoring

5. **Push to your fork**

   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Fill in the PR template
   - Submit!

## Development Setup

### Prerequisites

- JDK 17 or higher
- Git
- IntelliJ IDEA (recommended for development)

### Setup Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/ranjan-mohanty/codestackr-intellij-theme.git
   cd codestackr-intellij-theme
   ```

2. **Build the plugin**

   ```bash
   ./gradlew buildPlugin
   ```

3. **Run in development mode**

   ```bash
   ./gradlew runIde
   ```

## Project Structure

```text
src/main/resources/
├── META-INF/
│   └── plugin.xml                      # Plugin metadata
└── themes/
    ├── codestackr-theme.theme.json     # UI colors (Regular)
    ├── codestackr-theme.xml            # Editor colors (Regular)
    ├── codestackr-theme-muted.theme.json  # UI colors (Muted)
    └── codestackr-theme-muted.xml      # Editor colors (Muted)
```

## Coding Standards

### Theme Files

#### JSON Files (UI Colors)

- Use 2-space indentation
- Colors in hex format without `#`
- Alphabetically order properties within sections
- Include comments for complex sections

**Example:**

```json
{
  "Button": {
    "default": {
      "foreground": "ffffff",
      "startBackground": "FF652F",
      "endBackground": "FF652F"
    }
  }
}
```

#### XML Files (Editor Colors)

- Use 2-space indentation
- Colors in hex format without `#`
- Group related attributes together
- Add comments for language-specific sections

**Example:**

```xml
<option name="JAVA_KEYWORD">
  <value>
    <option name="FOREGROUND" value="5eb7ee" />
  </value>
</option>
```

### Color Guidelines

1. **Consistency**: Use the same color for similar elements across both variants
2. **Contrast**: Ensure sufficient contrast for readability (WCAG AA minimum)
3. **Accessibility**: Test with color blindness simulators
4. **Harmony**: Colors should work well together

### Color Palette Reference

**Regular Theme:**

- Primary: `#FF652F` (Orange)
- Keywords: `#5eb7ee` (Blue)
- Strings: `#14A76C` (Green)
- Numbers: `#FFE400` (Yellow)
- Comments: `#577997` (Gray-Blue)

**Muted Theme:**

- Primary: `#ffb59a` (Soft Orange)
- Keywords: `#bae0f8` (Light Blue)
- Strings: `#8df1c9` (Mint Green)
- Numbers: `#fff7ad` (Light Yellow)
- Comments: `#577997` (Gray-Blue)

## Testing

### Manual Testing Checklist

Before submitting a PR, test:

- [ ] Build succeeds: `./gradlew buildPlugin`
- [ ] Verification passes: `./gradlew verifyPlugin`
- [ ] Theme loads in IntelliJ IDEA
- [ ] Both variants work correctly
- [ ] Syntax highlighting for major languages:
  - [ ] Java
  - [ ] Kotlin
  - [ ] JavaScript/TypeScript
  - [ ] Python
  - [ ] HTML/CSS
  - [ ] JSON
  - [ ] Markdown
- [ ] UI elements render correctly:
  - [ ] Menus
  - [ ] Dialogs
  - [ ] Tool windows
  - [ ] Editor tabs
  - [ ] Status bar
- [ ] No console errors
- [ ] Documentation updated (if needed)

### Testing in Development Mode

```bash
# Run IntelliJ IDEA with your changes
./gradlew runIde

# The IDE will open with your theme installed
# Test thoroughly before committing
```

## Documentation

When making changes that affect users:

1. **Update README.md** - For feature changes
2. **Update CHANGELOG.md** - For all changes
3. **Update QUICKSTART.md** - For setup changes
4. **Add code comments** - For complex logic

## Versioning

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR** (1.0.0): Breaking changes
- **MINOR** (1.1.0): New features, backward compatible
- **PATCH** (1.0.1): Bug fixes

## Review Process

1. **Automated Checks**: GitHub Actions will run automatically
2. **Code Review**: Maintainers will review your code
3. **Testing**: Changes will be tested manually
4. **Feedback**: You may be asked to make changes
5. **Merge**: Once approved, your PR will be merged

## Getting Help

- 📖 Read the [documentation](README.md)
- 💬 Join
  [discussions](https://github.com/ranjan-mohanty/codestackr-intellij-theme/discussions)
- 🐛 Check
  [existing issues](https://github.com/ranjan-mohanty/codestackr-intellij-theme/issues)
- 📧 Contact maintainers

## Recognition

Contributors will be:

- Listed in the README
- Mentioned in release notes
- Credited in the plugin description (for significant contributions)

## Resources

- [IntelliJ Platform SDK](https://plugins.jetbrains.com/docs/intellij/)
- [Theme Development Guide](https://plugins.jetbrains.com/docs/intellij/themes.html)
- [Color Scheme Reference](https://plugins.jetbrains.com/docs/intellij/color-scheme-reference.html)
- [UI Guidelines](https://jetbrains.design/intellij/)

## License

By contributing, you agree that your contributions will be licensed under the
MIT License.

---

Thank you for contributing to codeSTACKr Theme! 🎨
