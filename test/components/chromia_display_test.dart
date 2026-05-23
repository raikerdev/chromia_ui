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

// ── ChromiaText ───────────────────────────────────────────────────────────────

void main() {
  group('ChromiaText', () {
    testWidgets('renders text without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaText('Hello', type: ChromiaTypographyType.bodyMedium),
      ));
      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('renders all typography types without crash', (tester) async {
      for (final type in ChromiaTypographyType.values) {
        await tester.pumpWidget(buildTestApp(
          ChromiaText('Test', type: type),
        ));
        expect(find.text('Test'), findsOneWidget);
      }
    });

    testWidgets('renders with custom color without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaText(
          'Colored',
          type: ChromiaTypographyType.bodyMedium,
          color: Colors.red,
        ),
      ));
      expect(find.text('Colored'), findsOneWidget);
    });
  });

  // ── ChromiaChip ─────────────────────────────────────────────────────────────

  group('ChromiaChip', () {
    testWidgets('renders basic chip without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaChip(label: 'Flutter'),
      ));
      expect(find.text('Flutter'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      int count = 0;
      await tester.pumpWidget(buildTestApp(
        ChromiaChip(label: 'Tap me', onPressed: () => count++),
      ));
      await tester.tap(find.byType(ChromiaChip));
      await tester.pump();
      expect(count, 1);
    });

    testWidgets('calls onDeleted when delete icon tapped', (tester) async {
      int count = 0;
      await tester.pumpWidget(buildTestApp(
        ChromiaChip(label: 'Delete', onDeleted: () => count++),
      ));
      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();
      expect(count, 1);
    });

    testWidgets('filter chip renders selected state without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaChip.filter(
          label: 'Active',
          selected: true,
          onSelected: (_) {},
        ),
      ));
      expect(find.text('Active'), findsOneWidget);
    });

    testWidgets('filter chip calls onSelected when tapped', (tester) async {
      bool? received;
      await tester.pumpWidget(buildTestApp(
        ChromiaChip.filter(
          label: 'Filter',
          selected: false,
          onSelected: (v) => received = v,
        ),
      ));
      // _ChromiaFilterChip is a private subtype; tap by label text instead.
      await tester.tap(find.text('Filter'));
      await tester.pump();
      expect(received, true);
    });

    testWidgets('choice chip renders without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaChip.choice(
          label: 'Choice',
          selected: false,
          onSelected: () {},
        ),
      ));
      expect(find.text('Choice'), findsOneWidget);
    });

    testWidgets('renders with leading icon without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaChip(label: 'Tagged', icon: Icons.tag),
      ));
      expect(find.byIcon(Icons.tag), findsOneWidget);
    });
  });

  // ── ChromiaBadge ────────────────────────────────────────────────────────────

  group('ChromiaBadge', () {
    testWidgets('renders dot badge without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaBadge(child: Icon(Icons.notifications)),
      ));
      expect(find.byType(ChromiaBadge), findsOneWidget);
    });

    testWidgets('renders badge with value without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaBadge(
          value: '5',
          child: Icon(Icons.notifications),
        ),
      ));
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('hides badge when showBadge is false', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaBadge(
          value: '3',
          showBadge: false,
          child: Icon(Icons.notifications),
        ),
      ));
      expect(find.text('3'), findsNothing);
    });

    testWidgets('shows max+ label when value exceeds maxValue', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaBadge(
          value: '99',
          maxValue: 9,
          child: Icon(Icons.notifications),
        ),
      ));
      expect(find.text('9+'), findsOneWidget);
    });
  });

  // ── ChromiaLabelBadge ───────────────────────────────────────────────────────

  group('ChromiaLabelBadge', () {
    testWidgets('renders with text without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaLabelBadge(text: 'Beta'),
      ));
      expect(find.text('Beta'), findsOneWidget);
    });

    testWidgets('renders with icon without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaLabelBadge(text: 'New', icon: Icons.fiber_new),
      ));
      expect(find.byIcon(Icons.fiber_new), findsOneWidget);
    });

    testWidgets('calls onRemove when remove tapped', (tester) async {
      int count = 0;
      await tester.pumpWidget(buildTestApp(
        ChromiaLabelBadge(text: 'Tag', onRemove: () => count++),
      ));
      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();
      expect(count, 1);
    });
  });

  // ── ChromiaStatusBadge ──────────────────────────────────────────────────────

  group('ChromiaStatusBadge', () {
    testWidgets('renders all status types without crash', (tester) async {
      for (final status in ChromiaStatusType.values) {
        await tester.pumpWidget(buildTestApp(
          ChromiaStatusBadge(status: status, text: status.name),
        ));
        expect(find.byType(ChromiaStatusBadge), findsOneWidget);
      }
    });

    testWidgets('renders with child without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaStatusBadge(
          status: ChromiaStatusType.success,
          child: Icon(Icons.person),
        ),
      ));
      expect(find.byType(ChromiaStatusBadge), findsOneWidget);
    });
  });

  // ── ChromiaAvatar ───────────────────────────────────────────────────────────

  group('ChromiaAvatar', () {
    testWidgets('renders default avatar without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaAvatar(),
      ));
      expect(find.byType(ChromiaAvatar), findsOneWidget);
    });

    testWidgets('renders initials avatar without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaAvatar.initials(initials: 'JD'),
      ));
      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('renders all sizes without crash', (tester) async {
      for (final size in ChromiaAvatarSize.values) {
        await tester.pumpWidget(buildTestApp(
          ChromiaAvatar(size: size),
        ));
        expect(find.byType(ChromiaAvatar), findsOneWidget);
      }
    });

    testWidgets('renders all shapes without crash', (tester) async {
      for (final shape in ChromiaAvatarShape.values) {
        await tester.pumpWidget(buildTestApp(
          ChromiaAvatar(shape: shape),
        ));
        expect(find.byType(ChromiaAvatar), findsOneWidget);
      }
    });

    testWidgets('calls onTap when tapped', (tester) async {
      int count = 0;
      await tester.pumpWidget(buildTestApp(
        ChromiaAvatar(onTap: () => count++),
      ));
      await tester.tap(find.byType(ChromiaAvatar));
      await tester.pump();
      expect(count, 1);
    });
  });

  // ── ChromiaAvatarGroup ──────────────────────────────────────────────────────

  group('ChromiaAvatarGroup', () {
    testWidgets('renders group without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaAvatarGroup(
          avatars: [
            ChromiaAvatar.initials(initials: 'A'),
            ChromiaAvatar.initials(initials: 'B'),
            ChromiaAvatar.initials(initials: 'C'),
          ],
        ),
      ));
      expect(find.byType(ChromiaAvatarGroup), findsOneWidget);
    });

    testWidgets('shows overflow indicator when avatars exceed max', (tester) async {
      await tester.pumpWidget(buildTestApp(
        ChromiaAvatarGroup(
          max: 2,
          avatars: [
            ChromiaAvatar.initials(initials: 'A'),
            ChromiaAvatar.initials(initials: 'B'),
            ChromiaAvatar.initials(initials: 'C'),
          ],
        ),
      ));
      expect(find.text('+1'), findsOneWidget);
    });
  });

  // ── ChromiaListTile ─────────────────────────────────────────────────────────

  group('ChromiaListTile', () {
    testWidgets('renders with title only without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaListTile(title: Text('Title')),
      ));
      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('renders with leading and trailing without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaListTile(
          title: Text('Item'),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.chevron_right),
        ),
      ));
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('renders all variants without crash', (tester) async {
      for (final variant in ChromiaListTileVariant.values) {
        await tester.pumpWidget(buildTestApp(
          ChromiaListTile(
            title: Text(variant.name),
            variant: variant,
          ),
        ));
        expect(find.text(variant.name), findsOneWidget);
      }
    });

    testWidgets('calls onTap when tapped', (tester) async {
      int count = 0;
      await tester.pumpWidget(buildTestApp(
        ChromiaListTile(title: const Text('Tap'), onTap: () => count++),
      ));
      await tester.tap(find.byType(ChromiaListTile));
      await tester.pump();
      expect(count, 1);
    });
  });

  // ── ChromiaCard ─────────────────────────────────────────────────────────────

  group('ChromiaCard', () {
    testWidgets('renders with child without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaCard(child: Text('Card content')),
      ));
      expect(find.text('Card content'), findsOneWidget);
    });

    testWidgets('renders with header and footer without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const ChromiaCard(
          header: Text('Header'),
          footer: Text('Footer'),
          child: Text('Body'),
        ),
      ));
      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);
      expect(find.text('Footer'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      int count = 0;
      await tester.pumpWidget(buildTestApp(
        ChromiaCard(onTap: () => count++, child: const Text('Tap me')),
      ));
      await tester.tap(find.byType(ChromiaCard));
      await tester.pumpAndSettle();
      expect(count, 1);
    });
  });

  // ── ChromiaDivider ──────────────────────────────────────────────────────────

  group('ChromiaDivider', () {
    testWidgets('renders horizontal divider without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(width: 200, child: ChromiaDivider()),
      ));
      expect(find.byType(ChromiaDivider), findsOneWidget);
    });

    testWidgets('renders vertical divider without crash', (tester) async {
      await tester.pumpWidget(buildTestApp(
        const SizedBox(height: 40, child: ChromiaDivider.vertical()),
      ));
      expect(find.byType(ChromiaDivider), findsOneWidget);
    });
  });
}
