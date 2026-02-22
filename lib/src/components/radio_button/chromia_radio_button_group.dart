import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

/// A group of radio buttons with automatic layout.
///
/// The [ChromiaRadioButtonGroup] widget is a wrapper around a list of
/// [ChromiaRadioButtonItem] items.
///
/// Example usage:
/// ```dart
/// String selectedValue = 'option1';
///
/// ChromiaRadioButtonGroup<T>(
///   value: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value),
///   items: [
///     ChromiaRadioButtonItem(value: 'option1', label: 'Option 1'),
///     ChromiaRadioButtonItem(value: 'option2', label: 'Option 2'),
///     ChromiaRadioButtonItem(value: 'option3', label: 'Option 3'),
///   ]
/// )
/// ```
class ChromiaRadioButtonGroup<T> extends StatelessWidget {
  const ChromiaRadioButtonGroup({
    required this.value,
    required this.onChanged,
    required this.items,
    this.direction = Axis.vertical,
    this.spacing,
    this.runSpacing,
    this.activeColor,
    super.key,
  });

  /// The currently selected value
  final T? value;

  /// Called when the selection changes
  final ValueChanged<T?> onChanged;

  /// The list of items to display
  final List<ChromiaRadioButtonItem<T>> items;

  /// The direction to layout the radio buttons
  final Axis direction;

  /// Spacing between items
  final double? spacing;

  /// Run spacing for wrapped layouts
  final double? runSpacing;

  /// The color when selected
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final effectiveSpacing = spacing ?? theme.spacing.m;
    final effectiveRunSpacing = runSpacing ?? theme.spacing.m;

    if (direction == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          final isLast = item == items.last;
          return Padding(
            padding: EdgeInsets.only(
              bottom: isLast ? 0 : effectiveSpacing,
            ),
            child: ChromiaRadioButton<T>(
              value: item.value,
              groupValue: value,
              onChanged: onChanged,
              label: item.label,
              activeColor: activeColor,
            ),
          );
        }).toList(),
      );
    } else {
      return Wrap(
        spacing: effectiveSpacing,
        runSpacing: effectiveRunSpacing,
        children: items.map((item) {
          return ChromiaRadioButton<T>(
            value: item.value,
            groupValue: value,
            onChanged: onChanged,
            label: item.label,
            activeColor: activeColor,
          );
        }).toList(),
      );
    }
  }
}

/// Represents a single item in a radio group.
class ChromiaRadioButtonItem<T> {
  const ChromiaRadioButtonItem({
    required this.value,
    required this.label,
  });

  /// The value of this item
  final T value;

  /// The label to display
  final String label;
}

