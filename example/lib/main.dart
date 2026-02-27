import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:chromia_ui_example/presentation/blocs/theme/theme_cubit.dart';
import 'package:chromia_ui_example/presentation/screens/display/display_screen.dart';
import 'package:chromia_ui_example/presentation/screens/feedback/feedback_screen.dart';
import 'package:chromia_ui_example/presentation/screens/input/input_screen.dart';
import 'package:chromia_ui_example/presentation/screens/layout/layout_screen.dart';
import 'package:chromia_ui_example/presentation/screens/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ExampleMultiBlocProvider());
}

class ExampleMultiBlocProvider extends StatelessWidget {
  const ExampleMultiBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: const ChromiaUIExampleApp(),
    );
  }
}

class ChromiaUIExampleApp extends StatelessWidget {
  const ChromiaUIExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();

    return ChromiaTheme(
      data: ChromiaThemeData.fromBrand(
        themeCubit.state.selectedBrand,
        isDark: themeCubit.state.isDark,
      ),
      child: Builder(
        builder: (context) {
          final theme = context.chromiaTheme;
          return MaterialApp.router(
            title: 'Chromia UI Example',
            debugShowCheckedModeBanner: false,
            theme: theme.toMaterialTheme(),
            routerConfig: _router,
          );
        },
      ),
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ...mapRoutes(homeRoutes),
    GoRoute(
      path: '/display',
      pageBuilder: (context, state) => const MaterialPage(child: DisplayScreen()),
      routes: mapRoutes(displayRoutes).toList(),
    ),
    GoRoute(
      path: '/feedback',
      pageBuilder: (context, state) => const MaterialPage(child: FeedbackScreen()),
      routes: mapRoutes(feedbackRoutes).toList(),
    ),
    GoRoute(
      path: '/input',
      pageBuilder: (context, state) => const MaterialPage(child: InputScreen()),
      routes: mapRoutes(inputRoutes).toList(),
    ),
    GoRoute(
      path: '/layout',
      pageBuilder: (context, state) => const MaterialPage(child: LayoutScreen()),
      routes: mapRoutes(layoutRoutes).toList(),
    ),
    GoRoute(
      path: '/navigation',
      pageBuilder: (context, state) => const MaterialPage(child: NavigationScreen()),
      routes: mapRoutes(navigationRoutes).toList(),
    ),
  ],
);

Iterable<GoRoute> mapRoutes(List<ScreenRoute> routes) {
  return routes.map(
    (route) => GoRoute(
      path: route.path,
      pageBuilder: (context, state) => MaterialPage(child: route.child),
    ),
  );
}
