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

// ── ChromiaTooltip ────────────────────────────────────────────────────────────

void main() {
  group('ChromiaTooltip', () {
    testWidgets('renders child widget without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTooltip(
            message: 'Help text',
            child: Icon(Icons.info_outline),
          ),
        ),
      );
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
    });

    testWidgets('passes message to underlying Tooltip', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTooltip(
            message: 'My tooltip message',
            child: Icon(Icons.help),
          ),
        ),
      );

      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip).first);
      expect(tooltip.message, 'My tooltip message');
    });

    testWidgets('preferBelow is forwarded to underlying Tooltip', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTooltip(
            message: 'Above',
            preferBelow: false,
            child: Icon(Icons.help),
          ),
        ),
      );

      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip).first);
      expect(tooltip.preferBelow, isFalse);
    });

    testWidgets('renders with all sizes without crash', (tester) async {
      for (final icon in [Icons.info, Icons.help, Icons.warning]) {
        await tester.pumpWidget(
          buildTestApp(
            ChromiaTooltip(message: 'tip', child: Icon(icon)),
          ),
        );
        expect(find.byType(ChromiaTooltip), findsOneWidget);
      }
    });
  });

  // ── ChromiaTooltip.rich ───────────────────────────────────────────────────

  group('ChromiaTooltip.rich', () {
    testWidgets('renders child widget without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaTooltip.rich(
            title: 'Title',
            message: 'Details here',
            child: const Icon(Icons.info_outline),
          ),
        ),
      );
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
    });

    testWidgets('wraps underlying Tooltip widget', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaTooltip.rich(
            title: 'Help',
            message: 'Some info',
            child: const Icon(Icons.help),
          ),
        ),
      );
      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('preferBelow is forwarded to underlying Tooltip', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaTooltip.rich(
            title: 'Title',
            message: 'Msg',
            preferBelow: false,
            child: const Icon(Icons.help),
          ),
        ),
      );

      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip).first);
      expect(tooltip.preferBelow, isFalse);
    });
  });

  // ── ChromiaLongPressTooltip ───────────────────────────────────────────────

  group('ChromiaLongPressTooltip', () {
    testWidgets('renders child widget without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaLongPressTooltip(
            message: 'Long press tip',
            child: Icon(Icons.touch_app),
          ),
        ),
      );
      expect(find.byIcon(Icons.touch_app), findsOneWidget);
    });

    testWidgets('shows overlay with message on long press', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaLongPressTooltip(
            message: 'Long press tip',
            child: Icon(Icons.touch_app),
          ),
        ),
      );

      await tester.longPress(find.byIcon(Icons.touch_app));
      await tester.pump();

      expect(find.text('Long press tip'), findsOneWidget);

      // Drain the auto-hide timer (default duration = 2 s) so no pending
      // timers leak into subsequent tests.
      await tester.pump(const Duration(seconds: 3));
    });
  });

  // ── ChromiaHelpIcon ───────────────────────────────────────────────────────

  group('ChromiaHelpIcon', () {
    testWidgets('renders with default help icon without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaHelpIcon(message: 'Help me'),
        ),
      );
      expect(find.byIcon(Icons.help_outline), findsOneWidget);
    });

    testWidgets('renders with custom icon', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaHelpIcon(
            message: 'Info',
            icon: Icons.info_outline,
          ),
        ),
      );
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
    });

    testWidgets('passes message to inner ChromiaTooltip', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaHelpIcon(message: 'Tooltip here'),
        ),
      );

      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip).first);
      expect(tooltip.message, 'Tooltip here');
    });
  });
}
