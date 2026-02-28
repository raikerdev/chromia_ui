import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/blocs/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleScaffold extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ExampleScaffold({required this.title, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final themeState = context.watch<ThemeCubit>().state;

    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final colors = theme.colors;

    return Scaffold(
      appBar: ChromiaAppBar(
        title: title,
        actions: [
          IconButton(
            icon: Icon(themeState.isDark ? Icons.light_mode : Icons.dark_mode, color: colors.textPrimary),
            onPressed: themeCubit.toggleTheme,
            tooltip: 'Toggle theme',
          ),
          spacing.gapHM,
        ],
      ),
      body: SingleChildScrollView(
        padding: spacing.paddingL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
