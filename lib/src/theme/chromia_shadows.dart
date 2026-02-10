import 'package:flutter/material.dart';

/// Shadow system for Chromia UI.
///
/// Provides consistent shadow and elevation values to create
/// visual hierarchy and depth in the interface.
class ChromiaShadows {
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

  /// Default shadow configuration for light mode
  factory ChromiaShadows.light() {
    const Color shadowColor = Color(0x1A000000);

    return const ChromiaShadows(
      none: [],
      xs: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 2,
          offset: Offset(0, 1),
        ),
      ],
      s: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
      m: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
      l: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 16,
          offset: Offset(0, 8),
        ),
      ],
      xl: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 24,
          offset: Offset(0, 12),
        ),
      ],
      xxl: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 32,
          offset: Offset(0, 16),
        ),
      ],
    );
  }

  /// Default shadow configuration for dark mode
  factory ChromiaShadows.dark() {
    const Color shadowColor = Color(0x33000000);

    return const ChromiaShadows(
      none: [],
      xs: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 2,
          offset: Offset(0, 1),
        ),
      ],
      s: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
      m: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
      l: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 16,
          offset: Offset(0, 8),
        ),
      ],
      xl: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 24,
          offset: Offset(0, 12),
        ),
      ],
      xxl: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 32,
          offset: Offset(0, 16),
        ),
      ],
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
