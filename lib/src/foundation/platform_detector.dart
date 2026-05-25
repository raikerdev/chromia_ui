import 'package:chromia_ui/src/foundation/_platform_io.dart'
    if (dart.library.html) 'package:chromia_ui/src/foundation/_platform_web.dart'
    as platform;
import 'package:flutter/foundation.dart' show kIsWeb;

/// Detects the current platform and provides utilities for platform-specific logic.
///
/// This class helps components adapt their behavior and appearance based on
/// whether the app is running on mobile, desktop, or web.
class PlatformDetector {
  PlatformDetector._();

  /// Returns true if running on web platform
  static bool get isWeb => kIsWeb;

  /// Returns true if running on mobile platform (iOS or Android)
  static bool get isMobile {
    if (kIsWeb) {
      return false;
    }
    return platform.isAndroid || platform.isIOS;
  }

  /// Returns true if running on desktop platform (Windows, macOS, or Linux)
  static bool get isDesktop {
    if (kIsWeb) {
      return false;
    }
    return platform.isWindows || platform.isMacOS || platform.isLinux;
  }

  /// Returns true if running on Android
  static bool get isAndroid {
    if (kIsWeb) {
      return false;
    }
    return platform.isAndroid;
  }

  /// Returns true if running on iOS
  static bool get isIOS {
    if (kIsWeb) {
      return false;
    }
    return platform.isIOS;
  }

  /// Returns true if running on Windows
  static bool get isWindows {
    if (kIsWeb) {
      return false;
    }
    return platform.isWindows;
  }

  /// Returns true if running on macOS
  static bool get isMacOS {
    if (kIsWeb) {
      return false;
    }
    return platform.isMacOS;
  }

  /// Returns true if running on Linux
  static bool get isLinux {
    if (kIsWeb) {
      return false;
    }
    return platform.isLinux;
  }

  /// Returns true if running on Apple platform (iOS or macOS)
  static bool get isApple => isIOS || isMacOS;

  /// Returns a platform-specific value.
  ///
  /// Example:
  /// ```dart
  /// final padding = PlatformDetector.select(
  ///   mobile: 16.0,
  ///   desktop: 24.0,
  ///   web: 32.0,
  /// );
  /// ```
  static T select<T>({required T mobile, T? desktop, T? web}) {
    if (isWeb) {
      return web ?? mobile;
    }
    if (isDesktop) {
      return desktop ?? mobile;
    }
    return mobile;
  }

  /// Returns a platform-specific value with more granular control.
  ///
  /// Example:
  /// ```dart
  /// final spacing = PlatformDetector.when(
  ///   orElse: 16.0,
  ///   android: 12.0,
  ///   iOS: 16.0,
  ///   windows: 20.0,
  ///   macOS: 18.0,
  ///   linux: 20.0,
  ///   web: 24.0,
  /// );
  /// ```
  static T when<T>({
    required T orElse,
    T? android,
    T? iOS,
    T? windows,
    T? macOS,
    T? linux,
    T? web,
  }) {
    if (kIsWeb) {
      return web ?? orElse;
    }
    if (platform.isAndroid) {
      return android ?? orElse;
    }
    if (platform.isIOS) {
      return iOS ?? orElse;
    }
    if (platform.isWindows) {
      return windows ?? orElse;
    }
    if (platform.isMacOS) {
      return macOS ?? orElse;
    }
    if (platform.isLinux) {
      return linux ?? orElse;
    }
    return orElse;
  }

  /// Returns the platform name as a string.
  static String get platformName {
    if (kIsWeb) {
      return 'web';
    }
    if (platform.isAndroid) {
      return 'android';
    }
    if (platform.isIOS) {
      return 'iOS';
    }
    if (platform.isWindows) {
      return 'windows';
    }
    if (platform.isMacOS) {
      return 'macOS';
    }
    if (platform.isLinux) {
      return 'linux';
    }
    return 'unknown';
  }
}
