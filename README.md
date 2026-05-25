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
- **40+ Components** — A complete set of production-ready UI components
- **Type Safe** — Strongly typed API for better developer experience
- **Responsive** — Adaptive layouts and breakpoint tokens for any screen size
- **Material Integration** — Drop-in replacement for MaterialApp themes via `toMaterialTheme()`

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
      child: Builder(
        builder: (context) => MaterialApp(
          title: 'My App',
          theme: context.chromiaTheme.toMaterialTheme(),
          home: const HomePage(),
        ),
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

### Animated Theme Switching

```dart
AnimatedChromiaTheme(
  data: isDark ? ChromiaThemeData.dark() : ChromiaThemeData.light(),
  duration: const Duration(milliseconds: 300),
  child: YourApp(),
)
```

### Brand-Specific Theme

Chromia UI supports multiple brands with independent color palettes and font families:

```dart
ChromiaTheme(
  data: ChromiaThemeData.fromBrand(
    ChromiaBrandConfig(
      name: 'MyBrand',
      colorConfig: ChromiaBrandColorConfig(
        primaryLight: const Color(0xFF6200EE),
        primaryDark: const Color(0xFFBB86FC),
      ),
    ),
  ),
  child: YourApp(),
);
```

Use predefined brand configs:

```dart
ChromiaThemeData.fromBrand(BrandConfigs.blueTheme, isDark: true);
// Available: BrandConfigs.chromia, blueTheme, purpleTheme, orangeTheme
```

---

## Design Tokens

Chromia UI uses a token-based design system for consistency across all components.

| Token Category | Class | Description |
|---|---|---|
| Colors | `ChromiaColors` | 34 semantic color roles (MD3 + success/warning/info) |
| Typography | `ChromiaTypography` | Text style scale (display → overline) |
| Spacing | `ChromiaSpacing` | Margin, padding, and gap values (2px–64px) |
| Radius | `ChromiaRadius` | Border radius scale (2px–full/pill) |
| Shadows | `ChromiaShadows` | Elevation shadow definitions |
| Animation | `AnimationTokens` | Durations (0ms–500ms) and standard curves |
| Breakpoints | `BreakpointTokens` | Responsive layout breakpoints |

---

## Components

### Buttons

```dart
// Filled button (default)
ChromiaButton(
  onPressed: () {},
  child: const Text('Confirm'),
)

// Outlined, large, with icon
ChromiaButton(
  variant: ChromiaButtonVariant.outlined,
  size: ChromiaButtonSize.large,
  icon: const Icon(Icons.add),
  onPressed: () {},
  child: const Text('Add item'),
)

// Loading state
ChromiaButton(
  isLoading: true,
  onPressed: () {},
  child: const Text('Saving...'),
)
```

### Text Fields

```dart
ChromiaTextField(
  label: 'Email',
  hintText: 'Enter your email',
  validators: [ChromiaTextFieldValidator.email()],
)

ChromiaTextField(
  label: 'Password',
  obscureText: true,
  validators: [ChromiaTextFieldValidator.required()],
)
```

### Cards

```dart
ChromiaCard(
  child: const Text('Card content'),
)

ChromiaListTileCard(
  leading: const Icon(Icons.star),
  title: 'Item title',
  subtitle: 'Subtitle text',
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
  options: const ['Option A', 'Option B', 'Option C'],
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

ChromiaLabelBadge(label: 'New')

ChromiaStatusBadge(status: ChromiaStatus.success)
```

### Avatars

```dart
// From initials
ChromiaAvatar.initials(
  initials: 'AB',
  size: ChromiaAvatarSize.medium,
)

// From image
ChromiaAvatar.image(
  imageProvider: NetworkImage('https://example.com/avatar.jpg'),
  size: ChromiaAvatarSize.large,
)
```

### Chips

```dart
ChromiaChip(
  label: 'Flutter',
  onDeleted: () {},
)

ChromiaChip.filter(
  label: 'Active',
  selected: isSelected,
  onSelected: (val) => setState(() => isSelected = val),
)
```

### Dialogs

```dart
showChromiaDialog(
  context: context,
  builder: (_) => const ChromiaDialog(
    title: 'Confirm action',
    content: 'Are you sure you want to proceed?',
    actions: [
      ChromiaDialogAction(label: 'Cancel', onPressed: null),
      ChromiaDialogAction(label: 'Confirm', onPressed: null),
    ],
  ),
);
```

### Tooltips

```dart
ChromiaTooltip(
  message: 'Helpful information',
  child: const Icon(Icons.info_outline),
)
```

### Typography

```dart
ChromiaText(
  'Display Large',
  type: ChromiaTypographyType.displayLarge,
)

ChromiaText(
  'Body text',
  type: ChromiaTypographyType.bodyMedium,
  color: context.chromiaColors.onSurfaceVariant,
)
```

### App Bar & Navigation

```dart
ChromiaAppBar(
  title: 'My Screen',
  actions: [
    IconButton(icon: const Icon(Icons.search), onPressed: () {}),
  ],
)

// Full navigation drawer
ChromiaDrawer(items: [...])

// Compact mini drawer (icon-only)
ChromiaMiniDrawer(items: [...])
```

---

## Responsive Design

```dart
// Breakpoint-aware widget
ResponsiveBuilder(
  mobile: const MobileLayout(),
  tablet: const TabletLayout(),
  desktop: const DesktopLayout(),
)

// BuildContext extensions
if (context.isMobile) { ... }
if (context.isDesktopOrLarger) { ... }
```

---

## Full Component List

| Category | Components |
|---|---|
| App Bar | `ChromiaAppBar` |
| Avatar | `ChromiaAvatar`, `ChromiaAvatarGroup` |
| Badge | `ChromiaBadge`, `ChromiaLabelBadge`, `ChromiaStatusBadge` |
| Button | `ChromiaButton` |
| Card | `ChromiaCard`, `ChromiaListTileCard` |
| Checkbox | `ChromiaCheckbox`, `ChromiaListTileCheckbox` |
| Chip | `ChromiaChip` (filter, input, suggestion variants) |
| Code | `ChromiaCodePreview`, `ChromiaSyntaxView` |
| Date/Time | `ChromiaDatePicker` |
| Dialog | `ChromiaDialog` |
| Divider | `ChromiaDivider` |
| Drawer | `ChromiaDrawer`, `ChromiaMiniDrawer` |
| Dropdown | `ChromiaDropdown` |
| Input | `ChromiaTextField` |
| Menu | `ChromiaMenu` |
| Navigation | `ChromiaBottomNavigation` |
| Progress | `ChromiaLinearProgress`, `ChromiaCircularProgress`, `ChromiaSteppedProgress` |
| Radio Button | `ChromiaRadioButton`, `ChromiaRadioButtonGroup`, `ChromiaListTileRadioButton` |
| Slider | `ChromiaSlider`, `ChromiaRangeSlider`, `ChromiaListTileSlider`, `ChromiaListTileRangeSlider` |
| Text | `ChromiaText`, `ChromiaRichText` |
| Toggle Button | `ChromiaToggleButton`, `ChromiaListTileToggleButton` |
| Tooltip | `ChromiaTooltip` |

---

## Example App

The `/example` folder contains a full demo app showcasing every component and feature:

- Dynamic theme switching (light/dark/brand) using BLoC
- Navigation with GoRouter across 30+ demo screens
- Responsive layout with app bar, drawer, and mini drawer
- Live demos for all components

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
    │   ├── display/        # Text, Avatar, Badge, Chip, ListTile, Code
    │   ├── feedback/       # Dialog, Progress, Snackbar, Tooltip
    │   ├── input/          # Button, TextField, Checkbox, Radio, Slider, etc.
    │   ├── layout/         # Card, Divider
    │   ├── navigation/     # AppBar, BottomNav, Drawer, Menu
    │   └── utils/          # Shared building blocks
    ├── theme/              # ChromiaTheme, ChromiaThemeData, color/typography/spacing...
    ├── tokens/             # Design tokens (animation, breakpoints, color, spacing, typography)
    ├── foundation/         # Platform utilities and constants
    └── utils/              # Color utilities
```

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ by [RaikerDev](https://github.com/raikerdev)
