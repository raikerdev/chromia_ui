import 'package:chromia_ui/src/tokens/spacing_tokens.dart';
import 'package:flutter/widgets.dart';

/// Semantic spacing system for Chromia UI.
///
/// Provides consistent spacing values for padding, margins, and gaps
/// throughout the application.
class ChromiaSpacing {
  const ChromiaSpacing({
    required this.none,
    required this.xxs,
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
    required this.xxl,
    required this.xxxl,
    required this.huge,
    required this.xhuge,
    required this.xxhuge,
    required this.massive,
  });

  final double none;
  final double xxs;
  final double xs;
  final double s;
  final double m;
  final double l;
  final double xl;
  final double xxl;
  final double xxxl;
  final double huge;
  final double xhuge;
  final double xxhuge;
  final double massive;

  /// Default spacing configuration
  factory ChromiaSpacing.defaultSpacing() {
    return const ChromiaSpacing(
      none: SpacingTokens.none,
      xxs: SpacingTokens.xxs,
      xs: SpacingTokens.xs,
      s: SpacingTokens.s,
      m: SpacingTokens.m,
      l: SpacingTokens.l,
      xl: SpacingTokens.xl,
      xxl: SpacingTokens.xxl,
      xxxl: SpacingTokens.xxxl,
      huge: SpacingTokens.huge,
      xhuge: SpacingTokens.xhuge,
      xxhuge: SpacingTokens.xxhuge,
      massive: SpacingTokens.massive,
    );
  }

  /// Returns EdgeInsets with all sides set to the same value
  EdgeInsets all(double value) => EdgeInsets.all(value);

  /// Returns EdgeInsets with horizontal spacing
  EdgeInsets horizontal(double value) => EdgeInsets.symmetric(
    horizontal: value,
  );

  /// Returns EdgeInsets with vertical spacing
  EdgeInsets vertical(double value) => EdgeInsets.symmetric(vertical: value);

  /// Returns EdgeInsets with symmetric spacing
  EdgeInsets symmetric({
    double? horizontal,
    double? vertical,
  }) => EdgeInsets.symmetric(
    horizontal: horizontal ?? none,
    vertical: vertical ?? none,
  );

  /// Returns EdgeInsets with custom spacing for each side
  EdgeInsets only({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) => EdgeInsets.only(
    left: left ?? none,
    top: top ?? none,
    right: right ?? none,
    bottom: bottom ?? none,
  );

  /// Predefined padding values

  /// No padding
  EdgeInsets get paddingNone => all(none);

  /// Extra extra small padding (2px)
  EdgeInsets get paddingXXS => all(xxs);

  /// Extra small padding (4px)
  EdgeInsets get paddingXS => all(xs);

  /// Small padding (8px)
  EdgeInsets get paddingS => all(s);

  /// Medium padding (12px)
  EdgeInsets get paddingM => all(m);

  /// Large padding (16px)
  EdgeInsets get paddingL => all(l);

  /// Extra large padding (20px)
  EdgeInsets get paddingXL => all(xl);

  /// Extra extra large padding (24px)
  EdgeInsets get paddingXXL => all(xxl);

  /// Extra extra extra large padding (32px)
  EdgeInsets get paddingXXXL => all(xxxl);

  /// Horizontal padding values

  /// Extra small horizontal padding
  EdgeInsets get horizontalXS => horizontal(xs);

  /// Small horizontal padding
  EdgeInsets get horizontalS => horizontal(s);

  /// Medium horizontal padding
  EdgeInsets get horizontalM => horizontal(m);

  /// Large horizontal padding
  EdgeInsets get horizontalL => horizontal(l);

  /// Extra large horizontal padding
  EdgeInsets get horizontalXL => horizontal(xl);

  /// Extra extra large horizontal padding
  EdgeInsets get horizontalXXL => horizontal(xxl);

  /// Vertical padding values

  /// Extra small vertical padding
  EdgeInsets get verticalXS => vertical(xs);

  /// Small vertical padding
  EdgeInsets get verticalS => vertical(s);

  /// Medium vertical padding
  EdgeInsets get verticalM => vertical(m);

  /// Large vertical padding
  EdgeInsets get verticalL => vertical(l);

  /// Extra large vertical padding
  EdgeInsets get verticalXL => vertical(xl);

  /// Extra extra large vertical padding
  EdgeInsets get verticalXXL => vertical(xxl);

  /// SizedBox gap helpers

  /// Returns a horizontal gap SizedBox
  SizedBox gapH(double width) => SizedBox(width: width);

  /// Returns a vertical gap SizedBox
  SizedBox gapV(double height) => SizedBox(height: height);

  /// Extra small horizontal gap
  SizedBox get gapHXS => gapH(xs);

  /// Small horizontal gap
  SizedBox get gapHS => gapH(s);

  /// Medium horizontal gap
  SizedBox get gapHM => gapH(m);

  /// Large horizontal gap
  SizedBox get gapHL => gapH(l);

  /// Extra large horizontal gap
  SizedBox get gapHXL => gapH(xl);

  /// Extra extra large horizontal gap
  SizedBox get gapHXXL => gapH(xxl);

  /// Extra small vertical gap
  SizedBox get gapVXS => gapV(xs);

  /// Small vertical gap
  SizedBox get gapVS => gapV(s);

  /// Medium vertical gap
  SizedBox get gapVM => gapV(m);

  /// Large vertical gap
  SizedBox get gapVL => gapV(l);

  /// Extra large vertical gap
  SizedBox get gapVXL => gapV(xl);

  /// Extra extra large vertical gap
  SizedBox get gapVXXL => gapV(xxl);

  /// Creates a copy of this spacing with the given fields replaced
  ChromiaSpacing copyWith({
    double? none,
    double? xxs,
    double? xs,
    double? s,
    double? m,
    double? l,
    double? xl,
    double? xxl,
    double? xxxl,
    double? huge,
    double? xhuge,
    double? xxhuge,
    double? massive,
  }) {
    return ChromiaSpacing(
      none: none ?? this.none,
      xxs: xxs ?? this.xxs,
      xs: xs ?? this.xs,
      s: s ?? this.s,
      m: m ?? this.m,
      l: l ?? this.l,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      xxxl: xxxl ?? this.xxxl,
      huge: huge ?? this.huge,
      xhuge: xhuge ?? this.xhuge,
      xxhuge: xxhuge ?? this.xxhuge,
      massive: massive ?? this.massive,
    );
  }
}
