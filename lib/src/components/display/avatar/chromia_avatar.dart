import 'package:chromia_ui/src/theme/chromia_theme.dart';
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
    this.imageUrl,
    this.imageProvider,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.size = ChromiaAvatarSize.medium,
    this.shape = ChromiaAvatarShape.circle,
    this.border,
    this.onTap,
    super.key,
  });

  /// URL of the avatar image
  final String? imageUrl;

  /// Image provider for the avatar
  final ImageProvider? imageProvider;

  /// Custom child widget (overrides image)
  final Widget? child;

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
    return ChromiaAvatar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      size: size,
      shape: shape,
      border: border,
      onTap: onTap,
      child: Text(
        initials.toUpperCase(),
        style: TextStyle(
          color: foregroundColor ?? Colors.white,
          fontSize: size.fontSize,
          fontWeight: FontWeight.w600,
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
        color: iconColor ?? Colors.white,
        size: size.iconSize,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    final Color effectiveBackgroundColor = backgroundColor ?? colors.primary;
    final Color effectiveForegroundColor = foregroundColor ?? colors.onPrimary;

    ImageProvider? effectiveImageProvider = imageProvider;
    if (imageUrl != null) {
      effectiveImageProvider = NetworkImage(imageUrl!);
    }

    final BorderRadius? borderRadius = shape == ChromiaAvatarShape.rounded
        ? BorderRadius.circular(size.radius * 0.25)
        : shape == ChromiaAvatarShape.square
        ? BorderRadius.circular(4)
        : null;

    Widget avatar = Container(
      width: size.radius * 2,
      height: size.radius * 2,
      decoration: BoxDecoration(
        color: child != null && effectiveImageProvider == null ? effectiveBackgroundColor : null,
        borderRadius: borderRadius,
        shape: shape == ChromiaAvatarShape.circle ? BoxShape.circle : BoxShape.rectangle,
        border: border,
        image: effectiveImageProvider != null
            ? DecorationImage(
                image: effectiveImageProvider,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: child != null && effectiveImageProvider == null
          ? Center(
              child: DefaultTextStyle(
                style: TextStyle(color: effectiveForegroundColor),
                child: child!,
              ),
            )
          : null,
    );

    if (onTap != null) {
      avatar = MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: avatar,
        ),
      );
    }

    return avatar;
  }
}

/// A group of overlapping avatars.
class ChromiaAvatarGroup extends StatelessWidget {
  const ChromiaAvatarGroup({
    required this.avatars,
    this.max = 3,
    this.size = ChromiaAvatarSize.medium,
    this.spacing = 8,
    this.showMore = true,
    super.key,
  });

  /// List of avatars to display
  final List<ChromiaAvatar> avatars;

  /// Maximum number of avatars to show
  final int max;

  /// Size of the avatars
  final ChromiaAvatarSize size;

  /// Spacing between avatars (overlap effect)
  final double spacing;

  /// Whether to show "+N" for additional avatars
  final bool showMore;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    final int displayCount = avatars.length > max ? max : avatars.length;
    final int remainingCount = avatars.length - displayCount;

    // Calculate total width needed
    final double avatarSize = size.radius * 2;
    final double totalWidth = avatarSize + (displayCount - 1) * spacing;
    final double extraWidth = showMore && remainingCount > 0 ? spacing : 0;

    return SizedBox(
      width: totalWidth + extraWidth + (showMore && remainingCount > 0 ? avatarSize : 0),
      height: avatarSize + 8,
      child: Stack(
        children: [
          // Display avatars
          for (int i = 0; i < displayCount; i++)
            Positioned(
              left: i * spacing,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.surface,
                    width: 2,
                  ),
                ),
                child: _AvatarWrapper(
                  avatar: avatars[i],
                  size: size,
                ),
              ),
            ),
          // "+N" indicator
          if (showMore && remainingCount > 0)
            Positioned(
              left: displayCount * spacing,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.surface,
                    width: 2,
                  ),
                ),
                child: ChromiaAvatar(
                  size: size,
                  backgroundColor: colors.surfaceContainerHigh,
                  child: Text(
                    '+$remainingCount',
                    style: theme.typography.labelSmall.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: size.fontSize * 0.8,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Wrapper to ensure avatar respects the group's size
class _AvatarWrapper extends StatelessWidget {
  const _AvatarWrapper({
    required this.avatar,
    required this.size,
  });

  final ChromiaAvatar avatar;
  final ChromiaAvatarSize size;

  @override
  Widget build(BuildContext context) {
    // If the avatar already has the correct size, use it as-is
    if (avatar.size == size) {
      return avatar;
    }

    // Otherwise, wrap it in a SizedBox to enforce the size
    return SizedBox(
      width: size.radius * 2,
      height: size.radius * 2,
      child: ClipOval(
        child: avatar,
      ),
    );
  }
}

/// Size options for avatars
enum ChromiaAvatarSize {
  /// Extra small (24px)
  extraSmall(radius: 12, fontSize: 10, iconSize: 12),

  /// Small (32px)
  small(radius: 16, fontSize: 12, iconSize: 16),

  /// Medium (40px, default)
  medium(radius: 20, fontSize: 14, iconSize: 20),

  /// Large (56px)
  large(radius: 28, fontSize: 18, iconSize: 28),

  /// Extra large (72px)
  extraLarge(radius: 36, fontSize: 24, iconSize: 36)
  ;

  const ChromiaAvatarSize({
    required this.radius,
    required this.fontSize,
    required this.iconSize,
  });

  /// Radius of the avatar
  final double radius;

  /// Font size for text
  final double fontSize;

  /// Icon size
  final double iconSize;
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

/// An avatar with a status indicator.
class ChromiaAvatarWithStatus extends StatelessWidget {
  const ChromiaAvatarWithStatus({
    required this.avatar,
    required this.status,
    this.statusPosition = ChromiaAvatarStatusPosition.bottomRight,
    super.key,
  });

  /// The avatar widget
  final ChromiaAvatar avatar;

  /// Status indicator
  final ChromiaAvatarStatus status;

  /// Position of the status indicator
  final ChromiaAvatarStatusPosition statusPosition;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;

    final Color statusColor = switch (status) {
      ChromiaAvatarStatus.online => colors.success,
      ChromiaAvatarStatus.busy => colors.error,
      ChromiaAvatarStatus.away => colors.warning,
      ChromiaAvatarStatus.offline => colors.textTertiary,
    };

    final double statusSize = avatar.size.radius * 0.4;
    final double offset = avatar.size.radius * 0.1;

    final Widget statusIndicator = Container(
      width: statusSize,
      height: statusSize,
      decoration: BoxDecoration(
        color: statusColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: colors.surface,
          width: 2,
        ),
      ),
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right:
              statusPosition == ChromiaAvatarStatusPosition.bottomRight || statusPosition == ChromiaAvatarStatusPosition.topRight
              ? offset
              : null,
          left: statusPosition == ChromiaAvatarStatusPosition.bottomLeft || statusPosition == ChromiaAvatarStatusPosition.topLeft
              ? offset
              : null,
          bottom:
              statusPosition == ChromiaAvatarStatusPosition.bottomRight ||
                  statusPosition == ChromiaAvatarStatusPosition.bottomLeft
              ? offset
              : null,
          top: statusPosition == ChromiaAvatarStatusPosition.topRight || statusPosition == ChromiaAvatarStatusPosition.topLeft
              ? offset
              : null,
          child: statusIndicator,
        ),
      ],
    );
  }
}

/// Status options for avatars
enum ChromiaAvatarStatus {
  /// User is online (green)
  online,

  /// User is busy (red)
  busy,

  /// User is away (yellow)
  away,

  /// User is offline (gray)
  offline,
}

/// Position of the status indicator
enum ChromiaAvatarStatusPosition {
  /// Bottom right corner
  bottomRight,

  /// Bottom left corner
  bottomLeft,

  /// Top right corner
  topRight,

  /// Top left corner
  topLeft,
}
