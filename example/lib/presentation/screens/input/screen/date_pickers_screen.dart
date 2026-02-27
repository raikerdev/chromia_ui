import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DatePickersScreen extends StatefulWidget {
  const DatePickersScreen({super.key});

  @override
  State<DatePickersScreen> createState() => _DatePickersScreenState();
}

class _DatePickersScreenState extends State<DatePickersScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  DateTime? _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Date Pickers',
      children: [
        // Date Picker section
        _buildDatePickerSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildDatePickerSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date & Time Pickers',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVM,

        Text(
          'Date Picker',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaDatePicker(
          label: 'Birth Date',
          selectedDate: _selectedDate,
          onDateSelected: (date) {
            setState(() => _selectedDate = date);
          },
          helperText: 'Select your date of birth',
        ),
        spacing.gapVL,

        Text(
          'Time Picker',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaTimePicker(
          label: 'Appointment Time',
          selectedTime: _selectedTime,
          onTimeSelected: (time) {
            setState(() => _selectedTime = time);
          },
          helperText: 'Select your preferred time',
        ),
        spacing.gapVL,

        Text(
          'Date & Time Picker',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaDateTimePicker(
          label: 'Event Date & Time',
          selectedDateTime: _selectedDateTime,
          onDateTimeSelected: (dateTime) {
            setState(() => _selectedDateTime = dateTime);
          },
          helperText: 'Select when the event will occur',
        ),
        spacing.gapVL,

        Text(
          'Selected Values',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date: ${_selectedDate?.toString().split(' ')[0] ?? 'Not selected'}',
                style: theme.typography.bodyMedium,
              ),
              spacing.gapVS,
              Text(
                'Time: ${_selectedTime?.format(context) ?? 'Not selected'}',
                style: theme.typography.bodyMedium,
              ),
              spacing.gapVS,
              Text(
                'DateTime: ${_selectedDateTime?.toString() ?? 'Not selected'}',
                style: theme.typography.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
