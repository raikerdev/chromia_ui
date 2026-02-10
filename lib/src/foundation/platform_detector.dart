import 'dart:io' show Platform;

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
    return Platform.isAndroid || Platform.isIOS;
  }

  /// Returns true if running on desktop platform (Windows, macOS, or Linux)
  static bool get isDesktop {
    if (kIsWeb) {
      return false;
    }
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  /// Returns true if running on Android
  static bool get isAndroid {
    if (kIsWeb) {
      return false;
    }
    return Platform.isAndroid;
  }

  /// Returns true if running on iOS
  static bool get isIOS {
    if (kIsWeb) {
      return false;
    }
    return Platform.isIOS;
  }

  /// Returns true if running on Windows
  static bool get isWindows {
    if (kIsWeb) {
      return false;
    }
    return Platform.isWindows;
  }

  /// Returns true if running on macOS
  static bool get isMacOS {
    if (kIsWeb) {
      return false;
    }
    return Platform.isMacOS;
  }

  /// Returns true if running on Linux
  static bool get isLinux {
    if (kIsWeb) {
      return false;
    }
    return Platform.isLinux;
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
  ///   android: 12.0,
  ///   iOS: 16.0,
  ///   windows: 20.0,
  ///   macOS: 18.0,
  ///   linux: 20.0,
  ///   web: 24.0,
  ///   orElse: 16.0,
  /// );
  /// ```
  static T when<T>({T? android, T? iOS, T? windows, T? macOS, T? linux, T? web, required T orElse}) {
    if (kIsWeb) {
      return web ?? orElse;
    }
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        return android ?? orElse;
      }
      if (Platform.isIOS) {
        return iOS ?? orElse;
      }
      if (Platform.isWindows) {
        return windows ?? orElse;
      }
      if (Platform.isMacOS) {
        return macOS ?? orElse;
      }
      if (Platform.isLinux) {
        return linux ?? orElse;
      }
    }
    return orElse;
  }

  /// Returns the platform name as a string.
  static String get platformName {
    if (kIsWeb) {
      return 'web';
    }
    if (Platform.isAndroid) {
      return 'android';
    }
    if (Platform.isIOS) {
      return 'iOS';
    }
    if (Platform.isWindows) {
      return 'windows';
    }
    if (Platform.isMacOS) {
      return 'macOS';
    }
    if (Platform.isLinux) {
      return 'linux';
    }
    return 'unknown';
  }
}
