import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A customizable avatar component for displaying user images or initials.
///
/// Example usage:
/// ```dart
/// ChromiaAvatar(
///   imageUrl: 'https://example.com/avatar.jpg',
///   size: ChromiaAvatarSize.large,
/// )
///
/// ChromiaAvatar.initials(
///   initials: 'JD',
///   backgroundColor: Colors.blue,
/// )
/// ```
class ChromiaAvatar extends StatelessWidget {
  const ChromiaAvatar({
    this.child,
    this.imageProvider,
    this.backgroundColor,
    this.foregroundColor,
    this.size = ChromiaAvatarSize.medium,
    this.shape = ChromiaAvatarShape.circle,
    this.border,
    this.onTap,
    super.key,
  });

  /// Custom child widget (overrides image)
  final Widget? child;

  /// Image provider (overrides child)
  final ImageProvider? imageProvider;

  /// Background color (visible when no image)
  final Color? backgroundColor;

  /// Foreground color (for text/icons)
  final Color? foregroundColor;

  /// Size of the avatar
  final ChromiaAvatarSize size;

  /// Shape of the avatar
  final ChromiaAvatarShape shape;

  /// Border decoration
  final BoxBorder? border;

  /// Callback when tapped
  final VoidCallback? onTap;

  /// Creates an avatar with initials
  factory ChromiaAvatar.initials({
    required String initials,
    Color? backgroundColor,
    Color? foregroundColor,
    ChromiaAvatarSize size = ChromiaAvatarSize.medium,
    ChromiaAvatarShape shape = ChromiaAvatarShape.circle,
    BoxBorder? border,
    VoidCallback? onTap,
  }) {
    assert(initials.length <= 3, 'Initials must be 3 characters or less');
    return ChromiaAvatar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      size: size,
      shape: shape,
      border: border,
      onTap: onTap,
      child: ChromiaText(
        initials.toUpperCase(),
        type: ChromiaTypographyType.bodyMedium,
        style: TextStyle(
          fontSize: size.fontSize,
          fontWeight: FontWeight.w600,
          height: 1.1,
        ),
      ),
    );
  }

  /// Creates an avatar with an icon
  factory ChromiaAvatar.icon({
    required IconData icon,
    Color? backgroundColor,
    Color? iconColor,
    ChromiaAvatarSize size = ChromiaAvatarSize.medium,
    ChromiaAvatarShape shape = ChromiaAvatarShape.circle,
    BoxBorder? border,
    VoidCallback? onTap,
  }) {
    return ChromiaAvatar(
      backgroundColor: backgroundColor,
      foregroundColor: iconColor,
      size: size,
      shape: shape,
      border: border,
      onTap: onTap,
      child: Icon(
        icon,
        size: size.iconSize,
      ),
    );
  }

  factory ChromiaAvatar.image({
    required ImageProvider imageProvider,
    Color? backgroundColor,
    ChromiaAvatarSize size = ChromiaAvatarSize.medium,
    ChromiaAvatarShape shape = ChromiaAvatarShape.circle,
    BoxBorder? border,
    VoidCallback? onTap,
  }) {
    return ChromiaAvatar(
      backgroundColor: backgroundColor,
      size: size,
      shape: shape,
      border: border,
      onTap: onTap,
      imageProvider: imageProvider,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final radius = context.chromiaRadius;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.primary;
    final Color effectiveForegroundColor = foregroundColor ?? colors.surface;

    final BorderRadius? borderRadius = switch (shape) {
      ChromiaAvatarShape.rounded => radius.radiusM,
      ChromiaAvatarShape.square => radius.radiusNone,
      ChromiaAvatarShape.circle => null,
    };

    final avatar = Container(
      width: size.value,
      height: size.value,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: borderRadius,
        shape: shape == ChromiaAvatarShape.circle ? BoxShape.circle : BoxShape.rectangle,
        border: border,
        image: imageProvider != null
            ? DecorationImage(
                image: imageProvider!,
                fit: BoxFit.cover,
              )
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: ChromiaInteractiveWidget(
        onPressed: onTap,
        child: child != null
            ? Center(
                child: DefaultTextStyle(
                  style: TextStyle(color: effectiveForegroundColor),
                  child: IconTheme(
                    data: IconThemeData(color: effectiveForegroundColor),
                    child: child!,
                  ),
                ),
              )
            : null,
      ),
    );

    return avatar;
  }
}

/// Shape options for avatars
enum ChromiaAvatarShape {
  /// Circular avatar
  circle,

  /// Rounded square avatar
  rounded,

  /// Square avatar
  square,
}

/// Size options for avatars
enum ChromiaAvatarSize {
  /// Extra small (24px)
  extraSmall(value: 24, fontSize: 10, iconSize: 12),

  /// Small (32px)
  small(value: 32, fontSize: 12, iconSize: 16),

  /// Medium (40px, default)
  medium(value: 40, fontSize: 14, iconSize: 20),

  /// Large (56px)
  large(value: 56, fontSize: 18, iconSize: 28),

  /// Extra large (72px)
  extraLarge(value: 72, fontSize: 24, iconSize: 36)
  ;

  const ChromiaAvatarSize({
    required this.value,
    required this.fontSize,
    required this.iconSize,
  });

  /// Radius of the avatar
  final double value;

  /// Font size for text
  final double fontSize;

  /// Icon size
  final double iconSize;
}
