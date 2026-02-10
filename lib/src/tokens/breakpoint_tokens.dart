import 'package:flutter/widgets.dart';

/// Breakpoint tokens for responsive design.
///
/// These breakpoints follow common device sizes and help create
/// layouts that adapt to different screen sizes.
class BreakpointTokens {
  BreakpointTokens._();

  /// Mobile breakpoint (0-599px)
  static const double mobile = 600;

  /// Tablet breakpoint (600-1023px)
  static const double tablet = 1024;

  /// Desktop breakpoint (1024-1439px)
  static const double desktop = 1440;

  /// Large desktop breakpoint (1440px+)
  static const double desktopLarge = 1920;

  /// Returns the current breakpoint based on screen width.
  static Breakpoint fromWidth(double width) {
    if (width < mobile) {
      return Breakpoint.mobile;
    } else if (width < tablet) {
      return Breakpoint.tablet;
    } else if (width < desktop) {
      return Breakpoint.desktop;
    } else {
      return Breakpoint.desktopLarge;
    }
  }

  /// Returns the current breakpoint from BuildContext.
  static Breakpoint fromContext(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return fromWidth(width);
  }
}

/// Enum representing different breakpoint sizes.
enum Breakpoint {
  /// Mobile devices (0-599px)
  mobile,

  /// Tablet devices (600-1023px)
  tablet,

  /// Desktop devices (1024-1439px)
  desktop,

  /// Large desktop devices (1440px+)
  desktopLarge;

  /// Returns true if this breakpoint is mobile.
  bool get isMobile => this == Breakpoint.mobile;

  /// Returns true if this breakpoint is tablet.
  bool get isTablet => this == Breakpoint.tablet;

  /// Returns true if this breakpoint is desktop.
  bool get isDesktop => this == Breakpoint.desktop;

  /// Returns true if this breakpoint is large desktop.
  bool get isDesktopLarge => this == Breakpoint.desktopLarge;

  /// Returns true if this breakpoint is mobile or tablet.
  bool get isMobileOrTablet => isMobile || isTablet;

  /// Returns true if this breakpoint is desktop or large desktop.
  bool get isDesktopOrLarger => isDesktop || isDesktopLarge;
}

/// Extension on BuildContext for easy breakpoint access.
extension BreakpointExtension on BuildContext {
  /// Returns the current breakpoint.
  Breakpoint get breakpoint => BreakpointTokens.fromContext(this);

  /// Returns true if the current breakpoint is mobile.
  bool get isMobile => breakpoint.isMobile;

  /// Returns true if the current breakpoint is tablet.
  bool get isTablet => breakpoint.isTablet;

  /// Returns true if the current breakpoint is desktop.
  bool get isDesktop => breakpoint.isDesktop;

  /// Returns true if the current breakpoint is large desktop.
  bool get isDesktopLarge => breakpoint.isDesktopLarge;

  /// Returns true if the current breakpoint is mobile or tablet.
  bool get isMobileOrTablet => breakpoint.isMobileOrTablet;

  /// Returns true if the current breakpoint is desktop or larger.
  bool get isDesktopOrLarger => breakpoint.isDesktopOrLarger;
}

/// Helper widget to build different layouts based on breakpoint.
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({required this.mobile, this.tablet, this.desktop, this.desktopLarge, super.key});

  /// Widget to display on mobile breakpoint.
  final Widget mobile;

  /// Widget to display on tablet breakpoint.
  /// Falls back to mobile if not provided.
  final Widget? tablet;

  /// Widget to display on desktop breakpoint.
  /// Falls back to tablet or mobile if not provided.
  final Widget? desktop;

  /// Widget to display on large desktop breakpoint.
  /// Falls back to desktop, tablet, or mobile if not provided.
  final Widget? desktopLarge;

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    return switch (breakpoint) {
      Breakpoint.mobile => mobile,
      Breakpoint.tablet => tablet ?? mobile,
      Breakpoint.desktop => desktop ?? tablet ?? mobile,
      Breakpoint.desktopLarge => desktopLarge ?? desktop ?? tablet ?? mobile,
    };
  }
}
