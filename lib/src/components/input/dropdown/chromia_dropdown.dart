import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:flutter/material.dart';

/// A customizable dropdown component for selecting from a list of options.
///
/// Example usage:
/// ```dart
/// ChromiaDropdown<String>(
///   value: selectedValue,
///   items: ['Option 1', 'Option 2', 'Option 3'],
///   onChanged: (value) => setState(() => selectedValue = value),
///   label: 'Select an option',
/// )
/// ```
class ChromiaDropdown<T> extends StatelessWidget {
  const ChromiaDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.itemBuilder,
    this.enabled = true,
    super.key,
  });

  /// Currently selected value
  final T? value;

  /// List of items to display
  final List<T> items;

  /// Called when the selection changes
  final ValueChanged<T?>? onChanged;

  /// Label text
  final String? label;

  /// Hint text when no value is selected
  final String? hint;

  /// Helper text below the dropdown
  final String? helperText;

  /// Error text (replaces helper text when present)
  final String? errorText;

  /// Icon to display before the dropdown
  final Widget? prefixIcon;

  /// Custom builder for dropdown items
  final String Function(T)? itemBuilder;

  /// Whether the dropdown is enabled
  final bool enabled;

  String _itemToString(T item) {
    if (itemBuilder != null) {
      return itemBuilder!(item);
    }
    return item.toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final bool hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: theme.typography.labelMedium.copyWith(
              color: enabled ? colors.textPrimary : colors.textDisabled,
            ),
          ),
          spacing.gapVS,
        ],
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.m,
            vertical: spacing.xs,
          ),
          decoration: BoxDecoration(
            color: enabled ? colors.surfaceContainerHigh : colors.surfaceVariant,
            borderRadius: theme.radius.radiusM,
            border: Border.all(
              color: hasError
                  ? colors.error
                  : enabled
                  ? colors.border
                  : colors.border.withAlpha(128),
              width: hasError ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              if (prefixIcon != null) ...[
                prefixIcon!,
                spacing.gapHM,
              ],
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    value: value,
                    hint: hint != null
                        ? Text(
                            hint!,
                            style: theme.typography.bodyMedium.copyWith(
                              color: colors.textTertiary,
                            ),
                          )
                        : null,
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: enabled ? colors.textSecondary : colors.textDisabled,
                    ),
                    style: theme.typography.bodyMedium.copyWith(
                      color: enabled ? colors.textPrimary : colors.textDisabled,
                    ),
                    dropdownColor: colors.surface,
                    items: items.map((T item) {
                      return DropdownMenuItem<T>(
                        value: item,
                        child: Text(_itemToString(item)),
                      );
                    }).toList(),
                    onChanged: enabled ? onChanged : null,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (errorText != null || helperText != null) ...[
          spacing.gapVXS,
          Text(
            errorText ?? helperText!,
            style: theme.typography.bodySmall.copyWith(
              color: hasError ? colors.error : colors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}

/// A dropdown item with icon and description
class ChromiaDropdownItem<T> {
  const ChromiaDropdownItem({
    required this.value,
    required this.label,
    this.icon,
    this.description,
  });

  /// Value of the item
  final T value;

  /// Display label
  final String label;

  /// Optional icon
  final IconData? icon;

  /// Optional description
  final String? description;
}

/// A dropdown with rich items (icon + description)
class ChromiaRichDropdown<T> extends StatelessWidget {
  const ChromiaRichDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.enabled = true,
    super.key,
  });

  /// Currently selected value
  final T? value;

  /// List of items to display
  final List<ChromiaDropdownItem<T>> items;

  /// Called when the selection changes
  final ValueChanged<T?>? onChanged;

  /// Label text
  final String? label;

  /// Hint text when no value is selected
  final String? hint;

  /// Helper text below the dropdown
  final String? helperText;

  /// Error text
  final String? errorText;

  /// Whether the dropdown is enabled
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final bool hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: theme.typography.labelMedium.copyWith(
              color: enabled ? colors.textPrimary : colors.textDisabled,
            ),
          ),
          spacing.gapVS,
        ],
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.m,
            vertical: spacing.xs,
          ),
          decoration: BoxDecoration(
            color: enabled ? colors.surfaceContainerHigh : colors.surfaceVariant,
            borderRadius: theme.radius.radiusM,
            border: Border.all(
              color: hasError
                  ? colors.error
                  : enabled
                  ? colors.border
                  : colors.border.withAlpha(128),
              width: hasError ? 2 : 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              hint: hint != null
                  ? Text(
                      hint!,
                      style: theme.typography.bodyMedium.copyWith(
                        color: colors.textTertiary,
                      ),
                    )
                  : null,
              isExpanded: true,
              icon: Icon(
                Icons.arrow_drop_down,
                color: enabled ? colors.textSecondary : colors.textDisabled,
              ),
              selectedItemBuilder: (BuildContext context) {
                return items.map((ChromiaDropdownItem<T> item) {
                  return Row(
                    children: [
                      if (item.icon != null) ...[
                        Icon(
                          item.icon,
                          size: 20,
                          color: enabled ? colors.primary : colors.textDisabled,
                        ),
                        spacing.gapHM,
                      ],
                      Expanded(
                        child: Text(
                          item.label,
                          style: theme.typography.bodyMedium.copyWith(
                            color: enabled ? colors.textPrimary : colors.textDisabled,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList();
              },
              items: items.map((ChromiaDropdownItem<T> item) {
                return DropdownMenuItem<T>(
                  value: item.value,
                  child: Row(
                    children: [
                      if (item.icon != null) ...[
                        Icon(
                          item.icon,
                          size: 20,
                          color: colors.textSecondary,
                        ),
                        spacing.gapHM,
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.label,
                              style: theme.typography.bodyMedium,
                            ),
                            if (item.description != null) ...[
                              spacing.gapVXS,
                              Text(
                                item.description!,
                                style: theme.typography.bodySmall.copyWith(
                                  color: colors.textSecondary,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: enabled ? onChanged : null,
              dropdownColor: colors.surface,
            ),
          ),
        ),
        if (errorText != null || helperText != null) ...[
          spacing.gapVXS,
          Text(
            errorText ?? helperText!,
            style: theme.typography.bodySmall.copyWith(
              color: hasError ? colors.error : colors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}
