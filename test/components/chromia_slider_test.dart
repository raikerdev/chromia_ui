import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ── Helper ────────────────────────────────────────────────────────────────────

Widget buildTestApp(Widget child) {
  return MaterialApp(
    home: ChromiaTheme(
      data: ChromiaThemeData.light(),
      child: Scaffold(
        body: Center(
          // Sliders need horizontal space to render correctly
          child: SizedBox(width: 300, child: child),
        ),
      ),
    ),
  );
}

// ── ChromiaSlider ─────────────────────────────────────────────────────────────

void main() {
  group('ChromiaSlider', () {
    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaSlider(value: 0.5, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaSlider), findsOneWidget);
    });

    testWidgets('renders at min value without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaSlider(value: 0.0, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaSlider), findsOneWidget);
    });

    testWidgets('renders at max value without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaSlider(value: 1.0, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaSlider), findsOneWidget);
    });

    testWidgets('renders disabled without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaSlider(value: 0.5, onChanged: null, enabled: false),
        ),
      );
      expect(find.byType(ChromiaSlider), findsOneWidget);
    });

    testWidgets('renders with min/max labels without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaSlider(
            value: 0.5,
            onChanged: (_) {},
            minLabel: '0',
            maxLabel: '100',
          ),
        ),
      );
      expect(find.text('0'), findsOneWidget);
      expect(find.text('100'), findsOneWidget);
    });

    testWidgets('renders with custom value builder without crash', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaSlider(
            value: 0.5,
            onChanged: (_) {},
            valueBuilder: (v) => '${(v * 100).toInt()}%',
          ),
        ),
      );
      expect(find.byType(ChromiaSlider), findsOneWidget);
    });

    testWidgets('calls onChanged when dragged', (tester) async {
      double? received;
      await tester.pumpWidget(
        buildTestApp(
          ChromiaSlider(
            value: 0.0,
            min: 0.0,
            max: 1.0,
            onChanged: (v) => received = v,
          ),
        ),
      );

      final slider = find.byType(Slider);
      await tester.drag(slider, const Offset(100, 0));
      await tester.pump();

      expect(received, isNotNull);
    });
  });

  // ── ChromiaRangeSlider ────────────────────────────────────────────────────────

  group('ChromiaRangeSlider', () {
    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRangeSlider(
            values: const RangeValues(0.2, 0.8),
            onChanged: (_) {},
          ),
        ),
      );
      expect(find.byType(ChromiaRangeSlider), findsOneWidget);
    });

    testWidgets('renders disabled without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaRangeSlider(
            values: RangeValues(0.2, 0.8),
            onChanged: null,
            enabled: false,
          ),
        ),
      );
      expect(find.byType(ChromiaRangeSlider), findsOneWidget);
    });

    testWidgets('renders with showValues=true without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRangeSlider(
            values: const RangeValues(0.2, 0.8),
            onChanged: (_) {},
            showValues: true,
          ),
        ),
      );
      expect(find.byType(ChromiaRangeSlider), findsOneWidget);
    });

    testWidgets('calls onChanged when dragged', (tester) async {
      RangeValues? received;
      await tester.pumpWidget(
        buildTestApp(
          ChromiaRangeSlider(
            values: const RangeValues(0.1, 0.9),
            onChanged: (v) => received = v,
          ),
        ),
      );

      final slider = find.byType(RangeSlider);
      await tester.drag(slider, const Offset(50, 0));
      await tester.pump();

      expect(received, isNotNull);
    });
  });

  // ── ChromiaListTileSlider ─────────────────────────────────────────────────────

  group('ChromiaListTileSlider', () {
    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileSlider(value: 0.5, onChanged: (_) {}),
        ),
      );
      expect(find.byType(ChromiaListTileSlider), findsOneWidget);
    });

    testWidgets('renders with title and subtitle without crash', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileSlider(
            value: 0.5,
            onChanged: (_) {},
            title: const Text('Volume'),
            subtitle: const Text('Adjust the volume'),
          ),
        ),
      );
      expect(find.text('Volume'), findsOneWidget);
      expect(find.text('Adjust the volume'), findsOneWidget);
    });

    testWidgets('renders disabled without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaListTileSlider(
            value: 0.5,
            onChanged: null,
            enabled: false,
          ),
        ),
      );
      expect(find.byType(ChromiaListTileSlider), findsOneWidget);
    });

    testWidgets('calls onChanged when dragged', (tester) async {
      double? received;
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileSlider(
            value: 0.0,
            onChanged: (v) => received = v,
          ),
        ),
      );
      await tester.drag(find.byType(Slider), const Offset(100, 0));
      await tester.pump();
      expect(received, isNotNull);
    });
  });

  // ── ChromiaListTileRangeSlider ────────────────────────────────────────────────

  group('ChromiaListTileRangeSlider', () {
    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileRangeSlider(
            values: const RangeValues(0.2, 0.8),
            onChanged: (_) {},
          ),
        ),
      );
      expect(find.byType(ChromiaListTileRangeSlider), findsOneWidget);
    });

    testWidgets('renders with title without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaListTileRangeSlider(
            values: const RangeValues(0.2, 0.8),
            onChanged: (_) {},
            title: const Text('Price range'),
          ),
        ),
      );
      expect(find.text('Price range'), findsOneWidget);
    });

    testWidgets('renders disabled without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaListTileRangeSlider(
            values: RangeValues(0.2, 0.8),
            onChanged: null,
            enabled: false,
          ),
        ),
      );
      expect(find.byType(ChromiaListTileRangeSlider), findsOneWidget);
    });
  });
}
