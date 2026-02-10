/// Spacing tokens following a 4px grid system.
///
/// All spacing values are multiples of 4 to ensure visual consistency
/// and alignment across the entire design system.
///
/// Usage:
/// ```dart
/// Padding(
///   padding: EdgeInsets.all(SpacingTokens.m),
///   child: Text('Hello'),
/// )
/// ```
class SpacingTokens {
  SpacingTokens._();

  /// No spacing (0px)
  static const double none = 0;

  /// Extra extra small spacing (2px)
  static const double xxs = 2;

  /// Extra small spacing (4px)
  static const double xs = 4;

  /// Small spacing (8px)
  static const double s = 8;

  /// Medium spacing (12px)
  static const double m = 12;

  /// Large spacing (16px)
  static const double l = 16;

  /// Extra large spacing (20px)
  static const double xl = 20;

  /// Extra extra large spacing (24px)
  static const double xxl = 24;

  /// Extra extra extra large spacing (32px)
  static const double xxxl = 32;

  /// Huge spacing (40px)
  static const double huge = 40;

  /// Extra huge spacing (48px)
  static const double xhuge = 48;

  /// Extra extra huge spacing (64px)
  static const double xxhuge = 64;

  /// Massive spacing (80px)
  static const double massive = 80;

  /// Returns all spacing values as a map.
  static Map<String, double> get all => {
    'none': none,
    'xxs': xxs,
    'xs': xs,
    's': s,
    'm': m,
    'l': l,
    'xl': xl,
    'xxl': xxl,
    'xxxl': xxxl,
    'huge': huge,
    'xhuge': xhuge,
    'xxhuge': xxhuge,
    'massive': massive,
  };
}

/// Inset spacing tokens for padding within components.
class InsetTokens {
  InsetTokens._();

  /// Extra small inset (4px on all sides)
  static const double xs = SpacingTokens.xs;

  /// Small inset (8px on all sides)
  static const double s = SpacingTokens.s;

  /// Medium inset (12px on all sides)
  static const double m = SpacingTokens.m;

  /// Large inset (16px on all sides)
  static const double l = SpacingTokens.l;

  /// Extra large inset (24px on all sides)
  static const double xl = SpacingTokens.xxl;

  /// Extra extra large inset (32px on all sides)
  static const double xxl = SpacingTokens.xxxl;
}

/// Stack spacing tokens for vertical spacing between stacked elements.
class StackTokens {
  StackTokens._();

  /// Extra small stack spacing (4px)
  static const double xs = SpacingTokens.xs;

  /// Small stack spacing (8px)
  static const double s = SpacingTokens.s;

  /// Medium stack spacing (12px)
  static const double m = SpacingTokens.m;

  /// Large stack spacing (16px)
  static const double l = SpacingTokens.l;

  /// Extra large stack spacing (20px)
  static const double xl = SpacingTokens.xl;

  /// Extra extra large stack spacing (24px)
  static const double xxl = SpacingTokens.xxl;

  /// Extra extra extra large stack spacing (32px)
  static const double xxxl = SpacingTokens.xxxl;
}

/// Inline spacing tokens for horizontal spacing between inline elements.
class InlineTokens {
  InlineTokens._();

  /// Extra small inline spacing (4px)
  static const double xs = SpacingTokens.xs;

  /// Small inline spacing (8px)
  static const double s = SpacingTokens.s;

  /// Medium inline spacing (12px)
  static const double m = SpacingTokens.m;

  /// Large inline spacing (16px)
  static const double l = SpacingTokens.l;

  /// Extra large inline spacing (20px)
  static const double xl = SpacingTokens.xl;

  /// Extra extra large inline spacing (24px)
  static const double xxl = SpacingTokens.xxl;
}
