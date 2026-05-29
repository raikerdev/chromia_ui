import 'dart:async';

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

/// Builds a Scaffold with [ChromiaAppBar] as the appBar.
Widget buildAppBarApp(ChromiaAppBar appBar) {
  return MaterialApp(
    home: ChromiaTheme(
      data: ChromiaThemeData.light(),
      child: Scaffold(appBar: appBar, body: const SizedBox()),
    ),
  );
}

// ── ChromiaAppBar ─────────────────────────────────────────────────────────────

void main() {
  group('ChromiaAppBar', () {
    testWidgets('renders with title without crash', (tester) async {
      await tester.pumpWidget(
        buildAppBarApp(
          const ChromiaAppBar(title: 'My App'),
        ),
      );
      expect(find.text('My App'), findsOneWidget);
    });

    testWidgets('renders with custom title widget without crash', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildAppBarApp(
          const ChromiaAppBar(titleWidget: Text('Custom Title')),
        ),
      );
      expect(find.text('Custom Title'), findsOneWidget);
    });

    testWidgets('renders with action buttons without crash', (tester) async {
      await tester.pumpWidget(
        buildAppBarApp(
          ChromiaAppBar(
            title: 'App',
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            ],
          ),
        ),
      );
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('calls onBackPressed when back arrow tapped', (tester) async {
      int count = 0;
      final navKey = GlobalKey<NavigatorState>();

      // Build a root route first.
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navKey,
          home: ChromiaTheme(
            data: ChromiaThemeData.light(),
            child: const Scaffold(body: Text('Home')),
          ),
        ),
      );

      // Push a detail route so canPop becomes true → back button appears.
      unawaited(navKey.currentState!.push(
        MaterialPageRoute<void>(
          builder: (ctx) => ChromiaTheme(
            data: ChromiaThemeData.light(),
            child: Scaffold(
              appBar: ChromiaAppBar(
                title: 'Detail',
                onBackPressed: () => count++,
              ),
              body: const SizedBox(),
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pump();
      expect(count, 1);
    });

    testWidgets('no back arrow rendered at root route', (tester) async {
      // canPop is false at root — ChromiaAppBar should not render the arrow.
      await tester.pumpWidget(
        buildAppBarApp(
          const ChromiaAppBar(title: 'App', showBackButton: true),
        ),
      );
      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });

    testWidgets('preferredSize has correct height', (tester) async {
      const appBar = ChromiaAppBar(title: 'App');
      expect(appBar.preferredSize.height, greaterThan(0));
    });
  });

  // ── ChromiaBottomNavigationBar ─────────────────────────────────────────────

  group('ChromiaBottomNavigationBar', () {
    final List<ChromiaBottomNavigationItem> items = [
      const ChromiaBottomNavigationItem(icon: Icons.home, label: 'Home'),
      const ChromiaBottomNavigationItem(icon: Icons.explore, label: 'Explore'),
      const ChromiaBottomNavigationItem(icon: Icons.person, label: 'Profile'),
    ];

    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChromiaTheme(
            data: ChromiaThemeData.light(),
            child: Scaffold(
              bottomNavigationBar: ChromiaBottomNavigationBar(
                items: items,
                currentIndex: 0,
                onTap: (_) {},
              ),
              body: const SizedBox(),
            ),
          ),
        ),
      );
      expect(find.byType(ChromiaBottomNavigationBar), findsOneWidget);
    });

    testWidgets('renders all item labels', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChromiaTheme(
            data: ChromiaThemeData.light(),
            child: Scaffold(
              bottomNavigationBar: ChromiaBottomNavigationBar(
                items: items,
                currentIndex: 0,
                onTap: (_) {},
              ),
              body: const SizedBox(),
            ),
          ),
        ),
      );
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Explore'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('calls onTap with correct index when item tapped', (
      tester,
    ) async {
      int? tappedIndex;
      await tester.pumpWidget(
        MaterialApp(
          home: ChromiaTheme(
            data: ChromiaThemeData.light(),
            child: Scaffold(
              bottomNavigationBar: ChromiaBottomNavigationBar(
                items: items,
                currentIndex: 0,
                onTap: (i) => tappedIndex = i,
              ),
              body: const SizedBox(),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Explore'));
      await tester.pump();
      expect(tappedIndex, 1);
    });

    testWidgets('renders with showLabels=false without crash', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChromiaTheme(
            data: ChromiaThemeData.light(),
            child: Scaffold(
              bottomNavigationBar: ChromiaBottomNavigationBar(
                items: items,
                currentIndex: 0,
                onTap: (_) {},
                showLabels: false,
              ),
              body: const SizedBox(),
            ),
          ),
        ),
      );
      expect(find.byType(ChromiaBottomNavigationBar), findsOneWidget);
    });
  });
}
