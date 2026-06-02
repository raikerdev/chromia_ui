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

// ── ChromiaDropdown ───────────────────────────────────────────────────────────

void main() {
  group('ChromiaDropdown', () {
    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaDropdown<String>(
            value: null,
            items: const ['Option A', 'Option B', 'Option C'],
            onChanged: (_) {},
          ),
        ),
      );
      expect(find.byType(ChromiaDropdown<String>), findsOneWidget);
    });

    testWidgets('renders with selected value without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaDropdown<String>(
            value: 'Option A',
            items: const ['Option A', 'Option B', 'Option C'],
            onChanged: (_) {},
          ),
        ),
      );
      expect(find.text('Option A'), findsOneWidget);
    });

    testWidgets('renders with label without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaDropdown<String>(
            value: null,
            items: const ['A', 'B'],
            onChanged: (_) {},
            label: 'Choose one',
          ),
        ),
      );
      expect(find.text('Choose one'), findsOneWidget);
    });

    testWidgets('renders with helper text without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaDropdown<String>(
            value: null,
            items: const ['A', 'B'],
            onChanged: (_) {},
            helperText: 'Select an option',
          ),
        ),
      );
      expect(find.text('Select an option'), findsOneWidget);
    });

    testWidgets('renders with error text without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaDropdown<String>(
            value: null,
            items: const ['A', 'B'],
            onChanged: (_) {},
            errorText: 'Required field',
          ),
        ),
      );
      expect(find.text('Required field'), findsOneWidget);
    });

    testWidgets('renders disabled without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaDropdown<String>(
            value: null,
            items: const ['A', 'B'],
            onChanged: (_) {},
            enabled: false,
          ),
        ),
      );
      expect(find.byType(ChromiaDropdown<String>), findsOneWidget);
    });

    testWidgets('renders with int type without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaDropdown<int>(
            value: 1,
            items: const [1, 2, 3],
            onChanged: (_) {},
            itemBuilder: (v) => 'Item $v',
          ),
        ),
      );
      expect(find.text('Item 1'), findsOneWidget);
    });
  });

  // ── ChromiaRadioButtonGroup ───────────────────────────────────────────────────

  group('ChromiaRadioButtonGroup', () {
    final items = [
      const ChromiaRadioButtonItem<String>(value: 'a', label: 'Option A'),
      const ChromiaRadioButtonItem<String>(value: 'b', label: 'Option B'),
      const ChromiaRadioButtonItem<String>(value: 'c', label: 'Option C'),
    ];

    testWidgets('renders all items without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButtonGroup<String>(
            value: 'a',
            onChanged: (_) {},
            items: items,
          ),
        ),
      );
      expect(find.text('Option A'), findsOneWidget);
      expect(find.text('Option B'), findsOneWidget);
      expect(find.text('Option C'), findsOneWidget);
    });

    testWidgets('calls onChanged when item tapped', (tester) async {
      String? received;
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButtonGroup<String>(
            value: 'a',
            onChanged: (v) => received = v,
            items: items,
          ),
        ),
      );
      await tester.tap(find.text('Option B'));
      await tester.pump();
      expect(received, 'b');
    });

    testWidgets('renders horizontal layout without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButtonGroup<String>(
            value: 'a',
            onChanged: (_) {},
            items: items,
            direction: Axis.horizontal,
          ),
        ),
      );
      expect(find.byType(ChromiaRadioButtonGroup<String>), findsOneWidget);
    });

    testWidgets('shows no item selected when value is null', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRadioButtonGroup<String>(
            value: null,
            onChanged: (_) {},
            items: items,
          ),
        ),
      );
      expect(find.byType(ChromiaRadioButtonGroup<String>), findsOneWidget);
    });
  });

  // ── ChromiaListTileCheckbox ───────────────────────────────────────────────────

  group('ChromiaListTileCheckbox', () {
    testWidgets('renders unchecked without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileCheckbox(value: false, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaListTileCheckbox), findsOneWidget);
    });

    testWidgets('renders checked without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileCheckbox(value: true, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaListTileCheckbox), findsOneWidget);
    });

    testWidgets('renders with title and subtitle without crash', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileCheckbox(
            value: false,
            onChanged: (_) {},
            title: const Text('Accept terms'),
            subtitle: const Text('Please read before accepting'),
          ),
        ),
      );
      expect(find.text('Accept terms'), findsOneWidget);
      expect(find.text('Please read before accepting'), findsOneWidget);
    });

    testWidgets('calls onChanged when tile tapped', (tester) async {
      bool? received;
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileCheckbox(
            value: false,
            onChanged: (v) => received = v,
            title: const Text('Accept'),
          ),
        ),
      );
      await tester.tap(find.byType(ChromiaListTileCheckbox));
      await tester.pump();
      expect(received, true);
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      const bool called = false;
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaListTileCheckbox(value: false, onChanged: null),
        ),
      );
      await tester.tap(
        find.byType(ChromiaListTileCheckbox),
        warnIfMissed: false,
      );
      await tester.pump();
      expect(called, false);
    });
  });

  // ── ChromiaListTileRadioButton ────────────────────────────────────────────────

  group('ChromiaListTileRadioButton', () {
    testWidgets('renders unselected without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileRadioButton<String>(
            value: 'a',
            groupValue: 'b',
            onChanged: (_) {},
          ),
        ),
      );
      expect(find.byType(ChromiaListTileRadioButton<String>), findsOneWidget);
    });

    testWidgets('renders selected without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileRadioButton<String>(
            value: 'a',
            groupValue: 'a',
            onChanged: (_) {},
          ),
        ),
      );
      expect(find.byType(ChromiaListTileRadioButton<String>), findsOneWidget);
    });

    testWidgets('renders with title and subtitle without crash', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileRadioButton<String>(
            value: 'opt1',
            groupValue: 'opt2',
            onChanged: (_) {},
            title: const Text('Option 1'),
            subtitle: const Text('Description'),
          ),
        ),
      );
      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('calls onChanged with its value when tapped', (tester) async {
      String? received;
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileRadioButton<String>(
            value: 'opt1',
            groupValue: 'opt2',
            onChanged: (v) => received = v,
            title: const Text('Option 1'),
          ),
        ),
      );
      await tester.tap(find.byType(ChromiaListTileRadioButton<String>));
      await tester.pump();
      expect(received, 'opt1');
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      const bool called = false;
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaListTileRadioButton<String>(
            value: 'a',
            groupValue: 'b',
            onChanged: null,
          ),
        ),
      );
      await tester.tap(
        find.byType(ChromiaListTileRadioButton<String>),
        warnIfMissed: false,
      );
      await tester.pump();
      expect(called, false);
    });
  });

  // ── ChromiaListTileToggleButton ───────────────────────────────────────────────

  group('ChromiaListTileToggleButton', () {
    testWidgets('renders off state without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileToggleButton(value: false, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaListTileToggleButton), findsOneWidget);
    });

    testWidgets('renders on state without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileToggleButton(value: true, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaListTileToggleButton), findsOneWidget);
    });

    testWidgets('renders with title and subtitle without crash', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileToggleButton(
            value: false,
            onChanged: (_) {},
            title: const Text('Notifications'),
            subtitle: const Text('Enable push notifications'),
          ),
        ),
      );
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Enable push notifications'), findsOneWidget);
    });

    testWidgets('calls onChanged when tile tapped', (tester) async {
      bool? received;
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileToggleButton(
            value: false,
            onChanged: (v) => received = v,
            title: const Text('Toggle'),
          ),
        ),
      );
      await tester.tap(find.byType(ChromiaListTileToggleButton));
      await tester.pumpAndSettle();
      expect(received, true);
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      const bool called = false;
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaListTileToggleButton(value: false, onChanged: null),
        ),
      );
      await tester.tap(
        find.byType(ChromiaListTileToggleButton),
        warnIfMissed: false,
      );
      await tester.pump();
      expect(called, false);
    });
  });

  // ── Shared: leading + variant ─────────────────────────────────────────────────

  group('Control tiles — leading and variant', () {
    testWidgets('ChromiaListTileCheckbox renders with leading icon', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileCheckbox(
            value: false,
            onChanged: (_) {},
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
          ),
        ),
      );
      expect(find.byIcon(Icons.notifications), findsOneWidget);
    });

    testWidgets(
      'ChromiaListTileCheckbox renders outlined variant without crash',
      (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            ChromiaListTileCheckbox(
              value: true,
              onChanged: (_) {},
              title: const Text('Outlined'),
              variant: ChromiaListTileVariant.outlined,
            ),
          ),
        );
        expect(find.byType(ChromiaListTileCheckbox), findsOneWidget);
      },
    );

    testWidgets(
      'ChromiaListTileToggleButton renders card variant without crash',
      (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            ChromiaListTileToggleButton(
              value: true,
              onChanged: (_) {},
              title: const Text('Card variant'),
              variant: ChromiaListTileVariant.card,
            ),
          ),
        );
        expect(find.byType(ChromiaListTileToggleButton), findsOneWidget);
      },
    );

    testWidgets('ChromiaListTileSlider renders outlined variant without crash',
        (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileSlider(
            value: 0.5,
            onChanged: (_) {},
            title: const Text('Volume'),
            variant: ChromiaListTileVariant.outlined,
          ),
        ),
      );
      expect(find.byType(ChromiaListTileSlider), findsOneWidget);
    });

    testWidgets(
      'ChromiaListTileRangeSlider renders card variant without crash',
      (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            ChromiaListTileRangeSlider(
              values: const RangeValues(0.2, 0.8),
              onChanged: (_) {},
              title: const Text('Range'),
              variant: ChromiaListTileVariant.card,
            ),
          ),
        );
        expect(find.byType(ChromiaListTileRangeSlider), findsOneWidget);
      },
    );
  });
}
