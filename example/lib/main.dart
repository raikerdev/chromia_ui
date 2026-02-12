import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/core/router/routes.dart';
import 'package:chromia_ui_example/presentation/blocs/theme/theme_cubit.dart';
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

final _router = GoRouter(
  initialLocation: '/',
  routes: routes
      .map(
        (route) => GoRoute(
          path: route.path,
          pageBuilder: (context, state) => MaterialPage(child: route.child),
        ),
      )
      .toList(),
);
