import 'package:chromia_ui_example/presentation/screens/badges_screen.dart';
import 'package:chromia_ui_example/presentation/screens/brands_screen.dart';
import 'package:chromia_ui_example/presentation/screens/buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/cards_screen.dart';
import 'package:chromia_ui_example/presentation/screens/checkboxes_screen.dart';
import 'package:chromia_ui_example/presentation/screens/dialogs_screen.dart';
import 'package:chromia_ui_example/presentation/screens/home_screen.dart';
import 'package:chromia_ui_example/presentation/screens/layout_screen.dart';
import 'package:chromia_ui_example/presentation/screens/progress_screen.dart';
import 'package:chromia_ui_example/presentation/screens/radio_buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/sliders_screen.dart';
import 'package:chromia_ui_example/presentation/screens/text_fields_screen.dart';
import 'package:chromia_ui_example/presentation/screens/toggle_buttons_screen.dart';
import 'package:chromia_ui_example/presentation/screens/typography_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ExampleRoute {
  final String title;
  final IconData icon;
  final String path;
  final Widget child;
  final bool navigateWithGo;

  ExampleRoute({
    required this.icon,
    required this.title,
    required this.path,
    required this.child,
    this.navigateWithGo = false,
  });
}

final routes = <ExampleRoute>[
  ExampleRoute(
    title: 'Home',
    icon: Symbols.home_rounded,
    path: '/',
    child: const HomeScreen(),
  ),
  ExampleRoute(
    title: 'Brands',
    icon: Symbols.colors_rounded,
    path: '/brands',
    child: const BrandsScreen(),
  ),
  ExampleRoute(
    title: 'Typography',
    icon: Symbols.custom_typography_rounded,
    path: '/typography',
    child: const TypographyScreen(),
  ),
  ExampleRoute(
    title: 'Cards',
    icon: Symbols.cards_rounded,
    path: '/cards',
    child: const CardsScreen(),
  ),
  ExampleRoute(
    title: 'Text Fields',
    icon: Symbols.text_fields_alt_rounded,
    path: '/text-fields',
    child: const TextFieldsScreen(),
  ),
  ExampleRoute(
    title: 'Buttons',
    icon: Symbols.buttons_alt_rounded,
    path: '/buttons',
    child: const ButtonsScreen(),
  ),
  ExampleRoute(
    title: 'Checkboxes',
    icon: Symbols.check_box_rounded,
    path: '/checkboxes',
    child: const CheckboxesScreen(),
  ),
  ExampleRoute(
    title: 'Toggle Buttons',
    icon: Symbols.switches_rounded,
    path: '/toggle-buttons',
    child: const ToggleButtonsScreen(),
  ),
  ExampleRoute(
    title: 'Radio Buttons',
    icon: Symbols.radio_button_checked_rounded,
    path: '/radio-buttons',
    child: const RadioButtonsScreen(),
  ),
  ExampleRoute(
    title: 'Sliders',
    icon: Symbols.sliders_rounded,
    path: '/sliders',
    child: const SlidersScreen(),
  ),
  ExampleRoute(
    title: 'Progress',
    icon: Symbols.progress_activity_rounded,
    path: '/progress',
    child: const ProgressScreen(),
  ),
  ExampleRoute(
    title: 'Badges',
    icon: Symbols.notifications_unread_rounded,
    path: '/badges',
    child: const BadgesScreen(),
  ),
  ExampleRoute(
    title: 'Dialogs',
    icon: Symbols.dialogs_rounded,
    path: '/dialogs',
    child: const DialogsScreen(),
  ),
  ExampleRoute(
    title: 'Layout',
    icon: Symbols.view_quilt_rounded,
    path: '/layout',
    navigateWithGo: true,
    child: const LayoutScreen(),
  ),
];
