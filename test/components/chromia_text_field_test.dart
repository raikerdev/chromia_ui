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
  group('ChromiaTextField', () {
    // ── Render ────────────────────────────────────────────────────────────────

    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTextField(),
        ),
      );
      expect(find.byType(ChromiaTextField), findsOneWidget);
    });

    testWidgets('displays label text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTextField(label: 'Email'),
        ),
      );
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('displays hint text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTextField(hintText: 'Enter email'),
        ),
      );
      expect(find.text('Enter email'), findsOneWidget);
    });

    testWidgets('displays helper text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTextField(helperText: 'We will never share your email'),
        ),
      );
      expect(find.text('We will never share your email'), findsOneWidget);
    });

    testWidgets('displays error text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTextField(errorText: 'Invalid email'),
        ),
      );
      expect(find.text('Invalid email'), findsOneWidget);
    });

    testWidgets('renders disabled', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTextField(enabled: false, label: 'Disabled field'),
        ),
      );
      expect(find.text('Disabled field'), findsOneWidget);
      // The inner TextField should be disabled
      final tf = tester.widget<TextField>(find.byType(TextField));
      expect(tf.enabled, false);
    });

    testWidgets('renders outlined variant without crash', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTextField(
            variant: ChromiaTextFieldVariant.outlined,
            label: 'Outlined',
          ),
        ),
      );
      expect(find.text('Outlined'), findsOneWidget);
    });

    testWidgets('renders all sizes without crash', (tester) async {
      for (final size in ChromiaTextFieldSize.values) {
        await tester.pumpWidget(
          buildTestApp(
            ChromiaTextField(size: size, label: size.name),
          ),
        );
        expect(find.text(size.name), findsOneWidget);
      }
    });

    testWidgets('renders with prefix icon', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTextField(prefixIcon: Icon(Icons.email)),
        ),
      );
      expect(find.byIcon(Icons.email), findsOneWidget);
    });

    testWidgets('renders with suffix icon', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ChromiaTextField(suffixIcon: Icon(Icons.visibility)),
        ),
      );
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    // ── Interaction ───────────────────────────────────────────────────────────

    testWidgets('calls onChanged when text is entered', (tester) async {
      String? captured;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaTextField(onChanged: (v) => captured = v),
        ),
      );

      await tester.enterText(find.byType(TextField), 'hello');
      await tester.pump();

      expect(captured, 'hello');
    });

    testWidgets('calls onSubmitted when submitted', (tester) async {
      String? submitted;

      await tester.pumpWidget(
        buildTestApp(
          ChromiaTextField(
            onSubmitted: (v) => submitted = v,
            textInputAction: TextInputAction.done,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'test');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(submitted, 'test');
    });

    // ── Validation ────────────────────────────────────────────────────────────

    testWidgets('RequiredValidator shows error on empty input', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaTextField(
            validators: [RequiredValidator('Required')],
          ),
        ),
      );

      // Trigger validation by typing then clearing
      await tester.enterText(find.byType(TextField), 'a');
      await tester.pump();
      await tester.enterText(find.byType(TextField), '');
      await tester.pump();

      expect(find.text('Required'), findsOneWidget);
    });

    testWidgets('RequiredValidator clears error on valid input', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaTextField(
            validators: [RequiredValidator('Required')],
          ),
        ),
      );

      // Trigger the error first
      await tester.enterText(find.byType(TextField), 'a');
      await tester.pump();
      await tester.enterText(find.byType(TextField), '');
      await tester.pump();
      expect(find.text('Required'), findsOneWidget);

      // Then fix it
      await tester.enterText(find.byType(TextField), 'valid');
      await tester.pump();

      expect(find.text('Required'), findsNothing);
    });

    testWidgets('EmailValidator shows error on invalid email', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ChromiaTextField(
            validators: [EmailValidator('Invalid email')],
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'not-an-email');
      await tester.pump();

      expect(find.text('Invalid email'), findsOneWidget);
    });

    testWidgets('maxLength shows character counter', (tester) async {
      final controller = TextEditingController(text: 'hi');

      await tester.pumpWidget(
        buildTestApp(
          ChromiaTextField(controller: controller, maxLength: 10),
        ),
      );

      expect(find.text('2/10'), findsOneWidget);

      controller.dispose();
    });
  });
}
