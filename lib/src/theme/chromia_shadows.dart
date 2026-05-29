import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Shadow system for Chromia UI.
///
/// Provides consistent shadow and elevation values to create
/// visual hierarchy and depth in the interface.
class ChromiaShadows with Diagnosticable {
  const ChromiaShadows({
    required this.none,
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
    required this.xxl,
  });

  final List<BoxShadow> none;
  final List<BoxShadow> xs;
  final List<BoxShadow> s;
  final List<BoxShadow> m;
  final List<BoxShadow> l;
  final List<BoxShadow> xl;
  final List<BoxShadow> xxl;

  /// Default shadow configuration for light mode.
  ///
  /// Uses two-layer shadows: a directional shadow for depth and an ambient
  /// shadow for realistic light diffusion.
  factory ChromiaShadows.light() {
    // Directional shadow — gives depth and sense of lift
    const Color direct = Color(0x14000000); // ~8% black
    // Ambient shadow — simulates scattered light, no directional offset
    const Color ambient = Color(0x0A000000); // ~4% black

    return const ChromiaShadows(
      none: [],
      xs: [
        BoxShadow(color: direct, blurRadius: 2, offset: Offset(0, 1)),
        BoxShadow(color: ambient, blurRadius: 4),
      ],
      s: [
        BoxShadow(color: direct, blurRadius: 4, offset: Offset(0, 2)),
        BoxShadow(color: ambient, blurRadius: 8),
      ],
      m: [
        BoxShadow(color: direct, blurRadius: 8, offset: Offset(0, 4)),
        BoxShadow(color: ambient, blurRadius: 16),
      ],
      l: [
        BoxShadow(color: Color(0x18000000), blurRadius: 16, offset: Offset(0, 8)),
        BoxShadow(color: Color(0x0C000000), blurRadius: 24),
      ],
      xl: [
        BoxShadow(color: Color(0x18000000), blurRadius: 24, offset: Offset(0, 12)),
        BoxShadow(color: Color(0x0C000000), blurRadius: 40),
      ],
      xxl: [
        BoxShadow(color: Color(0x1E000000), blurRadius: 32, offset: Offset(0, 16)),
        BoxShadow(color: Color(0x10000000), blurRadius: 48),
      ],
    );
  }

  /// Default shadow configuration for dark mode.
  ///
  /// Stronger alpha values because dark surfaces need more contrast to
  /// distinguish elevation levels.
  factory ChromiaShadows.dark() {
    const Color direct = Color(0x29000000); // ~16% black
    const Color ambient = Color(0x1A000000); // ~10% black

    return const ChromiaShadows(
      none: [],
      xs: [
        BoxShadow(color: direct, blurRadius: 2, offset: Offset(0, 1)),
        BoxShadow(color: ambient, blurRadius: 4),
      ],
      s: [
        BoxShadow(color: direct, blurRadius: 4, offset: Offset(0, 2)),
        BoxShadow(color: ambient, blurRadius: 8),
      ],
      m: [
        BoxShadow(color: direct, blurRadius: 8, offset: Offset(0, 4)),
        BoxShadow(color: ambient, blurRadius: 16),
      ],
      l: [
        BoxShadow(color: Color(0x33000000), blurRadius: 16, offset: Offset(0, 8)),
        BoxShadow(color: Color(0x1F000000), blurRadius: 24),
      ],
      xl: [
        BoxShadow(color: Color(0x33000000), blurRadius: 24, offset: Offset(0, 12)),
        BoxShadow(color: Color(0x1F000000), blurRadius: 40),
      ],
      xxl: [
        BoxShadow(color: Color(0x3D000000), blurRadius: 32, offset: Offset(0, 16)),
        BoxShadow(color: Color(0x29000000), blurRadius: 48),
      ],
    );
  }

  // ── lerp ──────────────────────────────────────────────────────────────────

  /// Linearly interpolates between two [ChromiaShadows] instances.
  ///
  /// Each shadow list is lerped with [BoxShadow.lerpList].
  static ChromiaShadows lerp(ChromiaShadows a, ChromiaShadows b, double t) {
    return ChromiaShadows(
      none: BoxShadow.lerpList(a.none, b.none, t) ?? const [],
      xs: BoxShadow.lerpList(a.xs, b.xs, t) ?? const [],
      s: BoxShadow.lerpList(a.s, b.s, t) ?? const [],
      m: BoxShadow.lerpList(a.m, b.m, t) ?? const [],
      l: BoxShadow.lerpList(a.l, b.l, t) ?? const [],
      xl: BoxShadow.lerpList(a.xl, b.xl, t) ?? const [],
      xxl: BoxShadow.lerpList(a.xxl, b.xxl, t) ?? const [],
    );
  }

  /// Creates a copy of this shadow with the given fields replaced
  ChromiaShadows copyWith({
    List<BoxShadow>? none,
    List<BoxShadow>? xs,
    List<BoxShadow>? s,
    List<BoxShadow>? m,
    List<BoxShadow>? l,
    List<BoxShadow>? xl,
    List<BoxShadow>? xxl,
  }) {
    return ChromiaShadows(
      none: none ?? this.none,
      xs: xs ?? this.xs,
      s: s ?? this.s,
      m: m ?? this.m,
      l: l ?? this.l,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  // ── debugFillProperties ───────────────────────────────────────────────────

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<List<BoxShadow>>('none', none))
      ..add(DiagnosticsProperty<List<BoxShadow>>('xs', xs))
      ..add(DiagnosticsProperty<List<BoxShadow>>('s', s))
      ..add(DiagnosticsProperty<List<BoxShadow>>('m', m))
      ..add(DiagnosticsProperty<List<BoxShadow>>('l', l))
      ..add(DiagnosticsProperty<List<BoxShadow>>('xl', xl))
      ..add(DiagnosticsProperty<List<BoxShadow>>('xxl', xxl));
  }
}

/// Elevation system for Material Design elevation values.
class ChromiaElevation {
  ChromiaElevation._();

  /// No elevation
  static const double level0 = 0.0;

  /// Level 1 elevation (1dp)
  static const double level1 = 1.0;

  /// Level 2 elevation (2dp)
  static const double level2 = 2.0;

  /// Level 3 elevation (3dp)
  static const double level3 = 3.0;

  /// Level 4 elevation (4dp)
  static const double level4 = 4.0;

  /// Level 5 elevation (6dp)
  static const double level5 = 6.0;

  /// Level 6 elevation (8dp)
  static const double level6 = 8.0;

  /// Level 7 elevation (12dp)
  static const double level7 = 12.0;

  /// Level 8 elevation (16dp)
  static const double level8 = 16.0;

  /// Level 9 elevation (24dp)
  static const double level9 = 24.0;

  /// Returns elevation value for a given level (0-9)
  static double forLevel(int level) {
    assert(level >= 0 && level <= 9, 'Level must be between 0 and 9');
    return switch (level) {
      0 => level0,
      1 => level1,
      2 => level2,
      3 => level3,
      4 => level4,
      5 => level5,
      6 => level6,
      7 => level7,
      8 => level8,
      9 => level9,
      _ => level0,
    };
  }
}
