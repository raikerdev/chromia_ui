import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/blocs/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ExampleAppBar({
    this.title = 'Chromia UI Components',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final themeState = context.watch<ThemeCubit>().state;

    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final colors = theme.colors;

    return AppBar(
      backgroundColor: colors.surface,
      elevation: 0,
      title: Text(title, style: theme.typography.titleLarge.copyWith(color: colors.textPrimary)),
      actions: [
        // Theme toggle button
        IconButton(
          icon: Icon(themeState.isDark ? Icons.light_mode : Icons.dark_mode, color: colors.textPrimary),
          onPressed: themeCubit.toggleTheme,
          tooltip: 'Toggle theme',
        ),
        spacing.gapHM,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
