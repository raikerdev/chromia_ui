// lib/chromia_ui.dart

/// Chromia UI - A comprehensive Flutter UI component library.
///
/// Chromia UI provides a complete design system with components for
/// mobile, desktop, and web applications. Features include:
///
/// - Dynamic theming with light and dark mode support
/// - Multi-brand configuration
/// - Responsive design utilities
/// - Comprehensive component library
/// - Type-safe API
///
/// ## Getting Started
///
/// Wrap your app with [ChromiaTheme] to provide the theme:
///
/// ```dart
/// ChromiaTheme(
///   data: ChromiaThemeData.light(),
///   child: MaterialApp(
///     home: MyHomePage(),
///   ),
/// )
/// ```
///
/// ## Using Components
///
/// All components automatically inherit the theme:
///
/// ```dart
/// ChromiaButton(
///   onPressed: () {},
///   child: Text('Click me'),
/// )
/// ```
library;

// Components
export 'src/components/badge/chromia_badge.dart';
export 'src/components/badge/chromia_label.dart';
export 'src/components/badge/chromia_status_badge.dart';
export 'src/components/button/chromia_button.dart';
export 'src/components/button/chromia_button_style.dart';
export 'src/components/card/chromia_card.dart';
export 'src/components/card/chromia_list_tile_card.dart';
export 'src/components/checkbox/chromia_checkbox.dart';
export 'src/components/checkbox/chromia_list_tile_checkbox.dart';
export 'src/components/dialog/chromia_dialog.dart';
export 'src/components/input/chromia_text_field.dart';
export 'src/components/input/chromia_text_field_style.dart';
export 'src/components/input/util/chromia_text_field_validator.dart';
export 'src/components/progress/chromia_circular_progress.dart';
export 'src/components/progress/chromia_linear_progress.dart';
export 'src/components/progress/chromia_stepped_progress.dart';
export 'src/components/radio_button/chromia_list_tile_radio_button.dart';
export 'src/components/radio_button/chromia_radio_button.dart';
export 'src/components/radio_button/chromia_radio_button_group.dart';
export 'src/components/slider/chromia_list_tile_range_slider.dart';
export 'src/components/slider/chromia_list_tile_slider.dart';
export 'src/components/slider/chromia_range_slider.dart';
export 'src/components/slider/chromia_slider.dart';
export 'src/components/text/chromia_text.dart';
export 'src/components/toggle_button/chromia_list_tile_toggle_button.dart';
export 'src/components/toggle_button/chromia_toggle_button.dart';

// Foundation
export 'src/foundation/constants.dart';
export 'src/foundation/platform_detector.dart';

// Theme
export 'src/theme/brand/brand_config.dart';
export 'src/theme/brand/brand_theme_extension.dart';
export 'src/theme/chromia_colors.dart';
export 'src/theme/chromia_radius.dart';
export 'src/theme/chromia_shadows.dart';
export 'src/theme/chromia_spacing.dart';
export 'src/theme/chromia_theme.dart';
export 'src/theme/chromia_theme_data.dart';
export 'src/theme/chromia_typography.dart';

// Tokens
export 'src/tokens/animation_tokens.dart';
export 'src/tokens/breakpoint_tokens.dart';
export 'src/tokens/color_tokens.dart';
export 'src/tokens/spacing_tokens.dart';
export 'src/tokens/typography_tokens.dart';

// Utils
export 'src/utils/color_utils.dart';
