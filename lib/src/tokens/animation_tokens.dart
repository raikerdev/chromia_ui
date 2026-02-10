import 'package:flutter/animation.dart';

/// Animation tokens for consistent motion design.
///
/// Provides standardized durations and curves for animations
/// to maintain a cohesive feel across all components.
class AnimationTokens {
  AnimationTokens._();

  // Duration tokens
  /// Instant duration (0ms) - No animation
  static const Duration instant = Duration.zero;

  /// Fastest duration (50ms) - Micro-interactions
  static const Duration fastest = Duration(milliseconds: 50);

  /// Faster duration (100ms) - Quick transitions
  static const Duration faster = Duration(milliseconds: 100);

  /// Fast duration (150ms) - Snappy animations
  static const Duration fast = Duration(milliseconds: 150);

  /// Normal duration (200ms) - Default animations
  static const Duration normal = Duration(milliseconds: 200);

  /// Moderate duration (250ms) - Moderate animations
  static const Duration moderate = Duration(milliseconds: 250);

  /// Slow duration (300ms) - Deliberate animations
  static const Duration slow = Duration(milliseconds: 300);

  /// Slower duration (400ms) - Emphasis animations
  static const Duration slower = Duration(milliseconds: 400);

  /// Slowest duration (500ms) - Maximum emphasis
  static const Duration slowest = Duration(milliseconds: 500);

  // Curve tokens - Standard curves
  /// Linear curve - No easing
  static const Curve linear = Curves.linear;

  /// Ease curve - Gentle acceleration and deceleration
  static const Curve ease = Curves.ease;

  /// Ease in curve - Starts slowly
  static const Curve easeIn = Curves.easeIn;

  /// Ease out curve - Ends slowly
  static const Curve easeOut = Curves.easeOut;

  /// Ease in-out curve - Starts and ends slowly
  static const Curve easeInOut = Curves.easeInOut;

  // Curve tokens - Material Design curves
  /// Standard curve - Material Design standard easing
  static const Curve standard = Curves.easeInOutCubicEmphasized;

  /// Emphasized curve - Material Design emphasized easing
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;

  /// Decelerated curve - Material Design decelerate easing
  static const Curve decelerated = Curves.decelerate;

  // Curve tokens - Elastic and bounce
  /// Elastic in curve - Elastic effect at start
  static const Curve elasticIn = Curves.elasticIn;

  /// Elastic out curve - Elastic effect at end
  static const Curve elasticOut = Curves.elasticOut;

  /// Elastic in-out curve - Elastic effect at start and end
  static const Curve elasticInOut = Curves.elasticInOut;

  /// Bounce in curve - Bounce effect at start
  static const Curve bounceIn = Curves.bounceIn;

  /// Bounce out curve - Bounce effect at end
  static const Curve bounceOut = Curves.bounceOut;

  /// Bounce in-out curve - Bounce effect at start and end
  static const Curve bounceInOut = Curves.bounceInOut;

  /// Returns a standard fade in animation configuration
  static AnimationConfig get fadeIn => const AnimationConfig(duration: normal, curve: easeOut);

  /// Returns a standard fade out animation configuration
  static AnimationConfig get fadeOut => const AnimationConfig(duration: normal, curve: easeIn);

  /// Returns a standard scale animation configuration
  static AnimationConfig get scale => const AnimationConfig(duration: fast, curve: emphasized);

  /// Returns a standard slide animation configuration
  static AnimationConfig get slide => const AnimationConfig(duration: normal, curve: standard);

  /// Returns a standard expand animation configuration
  static AnimationConfig get expand => const AnimationConfig(duration: slow, curve: decelerated);
}

/// Configuration for an animation.
class AnimationConfig {
  const AnimationConfig({required this.duration, required this.curve});

  /// The duration of the animation.
  final Duration duration;

  /// The curve of the animation.
  final Curve curve;

  /// Creates a copy of this config with the given fields replaced.
  AnimationConfig copyWith({Duration? duration, Curve? curve}) =>
      AnimationConfig(duration: duration ?? this.duration, curve: curve ?? this.curve);
}
