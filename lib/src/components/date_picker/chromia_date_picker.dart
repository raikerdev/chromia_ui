import 'package:chromia_ui/src/theme/chromia_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A customizable date picker field.
///
/// Example usage:
/// ```dart
/// ChromiaDatePicker(
///   label: 'Birth Date',
///   selectedDate: birthDate,
///   onDateSelected: (date) => setState(() => birthDate = date),
/// )
/// ```
class ChromiaDatePicker extends StatelessWidget {
  const ChromiaDatePicker({
    required this.onDateSelected,
    this.selectedDate,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.firstDate,
    this.lastDate,
    this.enabled = true,
    this.dateFormat,
    super.key,
  });

  /// Called when a date is selected
  final ValueChanged<DateTime> onDateSelected;

  /// Currently selected date
  final DateTime? selectedDate;

  /// Label text
  final String? label;

  /// Hint text when no date is selected
  final String? hintText;

  /// Helper text below the field
  final String? helperText;

  /// Error text
  final String? errorText;

  /// Prefix icon
  final IconData? prefixIcon;

  /// First selectable date
  final DateTime? firstDate;

  /// Last selectable date
  final DateTime? lastDate;

  /// Whether the picker is enabled
  final bool enabled;

  /// Date format (defaults to 'MMM dd, yyyy')
  final DateFormat? dateFormat;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        final theme = ChromiaTheme.of(context);
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: theme.colors.primary,
              onPrimary: theme.colors.onPrimary,
              surface: theme.colors.surface,
              onSurface: theme.colors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final bool hasError = errorText != null;
    final DateFormat formatter = dateFormat ?? DateFormat('MMM dd, yyyy');
    final String displayText = selectedDate != null ? formatter.format(selectedDate!) : hintText ?? 'Select date';

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
        InkWell(
          onTap: enabled ? () => _selectDate(context) : null,
          borderRadius: theme.radius.radiusM,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: spacing.m,
              vertical: spacing.m,
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
                Icon(
                  prefixIcon ?? Icons.calendar_today,
                  size: 20,
                  color: enabled ? colors.textSecondary : colors.textDisabled,
                ),
                spacing.gapHM,
                Expanded(
                  child: Text(
                    displayText,
                    style: theme.typography.bodyMedium.copyWith(
                      color: selectedDate != null ? (enabled ? colors.textPrimary : colors.textDisabled) : colors.textTertiary,
                    ),
                  ),
                ),
                if (selectedDate != null && enabled) ...[
                  spacing.gapHM,
                  GestureDetector(
                    onTap: () => onDateSelected(DateTime.now()),
                    child: Icon(
                      Icons.clear,
                      size: 20,
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ],
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

/// A customizable time picker field.
class ChromiaTimePicker extends StatelessWidget {
  const ChromiaTimePicker({
    required this.onTimeSelected,
    this.selectedTime,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.enabled = true,
    this.use24HourFormat = false,
    super.key,
  });

  /// Called when a time is selected
  final ValueChanged<TimeOfDay> onTimeSelected;

  /// Currently selected time
  final TimeOfDay? selectedTime;

  /// Label text
  final String? label;

  /// Hint text when no time is selected
  final String? hintText;

  /// Helper text below the field
  final String? helperText;

  /// Error text
  final String? errorText;

  /// Prefix icon
  final IconData? prefixIcon;

  /// Whether the picker is enabled
  final bool enabled;

  /// Whether to use 24-hour format
  final bool use24HourFormat;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        final theme = ChromiaTheme.of(context);
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: theme.colors.primary,
              onPrimary: theme.colors.onPrimary,
              surface: theme.colors.surface,
              onSurface: theme.colors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onTimeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final bool hasError = errorText != null;
    final String displayText = selectedTime != null ? selectedTime!.format(context) : hintText ?? 'Select time';

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
        InkWell(
          onTap: enabled ? () => _selectTime(context) : null,
          borderRadius: theme.radius.radiusM,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: spacing.m,
              vertical: spacing.m,
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
                Icon(
                  prefixIcon ?? Icons.access_time,
                  size: 20,
                  color: enabled ? colors.textSecondary : colors.textDisabled,
                ),
                spacing.gapHM,
                Expanded(
                  child: Text(
                    displayText,
                    style: theme.typography.bodyMedium.copyWith(
                      color: selectedTime != null ? (enabled ? colors.textPrimary : colors.textDisabled) : colors.textTertiary,
                    ),
                  ),
                ),
                if (selectedTime != null && enabled) ...[
                  spacing.gapHM,
                  GestureDetector(
                    onTap: () => onTimeSelected(TimeOfDay.now()),
                    child: Icon(
                      Icons.clear,
                      size: 20,
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ],
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

/// A combined date and time picker
class ChromiaDateTimePicker extends StatelessWidget {
  const ChromiaDateTimePicker({
    required this.onDateTimeSelected,
    this.selectedDateTime,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.firstDate,
    this.lastDate,
    this.enabled = true,
    super.key,
  });

  /// Called when a date and time is selected
  final ValueChanged<DateTime> onDateTimeSelected;

  /// Currently selected date and time
  final DateTime? selectedDateTime;

  /// Label text
  final String? label;

  /// Hint text
  final String? hintText;

  /// Helper text
  final String? helperText;

  /// Error text
  final String? errorText;

  /// Prefix icon
  final IconData? prefixIcon;

  /// First selectable date
  final DateTime? firstDate;

  /// Last selectable date
  final DateTime? lastDate;

  /// Whether the picker is enabled
  final bool enabled;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
    );

    if (pickedDate != null && context.mounted) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedDateTime != null ? TimeOfDay.fromDateTime(selectedDateTime!) : TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime combined = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        onDateTimeSelected(combined);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    final bool hasError = errorText != null;
    final DateFormat formatter = DateFormat('MMM dd, yyyy hh:mm a');
    final String displayText = selectedDateTime != null
        ? formatter.format(selectedDateTime!)
        : hintText ?? 'Select date and time';

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
        InkWell(
          onTap: enabled ? () => _selectDateTime(context) : null,
          borderRadius: theme.radius.radiusM,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: spacing.m,
              vertical: spacing.m,
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
                Icon(
                  prefixIcon ?? Icons.event,
                  size: 20,
                  color: enabled ? colors.textSecondary : colors.textDisabled,
                ),
                spacing.gapHM,
                Expanded(
                  child: Text(
                    displayText,
                    style: theme.typography.bodyMedium.copyWith(
                      color: selectedDateTime != null
                          ? (enabled ? colors.textPrimary : colors.textDisabled)
                          : colors.textTertiary,
                    ),
                  ),
                ),
              ],
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
