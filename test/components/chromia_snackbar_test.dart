import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ── Helper ────────────────────────────────────────────────────────────────────

// Needs a Builder so the context is below MaterialApp (for ScaffoldMessenger)
// and below Scaffold (for snackbar attachment).
Widget buildSnackbarTestApp(Widget Function(BuildContext) builder) {
  return MaterialApp(
    home: ChromiaTheme(
      data: ChromiaThemeData.light(),
      child: Scaffold(body: Builder(builder: builder)),
    ),
  );
}

// ── showChromiaSnackBar ───────────────────────────────────────────────────────

void main() {
  group('showChromiaSnackBar', () {
    testWidgets('shows snack bar with message text', (tester) async {
      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => showChromiaSnackBar(
              context: context,
              message: 'Item saved',
            ),
            child: const Text('Show'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(find.text('Item saved'), findsOneWidget);
    });

    testWidgets('shows action button with correct label', (tester) async {
      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => showChromiaSnackBar(
              context: context,
              message: 'Deleted',
              actionLabel: 'Undo',
              onActionPressed: () {},
            ),
            child: const Text('Show'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(find.text('Deleted'), findsOneWidget);
      expect(find.text('Undo'), findsOneWidget);
    });

    testWidgets('action button calls onActionPressed', (tester) async {
      int count = 0;

      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => showChromiaSnackBar(
              context: context,
              message: 'Done',
              actionLabel: 'Undo',
              onActionPressed: () => count++,
            ),
            child: const Text('Show'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pumpAndSettle(); // wait for slide-in animation to complete
      await tester.tap(find.text('Undo'));
      await tester.pumpAndSettle();

      expect(count, 1);
    });

    testWidgets('shows icon when provided', (tester) async {
      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => showChromiaSnackBar(
              context: context,
              message: 'Done',
              icon: Icons.check,
            ),
            child: const Text('Show'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('shows without icon when not provided', (tester) async {
      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => showChromiaSnackBar(
              context: context,
              message: 'Plain message',
            ),
            child: const Text('Show'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(find.text('Plain message'), findsOneWidget);
    });

    testWidgets('shows without action when actionLabel is null', (tester) async {
      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => showChromiaSnackBar(
              context: context,
              message: 'No action',
            ),
            child: const Text('Show'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(find.byType(SnackBarAction), findsNothing);
    });
  });

  // ── BuildContext extensions ───────────────────────────────────────────────────

  group('ChromiaSnackBarExtension', () {
    testWidgets('showSuccessSnackBar shows snack bar with message', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => context.showSuccessSnackBar(message: 'Saved!'),
            child: const Text('Success'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(find.text('Saved!'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('showErrorSnackBar shows snack bar with message', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => context.showErrorSnackBar(message: 'Failed'),
            child: const Text('Error'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(find.text('Failed'), findsOneWidget);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('showWarningSnackBar shows snack bar with message', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => context.showWarningSnackBar(message: 'Warning!'),
            child: const Text('Warning'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(find.text('Warning!'), findsOneWidget);
      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('showInfoSnackBar shows snack bar with message', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildSnackbarTestApp(
          (context) => ChromiaButton(
            onPressed: () => context.showInfoSnackBar(message: 'FYI'),
            child: const Text('Info'),
          ),
        ),
      );

      await tester.tap(find.byType(ChromiaButton));
      await tester.pump();

      expect(find.text('FYI'), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
    });
  });
}
