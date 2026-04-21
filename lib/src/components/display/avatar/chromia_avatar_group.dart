import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A group of overlapping avatars.
class ChromiaAvatarGroup extends StatelessWidget {
  const ChromiaAvatarGroup({
    required this.avatars,
    this.max = 3,
    this.size = ChromiaAvatarSize.medium,
    this.spacing = SpacingTokens.s,
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
    final colors = context.chromiaColors;

    final int displayCount = avatars.length > max ? max : avatars.length;
    final int remainingCount = avatars.length - displayCount;

    // Calculate total width needed
    final double avatarSize = size.value;
    final double totalWidth = avatarSize + (displayCount - 1) * spacing;
    final double extraWidth = showMore && remainingCount > 0 ? spacing : 0;

    final border = Border.all(
      color: colors.surface,
      width: 2,
    );

    return SizedBox(
      width: totalWidth + extraWidth + (showMore && remainingCount > 0 ? avatarSize : 0),
      height: avatarSize + SpacingTokens.s,
      child: Stack(
        children: [
          // Display avatars
          for (int i = 0; i < displayCount; i++)
            Positioned(
              left: i * spacing,
              child: ChromiaAvatar(
                size: size,
                border: border,
                backgroundColor: avatars[i].backgroundColor,
                foregroundColor: avatars[i].foregroundColor,
                imageProvider: avatars[i].imageProvider,
                child: avatars[i].child,
              ),
            ),
          // "+N" indicator
          if (showMore && remainingCount > 0)
            Positioned(
              left: displayCount * spacing,
              child: ChromiaAvatar(
                size: size,
                backgroundColor: colors.secondary,
                border: border,
                child: ChromiaText(
                  '+$remainingCount',
                  type: ChromiaTypographyType.labelSmall,
                  style: TextStyle(
                    color: colors.onSecondary,
                    fontWeight: FontWeight.w600,
                    fontSize: size.fontSize * 0.8,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
