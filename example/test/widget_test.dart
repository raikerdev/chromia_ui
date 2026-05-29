import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/blocs/theme/theme_cubit.dart';
import 'package:chromia_ui_example/presentation/screens/display/display_screen.dart';
import 'package:chromia_ui_example/presentation/screens/display/screen/avatars_screen.dart';
import 'package:chromia_ui_example/presentation/screens/display/screen/badges_screen.dart';
import 'package:chromia_ui_example/presentation/screens/display/screen/chips_screen.dart';
import 'package:chromia_ui_example/presentation/screens/display/screen/list_tile_screen.dart';
import 'package:chromia_ui_example/presentation/screens/feedback/feedback_screen.dart';
import 'package:chromia_ui_example/presentation/screens/feedback/screen/dialogs_screen.dart';
import 'package:chromia_ui_example/presentation/screens/feedback/screen/progress_screen.dart';
import 'package:chromia_ui_example/presentation/screens/feedback/screen/snack_bars_screen.dart';
import 'package:chromia_ui_example/presentation/screens/home_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/input_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/checkboxes_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/dropdowns_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/radio_buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/sliders_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/text_fields_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/toggle_buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/layout/layout_screen.dart';
import 'package:chromia_ui_example/presentation/screens/layout/screen/cards_screen.dart';
import 'package:chromia_ui_example/presentation/screens/layout/screen/dividers_screen.dart';
import 'package:chromia_ui_example/presentation/screens/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

// ── Helpers ───────────────────────────────────────────────────────────────────

Widget buildTestApp(Widget child) {
  return MaterialApp(
    home: BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: ChromiaTheme(
        data: ChromiaThemeData.light(),
        child: child,
      ),
    ),
  );
}

/// Pumps [screen] in a 1440×2560 logical viewport so code-preview widgets
/// do not overflow, which would fail the test under the default 800×600 size.
/// Also suppresses network-image load errors so smoke tests pass without
/// a live internet connection.
Future<void> pumpScreen(WidgetTester tester, Widget screen) async {
  tester.view.physicalSize = const Size(1440, 2560);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  final originalOnError = FlutterError.onError;
  FlutterError.onError = (details) {
    if (details.library == 'image resource service') {
      return;
    }
    originalOnError?.call(details);
  };
  addTearDown(() => FlutterError.onError = originalOnError);

  await tester.pumpWidget(buildTestApp(screen));
  await tester.pump();
}

// ── Category screens ──────────────────────────────────────────────────────────

void main() {
  group('HomeScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const HomeScreen());
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('shows welcome text', (tester) async {
      await pumpScreen(tester, const HomeScreen());
      expect(find.text('Welcome to Chromia UI'), findsOneWidget);
    });
  });

  group('DisplayScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const DisplayScreen());
      expect(find.byType(DisplayScreen), findsOneWidget);
    });
  });

  group('FeedbackScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const FeedbackScreen());
      expect(find.byType(FeedbackScreen), findsOneWidget);
    });
  });

  group('InputScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const InputScreen());
      expect(find.byType(InputScreen), findsOneWidget);
    });
  });

  group('LayoutScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const LayoutScreen());
      expect(find.byType(LayoutScreen), findsOneWidget);
    });
  });

  group('NavigationScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const NavigationScreen());
      expect(find.byType(NavigationScreen), findsOneWidget);
    });
  });

  // ── Display component screens ─────────────────────────────────────────────

  group('AvatarsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const AvatarsScreen());
      expect(find.byType(AvatarsScreen), findsOneWidget);
    });

    testWidgets('shows Avatar app-bar title', (tester) async {
      await pumpScreen(tester, const AvatarsScreen());
      expect(find.text('Avatar'), findsOneWidget);
    });
  });

  group('BadgesScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const BadgesScreen());
      expect(find.byType(BadgesScreen), findsOneWidget);
    });

    testWidgets('shows Badge app-bar title', (tester) async {
      await pumpScreen(tester, const BadgesScreen());
      expect(find.text('Badge'), findsOneWidget);
    });
  });

  group('ChipsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const ChipsScreen());
      expect(find.byType(ChipsScreen), findsOneWidget);
    });
  });

  group('ListTileScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const ListTileScreen());
      expect(find.byType(ListTileScreen), findsOneWidget);
    });
  });

  // ── Feedback component screens ────────────────────────────────────────────

  group('DialogsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const DialogsScreen());
      expect(find.byType(DialogsScreen), findsOneWidget);
    });
  });

  group('ProgressScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const ProgressScreen());
      expect(find.byType(ProgressScreen), findsOneWidget);
    });
  });

  group('SnackBarsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const SnackBarsScreen());
      expect(find.byType(SnackBarsScreen), findsOneWidget);
    });
  });

  // ── Input component screens ───────────────────────────────────────────────

  group('ButtonsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const ButtonsScreen());
      expect(find.byType(ButtonsScreen), findsOneWidget);
    });

    testWidgets('shows Button app-bar title', (tester) async {
      await pumpScreen(tester, const ButtonsScreen());
      expect(find.text('Button'), findsOneWidget);
    });
  });

  group('CheckboxesScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const CheckboxesScreen());
      expect(find.byType(CheckboxesScreen), findsOneWidget);
    });
  });

  group('DropdownsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const DropdownsScreen());
      expect(find.byType(DropdownsScreen), findsOneWidget);
    });
  });

  group('RadioButtonsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const RadioButtonsScreen());
      expect(find.byType(RadioButtonsScreen), findsOneWidget);
    });
  });

  group('SlidersScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const SlidersScreen());
      expect(find.byType(SlidersScreen), findsOneWidget);
    });
  });

  group('TextFieldsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const TextFieldsScreen());
      expect(find.byType(TextFieldsScreen), findsOneWidget);
    });
  });

  group('ToggleButtonsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const ToggleButtonsScreen());
      expect(find.byType(ToggleButtonsScreen), findsOneWidget);
    });
  });

  // ── Layout component screens ──────────────────────────────────────────────

  group('CardsScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const CardsScreen());
      expect(find.byType(CardsScreen), findsOneWidget);
    });
  });

  group('DividersScreen', () {
    testWidgets('renders without crash', (tester) async {
      await pumpScreen(tester, const DividersScreen());
      expect(find.byType(DividersScreen), findsOneWidget);
    });
  });

  // ── ThemeCubit ────────────────────────────────────────────────────────────

  group('ThemeCubit', () {
    test('starts in light mode', () {
      final cubit = ThemeCubit();
      expect(cubit.state.isDark, false);
      expect(cubit.state.themeMode, ThemeMode.light);
      cubit.close();
    });

    test('toggleTheme switches to dark', () {
      final cubit = ThemeCubit()..toggleTheme();
      expect(cubit.state.isDark, true);
      expect(cubit.state.themeMode, ThemeMode.dark);
      cubit.close();
    });

    test('toggleTheme twice returns to light', () {
      final cubit = ThemeCubit()
        ..toggleTheme()
        ..toggleTheme();
      expect(cubit.state.isDark, false);
      cubit.close();
    });

    test('changeBrand updates selectedBrand', () {
      final cubit = ThemeCubit()..changeBrand(BrandConfigs.blueTheme);
      expect(cubit.state.selectedBrand, BrandConfigs.blueTheme);
      cubit.close();
    });

    testWidgets('dark mode renders without crash', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit()..toggleTheme(),
            child: ChromiaTheme(
              data: ChromiaThemeData.dark(),
              child: const HomeScreen(),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
