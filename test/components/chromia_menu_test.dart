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

List<ChromiaMenuItem<String>> get _items => [
  const ChromiaMenuItem(value: 'edit', label: 'Edit', icon: Icons.edit),
  const ChromiaMenuItem(value: 'share', label: 'Share', icon: Icons.share),
  const ChromiaMenuItem(value: 'delete', label: 'Delete', enabled: false),
];

// ── ChromiaMenuItem ───────────────────────────────────────────────────────────

void main() {
  group('ChromiaMenuItem', () {
    test('divider() factory creates item with isDivider=true', () {
      final item = ChromiaMenuItem<String>.divider();
      expect(item.isDivider, isTrue);
      expect(item.value, isNull);
      expect(item.label, isEmpty);
    });

    test('enabled defaults to true', () {
      const item = ChromiaMenuItem<String>(value: 'a', label: 'A');
      expect(item.enabled, isTrue);
      expect(item.isDivider, isFalse);
    });
  });

  // ── ChromiaPopupMenu ────────────────────────────────────────────────────────

  group('ChromiaPopupMenu', () {
    testWidgets('renders default icon without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaPopupMenu<String>(items: _items, onSelected: (_) {}),
        ),
      );
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('renders with custom icon without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaPopupMenu<String>(
            items: _items,
            onSelected: (_) {},
            icon: Icons.settings,
          ),
        ),
      );
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('renders with custom child without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaPopupMenu<String>(
            items: _items,
            onSelected: (_) {},
            child: const Text('Open menu'),
          ),
        ),
      );
      expect(find.text('Open menu'), findsOneWidget);
    });

    testWidgets('shows all item labels when opened', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaPopupMenu<String>(items: _items, onSelected: (_) {}),
        ),
      );

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('Share'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('calls onSelected with correct value when enabled item tapped', (
      tester,
    ) async {
      String? selected;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaPopupMenu<String>(
            items: _items,
            onSelected: (v) => selected = v,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(selected, 'edit');
    });

    testWidgets('disabled item does not call onSelected', (tester) async {
      String? selected;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaPopupMenu<String>(
            items: _items,
            onSelected: (v) => selected = v,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(selected, isNull);
    });

    testWidgets('shows item icons inside open menu', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaPopupMenu<String>(items: _items, onSelected: (_) {}),
        ),
      );

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.edit), findsOneWidget);
      expect(find.byIcon(Icons.share), findsOneWidget);
    });

    testWidgets('shows trailing widget inside open menu', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaPopupMenu<String>(
            items: [
              ChromiaMenuItem<String>(
                value: 'copy',
                label: 'Copy',
                trailing: const Text('⌘C'),
              ),
            ],
            onSelected: (_) {},
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('⌘C'), findsOneWidget);
    });

    testWidgets('renders divider items inside open menu without crash', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaPopupMenu<String>(
            items: [
              const ChromiaMenuItem(value: 'a', label: 'Action'),
              ChromiaMenuItem<String>.divider(),
              const ChromiaMenuItem(value: 'b', label: 'Other'),
            ],
            onSelected: (_) {},
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('Action'), findsOneWidget);
      expect(find.text('Other'), findsOneWidget);
    });
  });

  // ── ChromiaMenuButton ───────────────────────────────────────────────────────

  group('ChromiaMenuButton', () {
    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaMenuButton<String>(items: _items, onSelected: (_) {}),
        ),
      );
      expect(find.byType(ChromiaMenuButton<String>), findsOneWidget);
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaMenuButton<String>(
            items: _items,
            onSelected: (_) {},
            label: 'Actions',
          ),
        ),
      );
      expect(find.text('Actions'), findsOneWidget);
    });

    testWidgets('renders with leading icon', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaMenuButton<String>(
            items: _items,
            onSelected: (_) {},
            label: 'Options',
            icon: Icons.more_horiz,
          ),
        ),
      );
      expect(find.byIcon(Icons.more_horiz), findsOneWidget);
    });

    testWidgets('shows selected item label when selectedValue is set', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaMenuButton<String>(
            items: _items,
            onSelected: (_) {},
            selectedValue: 'share',
          ),
        ),
      );
      expect(find.text('Share'), findsOneWidget);
    });

    testWidgets('shows item labels when opened', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaMenuButton<String>(
            items: _items,
            onSelected: (_) {},
            label: 'Pick',
          ),
        ),
      );

      await tester.tap(find.text('Pick'));
      await tester.pumpAndSettle();

      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('Share'), findsOneWidget);
    });

    testWidgets('calls onSelected with correct value when item tapped', (
      tester,
    ) async {
      String? selected;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaMenuButton<String>(
            items: _items,
            onSelected: (v) => selected = v,
            label: 'Pick',
          ),
        ),
      );

      await tester.tap(find.text('Pick'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Share'));
      await tester.pumpAndSettle();

      expect(selected, 'share');
    });

    testWidgets('highlights selected item with check icon when menu is open', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaMenuButton<String>(
            items: _items,
            onSelected: (_) {},
            selectedValue: 'edit',
            label: 'Pick',
          ),
        ),
      );

      await tester.tap(find.text('Pick'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });

  // ── ChromiaContextMenu ──────────────────────────────────────────────────────

  group('ChromiaContextMenu', () {
    testWidgets('renders child without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaContextMenu<String>(
            items: _items,
            onSelected: (_) {},
            child: const Text('Long press me'),
          ),
        ),
      );
      expect(find.text('Long press me'), findsOneWidget);
    });

    testWidgets('shows item labels on long press', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaContextMenu<String>(
            items: _items,
            onSelected: (_) {},
            child: const Text('Long press me'),
          ),
        ),
      );

      await tester.longPress(find.text('Long press me'));
      await tester.pumpAndSettle();

      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('Share'), findsOneWidget);
    });

    testWidgets('calls onSelected when item tapped after long press', (
      tester,
    ) async {
      String? selected;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaContextMenu<String>(
            items: _items,
            onSelected: (v) => selected = v,
            child: const Text('Press me'),
          ),
        ),
      );

      await tester.longPress(find.text('Press me'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(selected, 'edit');
    });
  });
}
