import 'package:chromia_ui_example/presentation/screens/brands_screen.dart';
import 'package:chromia_ui_example/presentation/screens/display/screen/avatars_screen.dart';
import 'package:chromia_ui_example/presentation/screens/display/screen/badges_screen.dart';
import 'package:chromia_ui_example/presentation/screens/display/screen/chips_screen.dart';
import 'package:chromia_ui_example/presentation/screens/display/screen/typography_screen.dart';
import 'package:chromia_ui_example/presentation/screens/feedback/screen/dialogs_screen.dart';
import 'package:chromia_ui_example/presentation/screens/feedback/screen/progress_screen.dart';
import 'package:chromia_ui_example/presentation/screens/feedback/screen/snack_bars_screen.dart';
import 'package:chromia_ui_example/presentation/screens/feedback/screen/tooltips_screen.dart';
import 'package:chromia_ui_example/presentation/screens/home_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/checkboxes_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/date_pickers_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/dropdowns_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/radio_buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/sliders_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/text_fields_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/screen/toggle_buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/layout/screen/cards_screen.dart';
import 'package:chromia_ui_example/presentation/screens/layout/screen/dividers_screen.dart';
import 'package:chromia_ui_example/presentation/screens/navigation/screen/bottom_navigation_screen.dart';
import 'package:chromia_ui_example/presentation/screens/navigation/screen/layout_screen.dart';
import 'package:chromia_ui_example/presentation/screens/navigation/screen/menus_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ScreenRoute {
  final String title;
  final IconData icon;
  final String path;
  final Widget child;
  final bool navigateWithGo;

  ScreenRoute({
    required this.icon,
    required this.title,
    required this.path,
    this.child = const Placeholder(),
    this.navigateWithGo = false,
  });
}

final homeRoutes = [
  ScreenRoute(
    title: 'Home',
    icon: Symbols.home_rounded,
    path: '/',
    child: const HomeScreen(),
  ),
  ScreenRoute(
    title: 'Brands',
    icon: Symbols.colors_rounded,
    path: '/brands',
    child: const BrandsScreen(),
  ),
];

final displayRoutes = [
  ScreenRoute(
    title: 'Avatars',
    icon: Symbols.account_circle_rounded,
    path: '/avatars',
    child: const AvatarsScreen(),
  ),
  ScreenRoute(
    title: 'Badges',
    icon: Symbols.notifications_unread_rounded,
    path: '/badges',
    child: const BadgesScreen(),
  ),
  ScreenRoute(
    title: 'Chips',
    icon: Symbols.voting_chip_rounded,
    path: '/chips',
    child: const ChipsScreen(),
  ),
  ScreenRoute(
    title: 'Typography',
    icon: Symbols.custom_typography_rounded,
    path: '/typography',
    child: const TypographyScreen(),
  ),
];

final feedbackRoutes = [
  ScreenRoute(
    title: 'Dialogs',
    icon: Symbols.dialogs_rounded,
    path: '/dialogs',
    child: const DialogsScreen(),
  ),
  ScreenRoute(
    title: 'Progress',
    icon: Symbols.progress_activity_rounded,
    path: '/progress',
    child: const ProgressScreen(),
  ),
  ScreenRoute(
    title: 'SnackBars',
    icon: Symbols.toast_rounded,
    path: '/snackBars',
    child: const SnackBarsScreen(),
  ),
  ScreenRoute(
    title: 'Tooltips',
    icon: Symbols.tooltip_rounded,
    path: '/tooltips',
    child: const TooltipsScreen(),
  ),
];

final inputRoutes = [
  ScreenRoute(
    title: 'Buttons',
    icon: Symbols.buttons_alt_rounded,
    path: '/buttons',
    child: const ButtonsScreen(),
  ),
  ScreenRoute(
    title: 'Checkboxes',
    icon: Symbols.check_box_rounded,
    path: '/checkboxes',
    child: const CheckboxesScreen(),
  ),
  ScreenRoute(
    title: 'Date Pickers',
    icon: Symbols.event_rounded,
    path: '/date-pickers',
    child: const DatePickersScreen(),
  ),
  ScreenRoute(
    title: 'Dropdowns',
    icon: Symbols.dropdown_rounded,
    path: '/dropdowns',
    child: const DropdownsScreen(),
  ),
  ScreenRoute(
    title: 'Radio Buttons',
    icon: Symbols.radio_button_checked_rounded,
    path: '/radio-buttons',
    child: const RadioButtonsScreen(),
  ),
  ScreenRoute(
    title: 'Sliders',
    icon: Symbols.sliders_rounded,
    path: '/sliders',
    child: const SlidersScreen(),
  ),
  ScreenRoute(
    title: 'Text Fields',
    icon: Symbols.text_fields_alt_rounded,
    path: '/text-fields',
    child: const TextFieldsScreen(),
  ),
  ScreenRoute(
    title: 'Toggle Buttons',
    icon: Symbols.switches_rounded,
    path: '/toggle-buttons',
    child: const ToggleButtonsScreen(),
  ),
];

final layoutRoutes = [
  ScreenRoute(
    title: 'Cards',
    icon: Symbols.cards_rounded,
    path: '/cards',
    child: const CardsScreen(),
  ),
  ScreenRoute(
    title: 'Dividers',
    icon: Symbols.horizontal_rule_rounded,
    path: '/dividers',
    child: const DividersScreen(),
  ),
];

final navigationRoutes = [
  ScreenRoute(
    title: 'Bottom Navigation',
    icon: Symbols.bottom_navigation_rounded,
    path: '/bottom-navigation',
    child: const BottomNavigationScreen(),
  ),
  ScreenRoute(
    title: 'Layout',
    icon: Symbols.view_quilt_rounded,
    path: '/layout',
    navigateWithGo: true,
    child: const LayoutScreen(),
  ),
  ScreenRoute(
    title: 'Menus',
    icon: Symbols.menu_rounded,
    path: '/menus',
    child: const MenusScreen(),
  ),
];
