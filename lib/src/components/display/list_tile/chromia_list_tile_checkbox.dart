import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A checkbox with a tile layout.
///
/// Displays a [ChromiaCheckbox] at the trailing end with optional
/// [title], [subtitle] and [leading] widgets.
///
/// Supports the same [ChromiaListTileVariant] options as [ChromiaListTile]
/// (standard, outlined, card) so it integrates seamlessly in any list layout.
///
/// Example usage:
/// ```dart
/// ChromiaListTileCheckbox(
///   value: isChecked,
///   onChanged: (value) => setState(() => isChecked = value ?? false),
///   title: Text('Accept terms and conditions'),
///   subtitle: Text('Read carefully before accepting'),
/// )
/// ```
class ChromiaListTileCheckbox extends StatelessWidget {
  /// Creates a [ChromiaListTileCheckbox].
  const ChromiaListTileCheckbox({
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.leading,
    this.tristate = false,
    this.activeColor,
    this.checkColor,
    this.contentPadding,
    this.checkIcon = Icons.check,
    this.tristateIcon = Icons.remove,
    this.variant = ChromiaListTileVariant.standard,
    super.key,
  });

  /// Whether the checkbox is checked.
  final bool? value;

  /// Called when the value changes. Pass `null` to disable.
  final ValueChanged<bool?>? onChanged;

  /// The primary content.
  final Widget? title;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// A widget to display at the leading edge.
  final Widget? leading;

  /// Whether the checkbox can be in an indeterminate state.
  final bool tristate;

  /// The color when checked. Defaults to [ChromiaColors.primary].
  final Color? activeColor;

  /// The color of the check mark. Defaults to [ChromiaColors.onPrimary].
  final Color? checkColor;

  /// Padding around the tile. Defaults to [ChromiaSpacing.paddingM].
  final EdgeInsetsGeometry? contentPadding;

  /// The icon to display when checked.
  final IconData checkIcon;

  /// The icon to display in indeterminate state.
  final IconData tristateIcon;

  /// The visual variant of the tile.
  ///
  /// Mirrors [ChromiaListTile.variant] — standard (default), outlined, card.
  final ChromiaListTileVariant variant;

  VoidCallback? _buildOnTap() {
    if (onChanged == null) {
      return null;
    }
    return () {
      if (tristate) {
        if (value == false) {
          onChanged!(true);
        } else if (value == true) {
          onChanged!(null);
        } else {
          onChanged!(false);
        }
      } else {
        onChanged!(!(value ?? false));
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return ChromiaListTileShell(
      onTap: _buildOnTap(),
      title: title,
      subtitle: subtitle,
      leading: leading,
      contentPadding: contentPadding,
      variant: variant,
      control: ChromiaCheckbox(
        value: value,
        onChanged: onChanged,
        tristate: tristate,
        activeColor: activeColor,
        checkColor: checkColor,
        checkIcon: checkIcon,
        tristateIcon: tristateIcon,
      ),
    );
  }
}
