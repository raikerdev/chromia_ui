import 'package:flutter/widgets.dart';

/// Border radius system for Chromia UI.
///
/// Provides consistent border radius values for creating
/// rounded corners on components.
class ChromiaRadius {
  const ChromiaRadius({
    required this.none,
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
    required this.xxl,
    required this.full,
  });

  final double none;
  final double xs;
  final double s;
  final double m;
  final double l;
  final double xl;
  final double xxl;
  final double full;

  /// Default radius configuration
  factory ChromiaRadius.defaultRadius() {
    return const ChromiaRadius(
      none: 0.0,
      xs: 2.0,
      s: 4.0,
      m: 8.0,
      l: 12.0,
      xl: 16.0,
      xxl: 24.0,
      full: 9999.0,
    );
  }

  /// Returns a circular BorderRadius
  BorderRadius circular(double radius) => BorderRadius.circular(radius);

  /// Returns a BorderRadius with different values for each corner
  BorderRadius only({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) => BorderRadius.only(
    topLeft: Radius.circular(topLeft ?? none),
    topRight: Radius.circular(topRight ?? none),
    bottomLeft: Radius.circular(bottomLeft ?? none),
    bottomRight: Radius.circular(bottomRight ?? none),
  );

  /// Returns a BorderRadius for top corners only
  BorderRadius top(double radius) => BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  /// Returns a BorderRadius for bottom corners only
  BorderRadius bottom(double radius) => BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  /// Returns a BorderRadius for left corners only
  BorderRadius left(double radius) => BorderRadius.only(
    topLeft: Radius.circular(radius),
    bottomLeft: Radius.circular(radius),
  );

  /// Returns a BorderRadius for right corners only
  BorderRadius right(double radius) => BorderRadius.only(
    topRight: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  /// Predefined border radius values

  /// No border radius (sharp corners)
  BorderRadius get radiusNone => circular(none);

  /// Extra small border radius (2px)
  BorderRadius get radiusXS => circular(xs);

  /// Small border radius (4px)
  BorderRadius get radiusS => circular(s);

  /// Medium border radius (8px)
  BorderRadius get radiusM => circular(m);

  /// Large border radius (12px)
  BorderRadius get radiusL => circular(l);

  /// Extra large border radius (16px)
  BorderRadius get radiusXL => circular(xl);

  /// Extra extra large border radius (24px)
  BorderRadius get radiusXXL => circular(xxl);

  /// Full border radius (pill shape)
  BorderRadius get radiusFull => circular(full);

  /// Predefined top border radius values

  /// Small top border radius
  BorderRadius get topS => top(s);

  /// Medium top border radius
  BorderRadius get topM => top(m);

  /// Large top border radius
  BorderRadius get topL => top(l);

  /// Extra large top border radius
  BorderRadius get topXL => top(xl);

  /// Predefined bottom border radius values

  /// Small bottom border radius
  BorderRadius get bottomS => bottom(s);

  /// Medium bottom border radius
  BorderRadius get bottomM => bottom(m);

  /// Large bottom border radius
  BorderRadius get bottomL => bottom(l);

  /// Extra large bottom border radius
  BorderRadius get bottomXL => bottom(xl);

  /// Creates a RoundedRectangleBorder with the specified radius
  RoundedRectangleBorder shape(double radius) => RoundedRectangleBorder(
    borderRadius: circular(radius),
  );

  /// Predefined shapes

  /// No border radius shape
  RoundedRectangleBorder get shapeNone => shape(none);

  /// Extra small shape
  RoundedRectangleBorder get shapeXS => shape(xs);

  /// Small shape
  RoundedRectangleBorder get shapeS => shape(s);

  /// Medium shape
  RoundedRectangleBorder get shapeM => shape(m);

  /// Large shape
  RoundedRectangleBorder get shapeL => shape(l);

  /// Extra large shape
  RoundedRectangleBorder get shapeXL => shape(xl);

  /// Extra extra large shape
  RoundedRectangleBorder get shapeXXL => shape(xxl);

  /// Full shape (pill)
  RoundedRectangleBorder get shapeFull => shape(full);

  /// Creates a copy of this radius with the given fields replaced
  ChromiaRadius copyWith({
    double? none,
    double? xs,
    double? s,
    double? m,
    double? l,
    double? xl,
    double? xxl,
    double? full,
  }) {
    return ChromiaRadius(
      none: none ?? this.none,
      xs: xs ?? this.xs,
      s: s ?? this.s,
      m: m ?? this.m,
      l: l ?? this.l,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      full: full ?? this.full,
    );
  }
}
