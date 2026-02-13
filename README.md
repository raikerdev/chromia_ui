# Chromia UI

A comprehensive Flutter UI component library for mobile, desktop, and web applications with dynamic theming, brand management, and dark mode support.

[![pub package](https://img.shields.io/pub/v/chromia_ui.svg)](https://pub.dev/packages/chromia_ui)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

✨ **Multi-Platform Support** - Works seamlessly on mobile, desktop, and web  
🎨 **Dynamic Theming** - Flexible theme system with runtime customization  
🏢 **Brand Management** - Support for multiple brands with independent themes  
🌓 **Dark Mode** - Built-in dark mode support from the ground up  
📱 **Responsive** - Adaptive layouts for different screen sizes  
🎯 **Type Safe** - Strongly typed API for better developer experience  
🔧 **Customizable** - Every component can be customized without breaking changes  
⚡ **Performance** - Optimized for smooth 60fps animations

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

## Quick Start

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
        title: 'Chromia UI Demo',
        home: const HomePage(),
      ),
    );
  }
}
```

## Theme Configuration

### Basic Theme Setup

```dart
ChromiaTheme(
  data: ChromiaThemeData.light(),
  child: YourApp(),
)
```

### Custom Theme

```dart
ChromiaTheme(
  data: ChromiaThemeData(
    colors: ChromiaColors.fromPrimary(Colors.purple),
    typography: ChromiaTypography.defaultTypography,
    // ... more customization
  ),
  child: YourApp(),
)
```

### Dark Mode

```dart
ChromiaTheme(
  data: ChromiaThemeData.dark(),
  child: YourApp(),
)
```

### Brand-Specific Theme

```dart
ChromiaTheme(
  data: ChromiaThemeData.fromBrand(
    BrandConfig(
      name: 'MyBrand',
      primaryColor: Color(0xFF6200EE),
      // ... brand configuration
    ),
  ),
  child: YourApp(),
)
```

## Components

### Available Components

- **Buttons** - ChromiaButton with multiple variants
- More components coming soon...

## Documentation

For detailed documentation, visit [documentation link].

## Examples

Check out the `/example` folder for comprehensive examples of all components and features.

## Contributing

Contributions are welcome! Please read our [Contributing Guide](https://CONTRIBUTING.md) before submitting a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Roadmap

- [x] Theme system
- [x] Color tokens
- [x] Typography system
- [x] Button component
- [x] Input components
- [x] Card components
- [ ] Navigation components
- [ ] Layout components
- [ ] Feedback components

## Support

If you encounter any issues or have questions, please [open an issue](https://github.com/yourusername/chromia_ui/issues).

---

Made with ❤️ by the Chromia UI team