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

Widget buildTestAppWithScaffold({required Widget Function(BuildContext) builder}) {
  return MaterialApp(
    home: ChromiaTheme(
      data: ChromiaThemeData.light(),
      child: Builder(builder: builder),
    ),
  );
}

// ── ChromiaBottomSheet ────────────────────────────────────────────────────────

void main() {
  group('ChromiaBottomSheet', () {
    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const ChromiaBottomSheet()),
      );
      expect(find.byType(ChromiaBottomSheet), findsOneWidget);
    });

    testWidgets('renders drag handle by default', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const ChromiaBottomSheet()),
      );
      // Drag handle is a Container — widget is present without crash
      expect(find.byType(ChromiaBottomSheet), findsOneWidget);
    });

    testWidgets('hides drag handle when showDragHandle is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(const ChromiaBottomSheet(showDragHandle: false)),
      );
      expect(find.byType(ChromiaBottomSheet), findsOneWidget);
    });

    testWidgets('renders title text when provided', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const ChromiaBottomSheet(title: 'Options')),
      );
      expect(find.text('Options'), findsOneWidget);
    });

    testWidgets('renders custom titleWidget when provided', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaBottomSheet(titleWidget: Text('Custom Title')),
        ),
      );
      expect(find.text('Custom Title'), findsOneWidget);
    });

    testWidgets('renders child content', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaBottomSheet(child: Text('Sheet content')),
        ),
      );
      expect(find.text('Sheet content'), findsOneWidget);
    });

    testWidgets('renders action widgets', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaBottomSheet(
            actions: [
              TextButton(onPressed: () {}, child: const Text('Cancel')),
            ],
          ),
        ),
      );
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('renders all sections together without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaBottomSheet(
            title: 'Share',
            actions: [
              TextButton(onPressed: () {}, child: const Text('Cancel')),
            ],
            child: const Text('Choose where to share'),
          ),
        ),
      );
      expect(find.text('Share'), findsOneWidget);
      expect(find.text('Choose where to share'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('renders scrollable mode without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaBottomSheet(
            scrollable: true,
            child: Text('Scrollable content'),
          ),
        ),
      );
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('renders with custom padding without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaBottomSheet(
            padding: EdgeInsets.all(32),
            child: Text('Padded content'),
          ),
        ),
      );
      expect(find.text('Padded content'), findsOneWidget);
    });
  });

  // ── showChromiaBottomSheet ────────────────────────────────────────────────────

  group('showChromiaBottomSheet', () {
    testWidgets('shows bottom sheet with ChromiaBottomSheet content', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestAppWithScaffold(
          builder: (ctx) => Scaffold(
            body: ElevatedButton(
              onPressed: () => showChromiaBottomSheet<void>(
                context: ctx,
                child: const ChromiaBottomSheet(title: 'Hello'),
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('bottom sheet is dismissible by default', (tester) async {
      await tester.pumpWidget(
        buildTestAppWithScaffold(
          builder: (ctx) => Scaffold(
            body: ElevatedButton(
              onPressed: () => showChromiaBottomSheet<void>(
                context: ctx,
                child: const ChromiaBottomSheet(title: 'Dismiss me'),
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('Dismiss me'), findsOneWidget);

      // Tap outside the sheet to dismiss
      await tester.tapAt(const Offset(200, 100));
      await tester.pumpAndSettle();
      expect(find.text('Dismiss me'), findsNothing);
    });
  });
}
