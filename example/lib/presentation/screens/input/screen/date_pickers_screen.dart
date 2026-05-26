import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DatePickersScreen extends StatelessWidget {
  const DatePickersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Date & Time Pickers',
      children: [
        ComponentPage(
          description:
              'Chromia provides ChromiaDatePicker, ChromiaTimePicker, and '
              'ChromiaDateTimePicker for date and time selection. Each opens '
              'the native platform dialog and displays the selected value '
              'in a themed text field.',
          whenToUse:
              'Use ChromiaDatePicker for birth dates, deadlines, or any calendar date. '
              'Use ChromiaTimePicker for scheduling times. '
              'Use ChromiaDateTimePicker when both date and time are needed together.',
          children: [
            // ── Date Picker ───────────────────────────────────────────────────
            ComponentSection(
              title: 'Date Picker',
              description:
                  'Tapping the field opens the system date picker dialog. '
                  'selectedDate shows the current value; onDateSelected is called on pick.',
              child: ChromiaCodePreview(
                code: '''
ChromiaDatePicker(
  label: 'Birth Date',
  selectedDate: selectedDate,
  helperText: 'Select your date of birth',
  onDateSelected: (date) => setState(() => selectedDate = date),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    DateTime? selectedDate;
                    return ChromiaDatePicker(
                      label: 'Birth Date',
                      selectedDate: selectedDate,
                      helperText: 'Select your date of birth',
                      onDateSelected: (date) =>
                          setState(() => selectedDate = date),
                    );
                  },
                ),
              ),
            ),

            // ── Time Picker ───────────────────────────────────────────────────
            ComponentSection(
              title: 'Time Picker',
              description:
                  'Tapping the field opens the system time picker dialog.',
              child: ChromiaCodePreview(
                code: '''
ChromiaTimePicker(
  label: 'Appointment Time',
  selectedTime: selectedTime,
  helperText: 'Select your preferred time',
  onTimeSelected: (time) => setState(() => selectedTime = time),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    TimeOfDay? selectedTime;
                    return ChromiaTimePicker(
                      label: 'Appointment Time',
                      selectedTime: selectedTime,
                      helperText: 'Select your preferred time',
                      onTimeSelected: (time) =>
                          setState(() => selectedTime = time),
                    );
                  },
                ),
              ),
            ),

            // ── Date & Time Picker ────────────────────────────────────────────
            ComponentSection(
              title: 'Date & Time Picker',
              description:
                  'ChromiaDateTimePicker chains a date picker followed by '
                  'a time picker, returning a combined DateTime.',
              child: ChromiaCodePreview(
                code: '''
ChromiaDateTimePicker(
  label: 'Event Date & Time',
  selectedDateTime: selectedDateTime,
  helperText: 'Select when the event will occur',
  onDateTimeSelected: (dt) => setState(() => selectedDateTime = dt),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    DateTime? selectedDateTime;
                    return ChromiaDateTimePicker(
                      label: 'Event Date & Time',
                      selectedDateTime: selectedDateTime,
                      helperText: 'Select when the event will occur',
                      onDateTimeSelected: (dt) =>
                          setState(() => selectedDateTime = dt),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
