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
/// Wrap your app with ChromiaTheme to provide the theme:
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

//
// ============================================================================
// COMPONENTS - DISPLAY
// ============================================================================
export 'src/components/display/avatar/chromia_avatar.dart';
export 'src/components/display/badge/chromia_badge.dart';
export 'src/components/display/badge/chromia_label.dart';
export 'src/components/display/badge/chromia_status_badge.dart';
export 'src/components/display/chip/chromia_chip.dart';
export 'src/components/display/code_preview/chromia_code_preview.dart';
export 'src/components/display/text/chromia_rich_text.dart';
export 'src/components/display/text/chromia_text.dart';
//
// ============================================================================
// COMPONENTS - FEEDBACK
// ============================================================================
export 'src/components/feedback/dialog/chromia_dialog.dart';
export 'src/components/feedback/progress/chromia_circular_progress.dart';
export 'src/components/feedback/progress/chromia_linear_progress.dart';
export 'src/components/feedback/progress/chromia_stepped_progress.dart';
export 'src/components/feedback/snack_bar/chromia_snackbar.dart';
export 'src/components/feedback/tooltip/chromia_tooltip.dart';
//
// ============================================================================
// COMPONENTS - INPUT
// ============================================================================
export 'src/components/input/button/chromia_button.dart';
export 'src/components/input/button/chromia_button_style.dart';
export 'src/components/input/checkbox/chromia_checkbox.dart';
export 'src/components/input/checkbox/chromia_list_tile_checkbox.dart';
export 'src/components/input/date_picker/chromia_date_picker.dart';
export 'src/components/input/dropdown/chromia_dropdown.dart';
export 'src/components/input/radio_button/chromia_list_tile_radio_button.dart';
export 'src/components/input/radio_button/chromia_radio_button.dart';
export 'src/components/input/radio_button/chromia_radio_button_group.dart';
export 'src/components/input/slider/chromia_list_tile_range_slider.dart';
export 'src/components/input/slider/chromia_list_tile_slider.dart';
export 'src/components/input/slider/chromia_range_slider.dart';
export 'src/components/input/slider/chromia_slider.dart';
export 'src/components/input/text_field/chromia_text_field.dart';
export 'src/components/input/text_field/chromia_text_field_style.dart';
export 'src/components/input/text_field/util/chromia_text_field_validator.dart';
export 'src/components/input/toggle_button/chromia_list_tile_toggle_button.dart';
export 'src/components/input/toggle_button/chromia_toggle_button.dart';
//
// ============================================================================
// COMPONENTS - LAYOUT
// ============================================================================
export 'src/components/layout/card/chromia_card.dart';
export 'src/components/layout/card/chromia_list_tile_card.dart';
export 'src/components/layout/divider/chromia_divider.dart';
//
// ============================================================================
// COMPONENTS - NAVIGATION
// ============================================================================
export 'src/components/navigation/app_bar/chromia_app_bar.dart';
export 'src/components/navigation/bottom_navigation/chromia_bottom_navigation.dart';
export 'src/components/navigation/drawer/chromia_drawer.dart';
export 'src/components/navigation/drawer/chromia_mini_drawer.dart';
export 'src/components/navigation/menu/chromia_menu.dart';
//
// ============================================================================
// FOUNDATION
// ============================================================================
export 'src/foundation/constants.dart';
export 'src/foundation/platform_detector.dart';
//
// ============================================================================
// THEME
// ============================================================================
export 'src/theme/brand/brand_config.dart';
export 'src/theme/brand/brand_theme_extension.dart';
export 'src/theme/chromia_colors.dart';
export 'src/theme/chromia_radius.dart';
export 'src/theme/chromia_shadows.dart';
export 'src/theme/chromia_spacing.dart';
export 'src/theme/chromia_theme.dart';
export 'src/theme/chromia_theme_data.dart';
export 'src/theme/chromia_typography.dart';
//
// ============================================================================
// TOKENS
// ============================================================================
export 'src/tokens/animation_tokens.dart';
export 'src/tokens/breakpoint_tokens.dart';
export 'src/tokens/color_tokens.dart';
export 'src/tokens/spacing_tokens.dart';
export 'src/tokens/typography_tokens.dart';
//
// ============================================================================
// UTILS
// ============================================================================
export 'src/utils/color_utils.dart';
