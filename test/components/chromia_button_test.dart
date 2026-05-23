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

// ── Tests ─────────────────────────────────────────────────────────────────────

void main() {
  group('ChromiaButton', () {
    // ── Render ────────────────────────────────────────────────────────────────

    testWidgets('renders filled variant without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaButton(
          onPressed: () {},
          child: const Text('Filled'),
        ),
      ));
      expect(find.text('Filled'), findsOneWidget);
    });

    testWidgets('renders all variants without crash', (tester) async {
      for (final variant in ChromiaButtonVariant.values) {
        await tester.pumpWidget(buildTestApp(
          ChromiaButton(
            variant: variant,
            onPressed: () {},
            child: Text(variant.name),
          ),
        ));
        expect(find.text(variant.name), findsOneWidget);
      }
    });

    testWidgets('renders all sizes without crash', (tester) async {
      for (final size in ChromiaButtonSize.values) {
        await tester.pumpWidget(buildTestApp(
          ChromiaButton(
            size: size,
            onPressed: () {},
            child: Text(size.name),
          ),
        ));
        expect(find.text(size.name), findsOneWidget);
      }
    });

    testWidgets('renders disabled when onPressed is null', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaButton(
          onPressed: null,
          child: Text('Disabled'),
        ),
      ));
      expect(find.text('Disabled'), findsOneWidget);
    });

    testWidgets('renders loading indicator when isLoading is true',
        (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaButton(
          onPressed: () {},
          isLoading: true,
          child: const Text('Loading'),
        ),
      ));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders leading icon', (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaButton(
          onPressed: () {},
          icon: const Icon(Icons.star),
          child: const Text('With Icon'),
        ),
      ));
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.text('With Icon'), findsOneWidget);
    });

    testWidgets('renders trailing icon', (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward),
          iconPosition: IconPosition.trailing,
          child: const Text('Trailing'),
        ),
      ));
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    // ── Interaction ───────────────────────────────────────────────────────────

    testWidgets('calls onPressed when tapped', (tester) async {
      int count = 0;

      await tester.pumpWidget(buildTestApp(
        ChromiaButton(
          onPressed: () => count++,
          child: const Text('Tap me'),
        ),
      ));

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(count, 1);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      int count = 0;

      await tester.pumpWidget(buildTestApp(
        ChromiaButton(
          onPressed: null,
          child: const Text('Disabled'),
        ),
      ));

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(count, 0);
    });

    testWidgets('does not call onPressed while loading', (tester) async {
      int count = 0;

      await tester.pumpWidget(buildTestApp(
        ChromiaButton(
          onPressed: () => count++,
          isLoading: true,
          child: const Text('Loading'),
        ),
      ));

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(count, 0);
    });

    testWidgets('calls onLongPress when long pressed', (tester) async {
      int count = 0;

      await tester.pumpWidget(buildTestApp(
        ChromiaButton(
          onPressed: () {},
          onLongPress: () => count++,
          child: const Text('Long press'),
        ),
      ));

      await tester.longPress(find.byType(ChromiaButton));
      await tester.pump();

      expect(count, 1);
    });

    // ── Custom style ──────────────────────────────────────────────────────────

    testWidgets('applies custom style without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaButton(
          onPressed: () {},
          style: const ChromiaButtonStyle(
            backgroundColor: Color(0xFF123456),
            foregroundColor: Colors.white,
          ),
          child: const Text('Custom'),
        ),
      ));
      expect(find.text('Custom'), findsOneWidget);
    });
  });
}
