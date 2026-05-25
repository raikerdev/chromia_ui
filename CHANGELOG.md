# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-05-25

### Added

#### Theme System
- `ChromiaThemeData` — main theme data class combining all sub-systems
- `ChromiaTheme` — `InheritedWidget` that propagates the theme down the tree
- `ChromiaTheme.of()` / `ChromiaTheme.maybeOf()` — safe theme accessors
- `debugCheckHasChromiaTheme()` — debug assertion helper
- `AnimatedChromiaTheme` — implicit animation between themes
- `ChromiaThemeDataTween` — tween for theme interpolation
- `BuildContext` extensions: `chromiaTheme`, `chromiaColors`, `chromiaTypography`, `chromiaSpacing`, `chromiaRadius`, `chromiaShadows`, `isDarkTheme`, `isLightTheme`

#### Design Tokens
- `ChromiaColors` — 34 semantic color roles (MD3 + success/warning/info families) with light/dark factories and `lerp` support
- `ChromiaTypography` — 17 text styles (display → overline) with `lerp` and `apply` support
- `ChromiaSpacing` — 13 spacing values with EdgeInsets and SizedBox helpers, `lerp` support
- `ChromiaRadius` — 8 border radius values with `BorderRadius` and `RoundedRectangleBorder` helpers, `lerp` support
- `ChromiaShadows` — 7 shadow levels with `lerp` support
- `AnimationTokens` — duration constants (0ms–500ms) and standard curves
- `BreakpointTokens` — responsive breakpoints (mobile/tablet/desktop/desktopLarge)
- `ColorTokens` — base color palette (neutral, error, success, warning, info)
- `SpacingTokens` / `TypographyTokens` — primitive design token values

#### Brand System
- `ChromiaBrandConfig` — brand configuration (name, colorConfig, typographyConfig)
- `ChromiaBrandColorConfig` — per-brand primary/secondary color overrides with custom color map
- `ChromiaBrandTypographyConfig` — per-brand font family per scale level
- `ChromiaBrandThemeExtension` — `ThemeExtension` for MaterialApp integration
- `ChromiaThemeData.fromBrand()` — generates a complete theme from a brand config
- `BrandConfigs` — predefined brands: `chromia`, `blueTheme`, `purpleTheme`, `orangeTheme`

#### Material Integration
- `ChromiaThemeData.toMaterialTheme()` — maps Chromia tokens to 14 Material sub-themes (AppBar, Card, Dialog, PopupMenu, Tooltip, SnackBar, ProgressIndicator, Slider, InputDecoration, Checkbox, Radio, Switch, and 4 button variants)

#### Components — Display
- `ChromiaText` — themed text with typography type enum
- `ChromiaRichText` — rich text with inline spans
- `ChromiaAvatar` / `ChromiaAvatarGroup` — image, initials, and icon avatars
- `ChromiaBadge` / `ChromiaLabelBadge` / `ChromiaStatusBadge` — notification and status badges
- `ChromiaChip` — filter, input, and suggestion chip variants
- `ChromiaListTile` — versatile list tile with leading/trailing/label support
- `ChromiaCodePreview` / `ChromiaSyntaxView` — syntax-highlighted code display

#### Components — Input
- `ChromiaButton` — filled, outlined, text, tonal, and elevated variants with sizes, loading state, and icon support
- `ChromiaTextField` — filled and outlined variants with validation, prefix/suffix icons
- `ChromiaTextFieldValidator` — built-in validators (required, email, min/max length, regex)
- `ChromiaCheckbox` / `ChromiaListTileCheckbox` — themed checkbox with tri-state support
- `ChromiaRadioButton` / `ChromiaRadioButtonGroup` / `ChromiaListTileRadioButton` — radio selection
- `ChromiaToggleButton` / `ChromiaListTileToggleButton` — on/off toggle
- `ChromiaSlider` / `ChromiaRangeSlider` — single and range sliders with custom icon thumb
- `ChromiaListTileSlider` / `ChromiaListTileRangeSlider` — list tile slider variants
- `ChromiaDropdown` — themed dropdown selector
- `ChromiaDatePicker` — date and time picker with dark mode support

#### Components — Feedback
- `ChromiaDialog` — themed alert and custom dialogs
- `ChromiaCircularProgress` / `ChromiaLinearProgress` — determinate and indeterminate progress
- `ChromiaSteppedProgress` — step-based progress indicator
- `ChromiaSnackbar` — themed snackbar
- `ChromiaTooltip` — themed tooltip

#### Components — Layout
- `ChromiaCard` / `ChromiaListTileCard` — themed card containers
- `ChromiaDivider` — themed horizontal divider

#### Components — Navigation
- `ChromiaAppBar` — themed app bar with automatic back button
- `ChromiaBottomNavigation` — themed bottom navigation bar
- `ChromiaDrawer` / `ChromiaMiniDrawer` — full and compact icon-only drawers
- `ChromiaMenu` — themed popup menu

#### Utilities
- `ChromiaInteractiveWidget` — hover/press/highlight state management base widget
- `ChromiaListTileShell` / `ChromiaInlineLabel` — shared list tile building blocks
- `ChromiaPositionWidget` — overlay positioning helper
- `PlatformDetector` — platform detection with `select` and `when` helpers
- `ResponsiveBuilder` — breakpoint-aware layout widget
- `BreakpointExtension` on `BuildContext` — `isMobile`, `isTablet`, `isDesktop`, `isDesktopLarge`
- `ColorUtils` — color manipulation utilities (lighten, darken, contrast ratio, hex conversion)
- Constants: `kChromiaVersion`, `kDefaultAnimationDuration`, `kMinTapTargetSize`, `ZIndex`, `AspectRatios`

#### Example App
- Full showcase app with 30+ screens covering every component
- Dynamic light/dark mode toggle
- Multi-brand switching with live preview
- Built with `flutter_bloc`, `go_router`, and `material_symbols_icons`

[0.1.0]: https://github.com/raikerdev/chromia_ui/releases/tag/v0.1.0
