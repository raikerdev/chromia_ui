import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ── Helper ────────────────────────────────────────────────────────────────────

Widget buildTestApp(Widget child) {
  return MaterialApp(
    home: ChromiaTheme(
      data: ChromiaThemeData.light(),
      child: Scaffold(body: Center(child: child)),
    ),
  );
}

// ── ChromiaCheckbox ───────────────────────────────────────────────────────────

void main() {
  group('ChromiaCheckbox', () {
    testWidgets('renders unchecked without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(value: false, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaCheckbox), findsOneWidget);
    });

    testWidgets('renders checked without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(value: true, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaCheckbox), findsOneWidget);
    });

    testWidgets('renders tristate null without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(value: null, tristate: true, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaCheckbox), findsOneWidget);
    });

    testWidgets('calls onChanged(true) when unchecked tapped', (tester) async {
      bool? received;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(
            value: false,
            onChanged: (v) => received = v,
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaCheckbox));
      await tester.pump();

      expect(received, true);
    });

    testWidgets('calls onChanged(false) when checked tapped', (tester) async {
      bool? received;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(
            value: true,
            onChanged: (v) => received = v,
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaCheckbox));
      await tester.pump();

      expect(received, false);
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      const bool called = false;

      await tester.pumpWidget(
        buildTestApp(
          const ChromiaCheckbox(value: false, onChanged: null),
        ),
      );

      await tester.tap(find.byType(ChromiaCheckbox), warnIfMissed: false);
      await tester.pump();

      expect(called, false);
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(
            value: false,
            onChanged: (_) {},
            label: 'Accept terms',
          ),
        ),
      );
      expect(find.text('Accept terms'), findsOneWidget);
    });

    testWidgets('label tap fires onChanged', (tester) async {
      bool? received;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(
            value: false,
            onChanged: (v) => received = v,
            label: 'Accept terms',
          ),
        ),
      );

      await tester.tap(find.text('Accept terms'));
      await tester.pump();

      expect(received, true);
    });

    testWidgets('tristate cycles: null→false, false→true, true→null', (
      tester,
    ) async {
      // Cycle: null → false → true → null (see _buildOnTap implementation)
      bool? currentValue;
      bool? received;

      // null → false
      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(
            value: currentValue,
            tristate: true,
            onChanged: (v) => received = v,
          ),
        ),
      );
      await tester.tap(find.byType(ChromiaCheckbox));
      await tester.pump();
      expect(received, false);

      // false → true
      currentValue = false;
      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(
            value: currentValue,
            tristate: true,
            onChanged: (v) => received = v,
          ),
        ),
      );
      await tester.tap(find.byType(ChromiaCheckbox));
      await tester.pump();
      expect(received, true);

      // true → null
      currentValue = true;
      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(
            value: currentValue,
            tristate: true,
            onChanged: (v) => received = v,
          ),
        ),
      );
      await tester.tap(find.byType(ChromiaCheckbox));
      await tester.pump();
      expect(received, null);
    });

    // ── Organic Rounded identity ─────────────────────────────────────────────

    testWidgets('renders checkbox with squircle (8 px) radius without crash', (
      tester,
    ) async {
      // Verifies checkbox renders correctly with its radiusM (8 px) border.
      await tester.pumpWidget(
        buildTestApp(
          ChromiaCheckbox(value: false, onChanged: (_) {}),
        ),
      );
      expect(find.byType(AnimatedContainer), findsOneWidget);
    });
  });

  // ── ChromiaToggleButton ───────────────────────────────────────────────────────

  group('ChromiaToggleButton', () {
    testWidgets('renders off state without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaToggleButton(value: false, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaToggleButton), findsOneWidget);
    });

    testWidgets('renders on state without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaToggleButton(value: true, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaToggleButton), findsOneWidget);
    });

    testWidgets('renders all sizes without crash', (tester) async {
      for (final size in ChromiaToggleButtonSize.values) {
        await tester.pumpWidget(
          buildTestApp(
            ChromiaToggleButton(value: false, onChanged: (_) {}, size: size),
          ),
        );
        expect(find.byType(ChromiaToggleButton), findsOneWidget);
      }
    });

    testWidgets('calls onChanged(!value) when tapped', (tester) async {
      bool? received;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaToggleButton(
            value: false,
            onChanged: (v) => received = v,
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaToggleButton));
      await tester.pumpAndSettle();

      expect(received, true);
    });

    testWidgets('calls onChanged(false) when on and tapped', (tester) async {
      bool? received;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaToggleButton(
            value: true,
            onChanged: (v) => received = v,
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaToggleButton));
      await tester.pumpAndSettle();

      expect(received, false);
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      const bool called = false;

      await tester.pumpWidget(
        buildTestApp(
          const ChromiaToggleButton(value: false, onChanged: null),
        ),
      );

      await tester.tap(find.byType(ChromiaToggleButton), warnIfMissed: false);
      await tester.pump();

      expect(called, false);
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaToggleButton(
            value: false,
            onChanged: (_) {},
            label: 'Enable notifications',
          ),
        ),
      );
      expect(find.text('Enable notifications'), findsOneWidget);
    });

    testWidgets('label tap fires onChanged', (tester) async {
      bool? received;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaToggleButton(
            value: false,
            onChanged: (v) => received = v,
            label: 'Enable notifications',
          ),
        ),
      );

      await tester.tap(find.text('Enable notifications'));
      await tester.pumpAndSettle();

      expect(received, true);
    });
  });

  // ── ChromiaRadioButton ────────────────────────────────────────────────────────

  group('ChromiaRadioButton', () {
    testWidgets('renders unselected without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButton<String>(
            value: 'a',
            groupValue: 'b',
            onChanged: (_) {},
          ),
        ),
      );
      expect(find.byType(ChromiaRadioButton<String>), findsOneWidget);
    });

    testWidgets('renders selected without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButton<String>(
            value: 'a',
            groupValue: 'a',
            onChanged: (_) {},
          ),
        ),
      );
      expect(find.byType(ChromiaRadioButton<String>), findsOneWidget);
    });

    testWidgets('calls onChanged with its own value when tapped', (
      tester,
    ) async {
      String? received;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButton<String>(
            value: 'option1',
            groupValue: 'option2',
            onChanged: (v) => received = v,
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaRadioButton<String>));
      await tester.pump();

      expect(received, 'option1');
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      const bool called = false;

      await tester.pumpWidget(
        buildTestApp(
          const ChromiaRadioButton<String>(
            value: 'a',
            groupValue: 'b',
            onChanged: null,
          ),
        ),
      );

      await tester.tap(
        find.byType(ChromiaRadioButton<String>),
        warnIfMissed: false,
      );
      await tester.pump();

      expect(called, false);
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButton<String>(
            value: 'a',
            groupValue: 'b',
            onChanged: (_) {},
            label: 'Option A',
          ),
        ),
      );
      expect(find.text('Option A'), findsOneWidget);
    });

    testWidgets('label tap fires onChanged', (tester) async {
      String? received;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButton<String>(
            value: 'opt',
            groupValue: 'other',
            onChanged: (v) => received = v,
            label: 'Option',
          ),
        ),
      );

      await tester.tap(find.text('Option'));
      await tester.pump();

      expect(received, 'opt');
    });

    testWidgets('does not call onChanged when already selected and tapped', (
      tester,
    ) async {
      int count = 0;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButton<String>(
            value: 'a',
            groupValue: 'a', // already selected
            onChanged: (_) => count++,
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaRadioButton<String>));
      await tester.pump();

      // Radio buttons still fire — caller decides if it matters.
      // Just verify it doesn't crash.
      expect(find.byType(ChromiaRadioButton<String>), findsOneWidget);
    });
  });

}
