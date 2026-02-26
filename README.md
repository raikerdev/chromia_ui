# Chromia UI

A modern, dynamic Flutter design system with comprehensive UI components, theming support, and multi-brand management for mobile, desktop, and web applications.

[![pub package](https://img.shields.io/pub/v/chromia_ui.svg)](https://pub.dev/packages/chromia_ui)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **Status:** Under active development. API may change before 1.0.0.

---

## Features

- **Multi-Platform** — Mobile, desktop, and web support out of the box
- **Dynamic Theming** — Runtime theme switching with light, dark, and custom themes
- **Multi-Brand Support** — Manage multiple brands with independent themes and color palettes
- **Design Tokens** — Consistent color, typography, spacing, radius, shadow, and animation tokens
- **34 Components** — A complete set of production-ready UI components
- **Type Safe** — Strongly typed API for better developer experience
- **Responsive** — Adaptive layouts and breakpoint tokens for any screen size
- **BLoC Ready** — Example app demonstrates BLoC integration for state management

---

## Requirements

- Dart `>=3.10.0 <4.0.0`
- Flutter `>=3.38.0`

---

## Installation

Add `chromia_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  chromia_ui: ^0.1.0
```

Then run:

```bash
flutter pub get
```

---

## Quick Start

Wrap your app with `ChromiaTheme` to provide the design system down the widget tree:

```dart
import 'package:flutter/material.dart';
import 'package:chromia_ui/chromia_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChromiaTheme(
      data: ChromiaThemeData.light(),
      child: MaterialApp(
        title: 'My App',
        theme: ChromiaTheme.of(context).toMaterialTheme(),
        home: const HomePage(),
      ),
    );
  }
}
```

Access the theme anywhere in the widget tree:

```dart
final colors = context.chromiaColors;
final typography = context.chromiaTypography;
final spacing = context.chromiaSpacing;
```

---

## Theme Configuration

### Light and Dark Themes

```dart
// Light theme
ChromiaTheme(data: ChromiaThemeData.light(), child: YourApp());

// Dark theme
ChromiaTheme(data: ChromiaThemeData.dark(), child: YourApp());
```

### Custom Theme

```dart
ChromiaTheme(
  data: ChromiaThemeData(
    colors: ChromiaColors.fromPrimary(Colors.indigo),
    typography: ChromiaTypography.defaultTypography,
    brightness: Brightness.light,
  ),
  child: YourApp(),
);
```

### Brand-Specific Theme

Chromia UI supports multiple brands with independent color palettes and font families:

```dart
ChromiaTheme(
  data: ChromiaThemeData.fromBrand(
    BrandConfig(
      name: 'MyBrand',
      primaryColor: Color(0xFF6200EE),
      secondaryColor: Color(0xFF03DAC6),
      fontFamily: 'Poppins',
    ),
  ),
  child: YourApp(),
);
```

---

## Design Tokens

Chromia UI uses a token-based design system for consistency across all components.

| Token Category | Class | Description |
|---|---|---|
| Colors | `ChromiaColors` | Semantic color roles (brand, surface, state, border) |
| Typography | `ChromiaTypography` | Text style scale (display → label) |
| Spacing | `ChromiaSpacing` | Consistent margin, padding, and gap values |
| Radius | `ChromiaRadius` | Border radius scale |
| Shadows | `ChromiaShadows` | Elevation shadow definitions |
| Animation | `AnimationTokens` | Durations and curves |
| Breakpoints | `BreakpointTokens` | Responsive layout breakpoints |

---

## Components

### Buttons

```dart
ChromiaButton(
  label: 'Confirm',
  onPressed: () {},
  variant: ChromiaButtonVariant.filled, // filled, outlined
  size: ChromiaButtonSize.medium,
  isLoading: false,
)
```

### Text Fields

```dart
ChromiaTextField(
  label: 'Email',
  hint: 'Enter your email',
  validator: ChromiaTextFieldValidator.email,
)
```

### Cards

```dart
ChromiaCard(
  child: Text('Card content'),
)

ChromiaListTileCard(
  title: 'Item title',
  subtitle: 'Subtitle text',
  leading: Icon(Icons.star),
)
```

### Checkboxes

```dart
ChromiaCheckbox(
  value: isChecked,
  onChanged: (val) => setState(() => isChecked = val!),
)

ChromiaListTileCheckbox(
  title: 'Enable notifications',
  value: isChecked,
  onChanged: (val) => setState(() => isChecked = val!),
)
```

### Radio Buttons

```dart
ChromiaRadioButtonGroup<String>(
  options: ['Option A', 'Option B', 'Option C'],
  groupValue: selected,
  onChanged: (val) => setState(() => selected = val),
)
```

### Toggle Buttons

```dart
ChromiaToggleButton(
  value: isOn,
  onChanged: (val) => setState(() => isOn = val),
)

ChromiaListTileToggleButton(
  title: 'Dark mode',
  value: isOn,
  onChanged: (val) => setState(() => isOn = val),
)
```

### Sliders

```dart
// Single value
ChromiaSlider(
  value: _value,
  onChanged: (val) => setState(() => _value = val),
)

// Range
ChromiaRangeSlider(
  values: _range,
  onChanged: (vals) => setState(() => _range = vals),
)
```

### Progress Indicators

```dart
ChromiaLinearProgress(value: 0.6)

ChromiaCircularProgress(value: 0.6)

ChromiaSteppedProgress(steps: 5, currentStep: 2)
```

### Badges

```dart
ChromiaBadge(label: '12')

ChromiaLabel(text: 'New')

ChromiaStatusBadge(status: ChromiaStatus.success)
```

### Avatars

```dart
ChromiaAvatar(
  imageUrl: 'https://example.com/avatar.jpg',
  initials: 'AB',
  size: ChromiaAvatarSize.medium,
)
```

### Chips

```dart
ChromiaChip(
  label: 'Flutter',
  onDeleted: () {},
)
```

### Dialogs

```dart
showDialog(
  context: context,
  builder: (_) => ChromiaDialog(
    title: 'Confirm action',
    content: Text('Are you sure you want to proceed?'),
    actions: [
      ChromiaButton(label: 'Cancel', onPressed: () => Navigator.pop(context)),
      ChromiaButton(label: 'Confirm', onPressed: () {}),
    ],
  ),
);
```

### Tooltips

```dart
ChromiaTooltip(
  message: 'Helpful information',
  child: Icon(Icons.info_outline),
)
```

### Typography

```dart
ChromiaText(
  'Display Large',
  style: ChromiaTextStyle.displayLarge,
)

ChromiaText(
  'Body text',
  style: ChromiaTextStyle.bodyMedium,
)
```

### App Bar & Navigation

```dart
ChromiaAppBar(
  title: 'My Screen',
  actions: [...],
)

// Full navigation drawer
ChromiaDrawer(items: [...])

// Compact mini drawer (icon-only)
ChromiaMiniDrawer(items: [...])
```

---

## Full Component List

| Category | Components |
|---|---|
| App Bar | `ChromiaAppBar` |
| Avatar | `ChromiaAvatar` |
| Badge | `ChromiaBadge`, `ChromiaLabel`, `ChromiaStatusBadge` |
| Button | `ChromiaButton` |
| Card | `ChromiaCard`, `ChromiaListTileCard` |
| Checkbox | `ChromiaCheckbox`, `ChromiaListTileCheckbox` |
| Chip | `ChromiaChip` |
| Dialog | `ChromiaDialog` |
| Drawer | `ChromiaDrawer`, `ChromiaMiniDrawer` |
| Input | `ChromiaTextField` |
| Progress | `ChromiaLinearProgress`, `ChromiaCircularProgress`, `ChromiaSteppedProgress` |
| Radio Button | `ChromiaRadioButton`, `ChromiaRadioButtonGroup`, `ChromiaListTileRadioButton` |
| Slider | `ChromiaSlider`, `ChromiaRangeSlider`, `ChromiaListTileSlider`, `ChromiaListTileRangeSlider` |
| Text | `ChromiaText` |
| Toggle Button | `ChromiaToggleButton`, `ChromiaListTileToggleButton` |
| Tooltip | `ChromiaTooltip` |

---

## Example App

The `/example` folder contains a full demo app showcasing every component and feature:

- Dynamic theme switching (light/dark/brand) using BLoC
- Navigation with GoRouter across 19 demo screens
- Responsive layout with app bar, drawer, and mini drawer
- Live demos for all 34 components

Run the example app:

```bash
cd example
flutter run
```

---

## Project Structure

```
lib/
├── chromia_ui.dart         # Main library export
└── src/
    ├── components/         # All UI components
    ├── theme/              # ChromiaTheme, ChromiaThemeData, colors, typography, spacing...
    ├── tokens/             # Design tokens (animation, breakpoints, color, spacing, typography)
    ├── foundation/         # Platform utilities and constants
    └── utils/              # Color and other utilities
```

---

## Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) before submitting a Pull Request.

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## Support

If you encounter any issues or have questions, please [open an issue](https://github.com/raikerdev/chromia_ui/issues).

---

Made with ❤️ by [RaikerDev](https://github.com/raikerdev)