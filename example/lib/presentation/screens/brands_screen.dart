import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/blocs/theme/theme_cubit.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return ExampleScaffold(
      title: 'Brands',
      children: [
        // Brand selector section
        _buildBrandSection(context, themeState.selectedBrand),
        spacing.gapVXXL,

        // Theme info section
        _buildThemeInfoSection(context, themeState.selectedBrand, themeState.themeMode),
        spacing.gapVXXL,

        // Colors section
        _buildColorsSection(context),
        spacing.gapVXXL,

        // Spacing section
        _buildSpacingSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildBrandSection(BuildContext context, BrandConfig selectedBrand) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChromiaText(
          'Brand Themes',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVM,
        ChromiaText(
          'Select a brand to see the theme change dynamically:',
          type: ChromiaTypographyType.bodyMedium,
          color: colors.textSecondary,
        ),
        spacing.gapVM,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: BrandConfigs.all.map((brand) {
            final isSelected = brand.name == selectedBrand.name;
            return ChromiaButton(
              variant: isSelected ? ChromiaButtonVariant.filled : ChromiaButtonVariant.outlined,
              size: ChromiaButtonSize.small,
              onPressed: () => context.read<ThemeCubit>().changeBrand(brand),
              child: Text(brand.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildThemeInfoSection(BuildContext context, BrandConfig selectedBrand, ThemeMode themeMode) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Container(
      padding: spacing.paddingL,
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: theme.radius.radiusL,
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChromiaText(
            'Current Theme',
            type: ChromiaTypographyType.titleMedium,
            color: colors.textPrimary,
          ),
          spacing.gapVS,
          ChromiaText(
            'Brand: ${selectedBrand.name}',
            type: ChromiaTypographyType.bodyMedium,
            color: colors.textSecondary,
          ),
          ChromiaText(
            'Mode: ${themeMode == ThemeMode.light ? "Light" : "Dark"}',
            type: ChromiaTypographyType.bodyMedium,
            color: colors.textSecondary,
          ),
          ChromiaText(
            'Platform: ${PlatformDetector.platformName}',
            type: ChromiaTypographyType.bodyMedium,
            color: colors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildColorsSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChromiaText(
          'Colors',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVM,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            _ColorSwatch(name: 'Primary', color: colors.primary),
            _ColorSwatch(name: 'Secondary', color: colors.secondary),
            _ColorSwatch(name: 'Success', color: colors.success),
            _ColorSwatch(name: 'Warning', color: colors.warning),
            _ColorSwatch(name: 'Error', color: colors.error),
            _ColorSwatch(name: 'Info', color: colors.info),
          ],
        ),
      ],
    );
  }

  Widget _buildSpacingSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChromiaText(
          'Spacing Scale',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVM,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SpacingExample(label: 'XS', value: spacing.xs),
            _SpacingExample(label: 'S', value: spacing.s),
            _SpacingExample(label: 'M', value: spacing.m),
            _SpacingExample(label: 'L', value: spacing.l),
            _SpacingExample(label: 'XL', value: spacing.xl),
            _SpacingExample(label: 'XXL', value: spacing.xxl),
          ],
        ),
      ],
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final colors = theme.colors;

    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: theme.radius.radiusM,
            border: Border.all(color: colors.border),
          ),
        ),
        spacing.gapVXS,
        ChromiaText(
          name,
          type: ChromiaTypographyType.caption,
          color: colors.textSecondary,
        ),
      ],
    );
  }
}

class _SpacingExample extends StatelessWidget {
  const _SpacingExample({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Padding(
      padding: spacing.verticalXS,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: ChromiaText(
              label,
              type: ChromiaTypographyType.bodySmall,
              color: colors.textSecondary,
            ),
          ),
          spacing.gapHM,
          Container(
            width: value,
            height: 24,
            decoration: BoxDecoration(color: colors.primary, borderRadius: theme.radius.radiusS),
          ),
          spacing.gapHM,
          ChromiaText(
            '${value.toInt()}px',
            type: ChromiaTypographyType.bodySmall,
            color: colors.textTertiary,
          ),
        ],
      ),
    );
  }
}
