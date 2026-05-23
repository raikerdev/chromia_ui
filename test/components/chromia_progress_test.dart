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

// ── ChromiaCircularProgress ───────────────────────────────────────────────────

void main() {
  group('ChromiaCircularProgress', () {
    testWidgets('renders indeterminate without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaCircularProgress(),
      ));
      expect(find.byType(ChromiaCircularProgress), findsOneWidget);
    });

    testWidgets('renders determinate value without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaCircularProgress(value: 0.7),
      ));
      expect(find.byType(ChromiaCircularProgress), findsOneWidget);
    });

    testWidgets('renders with label at 0%', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaCircularProgress(value: 0.0, showLabel: true),
      ));
      expect(find.text('0%'), findsOneWidget);
    });

    testWidgets('renders with label at 70%', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaCircularProgress(value: 0.7, showLabel: true),
      ));
      expect(find.text('70%'), findsOneWidget);
    });

    testWidgets('renders with child widget without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaCircularProgress(
          child: Icon(Icons.check),
        ),
      ));
      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('renders with custom size without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaCircularProgress(value: 0.5, size: 80),
      ));
      expect(find.byType(ChromiaCircularProgress), findsOneWidget);
    });
  });

  // ── ChromiaLinearProgress ─────────────────────────────────────────────────────

  group('ChromiaLinearProgress', () {
    testWidgets('renders indeterminate without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(width: 200, child: ChromiaLinearProgress()),
      ));
      expect(find.byType(ChromiaLinearProgress), findsOneWidget);
    });

    testWidgets('renders determinate value without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(width: 200, child: ChromiaLinearProgress(value: 0.5)),
      ));
      expect(find.byType(ChromiaLinearProgress), findsOneWidget);
    });

    testWidgets('renders at 0% without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(width: 200, child: ChromiaLinearProgress(value: 0.0)),
      ));
      expect(find.byType(ChromiaLinearProgress), findsOneWidget);
    });

    testWidgets('renders at 100% without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(width: 200, child: ChromiaLinearProgress(value: 1.0)),
      ));
      expect(find.byType(ChromiaLinearProgress), findsOneWidget);
    });

    testWidgets('renders with custom height without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(
          width: 200,
          child: ChromiaLinearProgress(value: 0.5, height: 12),
        ),
      ));
      expect(find.byType(ChromiaLinearProgress), findsOneWidget);
    });
  });

  // ── ChromiaSteppedProgress ────────────────────────────────────────────────────

  group('ChromiaSteppedProgress', () {
    testWidgets('renders with first step active without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(
          width: 200,
          child: ChromiaSteppedProgress(currentStep: 0, totalSteps: 4),
        ),
      ));
      expect(find.byType(ChromiaSteppedProgress), findsOneWidget);
    });

    testWidgets('renders with all steps active without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(
          width: 200,
          child: ChromiaSteppedProgress(currentStep: 3, totalSteps: 4),
        ),
      ));
      expect(find.byType(ChromiaSteppedProgress), findsOneWidget);
    });

    testWidgets('renders with single step without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(
          width: 200,
          child: ChromiaSteppedProgress(currentStep: 0, totalSteps: 1),
        ),
      ));
      expect(find.byType(ChromiaSteppedProgress), findsOneWidget);
    });

    testWidgets('renders correct number of step segments', (tester) async {
      const int total = 5;
      await tester.pumpWidget(buildTestApp(
        const SizedBox(
          width: 300,
          child: ChromiaSteppedProgress(currentStep: 2, totalSteps: total),
        ),
      ));
      // Each step is an Expanded widget in a Row
      expect(find.byType(Expanded), findsNWidgets(total));
    });
  });
}
