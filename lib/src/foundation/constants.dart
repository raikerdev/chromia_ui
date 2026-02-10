/// Global constants for the Chromia UI library.
///
/// This file contains constant values used throughout the library
/// to maintain consistency and enable easy configuration changes.
library;

/// Library version
const String kChromiaVersion = '0.1.0';

/// Library name
const String kChromiaName = 'Chromia UI';

/// Default animation duration in milliseconds
const int kDefaultAnimationDuration = 200;

/// Fast animation duration in milliseconds
const int kFastAnimationDuration = 100;

/// Slow animation duration in milliseconds
const int kSlowAnimationDuration = 300;

/// Default border width
const double kDefaultBorderWidth = 1;

/// Thick border width
const double kThickBorderWidth = 2;

/// Default icon size
const double kDefaultIconSize = 24;

/// Small icon size
const double kSmallIconSize = 16;

/// Large icon size
const double kLargeIconSize = 32;

/// Default minimum tap target size (following Material Design guidelines)
const double kMinTapTargetSize = 48;

/// Default elevation for components
const double kDefaultElevation = 2;

/// Medium elevation for components
const double kMediumElevation = 4;

/// High elevation for components
const double kHighElevation = 8;

/// Default opacity for disabled state
const double kDisabledOpacity = 0.38;

/// Default opacity for hover state
const double kHoverOpacity = 0.04;

/// Default opacity for pressed state
const double kPressedOpacity = 0.12;

/// Default opacity for focus state
const double kFocusOpacity = 0.12;

/// Z-index values for layering
class ZIndex {
  ZIndex._();

  static const int dropdown = 1000;
  static const int modal = 1300;
  static const int tooltip = 1500;
  static const int notification = 1600;
}

/// Default aspect ratios
class AspectRatios {
  AspectRatios._();

  static const double square = 1;
  static const double video = 16 / 9;
  static const double portrait = 3 / 4;
  static const double landscape = 4 / 3;
  static const double widescreen = 21 / 9;
}
