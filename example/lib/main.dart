import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChromiaUIExampleApp());
}

class ChromiaUIExampleApp extends StatefulWidget {
  const ChromiaUIExampleApp({super.key});

  @override
  State<ChromiaUIExampleApp> createState() => _ChromiaUIExampleAppState();
}

class _ChromiaUIExampleAppState extends State<ChromiaUIExampleApp> {
  // Theme mode state
  ThemeMode _themeMode = ThemeMode.light;

  // Selected brand
  BrandConfig _selectedBrand = BrandConfigs.chromia;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _changeBrand(BrandConfig brand) {
    setState(() {
      _selectedBrand = brand;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = _themeMode == ThemeMode.dark;

    return ChromiaTheme(
      data: ChromiaThemeData.fromBrand(_selectedBrand, isDark: isDark),
      child: Builder(
        builder: (context) {
          final theme = context.chromiaTheme;

          return MaterialApp(
            title: 'Chromia UI Example',
            debugShowCheckedModeBanner: false,
            theme: theme.toMaterialTheme(),
            home: HomePage(
              onToggleTheme: _toggleTheme,
              currentThemeMode: _themeMode,
              currentBrand: _selectedBrand,
              onChangeBrand: _changeBrand,
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    required this.onToggleTheme,
    required this.currentThemeMode,
    required this.currentBrand,
    required this.onChangeBrand,
    super.key,
  });

  final VoidCallback onToggleTheme;
  final ThemeMode currentThemeMode;
  final BrandConfig currentBrand;
  final ValueChanged<BrandConfig> onChangeBrand;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    final colors = theme.colors;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        title: Text(
          'Chromia UI Components',
          style: theme.typography.titleLarge.copyWith(
            color: colors.textPrimary,
          ),
        ),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(
              currentThemeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
              color: colors.textPrimary,
            ),
            onPressed: onToggleTheme,
            tooltip: 'Toggle theme',
          ),
          spacing.gapHM,
        ],
      ),
      body: SingleChildScrollView(
        padding: spacing.paddingL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            _buildWelcomeSection(context),
            spacing.gapVXXL,

            // Brand selector section
            _buildBrandSection(context),
            spacing.gapVXXL,

            // Theme info section
            _buildThemeInfoSection(context),
            spacing.gapVXXL,

            // Buttons section
            _buildButtonsSection(context),
            spacing.gapVXXL,

            // Typography section
            _buildTypographySection(context),
            spacing.gapVXXL,

            // Colors section
            _buildColorsSection(context),
            spacing.gapVXXL,

            // Spacing section
            _buildSpacingSection(context),
            spacing.gapVXXL,
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to Chromia UI',
          style: theme.typography.displaySmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVS,
        Text(
          'A comprehensive Flutter UI component library for mobile, desktop, and web.',
          style: theme.typography.bodyLarge.copyWith(
            color: colors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildBrandSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Brand Themes',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVM,
        Text(
          'Select a brand to see the theme change dynamically:',
          style: theme.typography.bodyMedium.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVM,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: BrandConfigs.all.map((brand) {
            final isSelected = brand.name == currentBrand.name;
            return ChromiaButton(
              variant: isSelected ? ChromiaButtonVariant.filled : ChromiaButtonVariant.outlined,
              size: ChromiaButtonSize.small,
              onPressed: () => onChangeBrand(brand),
              child: Text(brand.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildThemeInfoSection(BuildContext context) {
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
          Text(
            'Current Theme',
            style: theme.typography.titleMedium.copyWith(
              color: colors.textPrimary,
            ),
          ),
          spacing.gapVS,
          Text(
            'Brand: ${currentBrand.name}',
            style: theme.typography.bodyMedium.copyWith(
              color: colors.textSecondary,
            ),
          ),
          Text(
            'Mode: ${currentThemeMode == ThemeMode.light ? "Light" : "Dark"}',
            style: theme.typography.bodyMedium.copyWith(
              color: colors.textSecondary,
            ),
          ),
          Text(
            'Platform: ${PlatformDetector.platformName}',
            style: theme.typography.bodyMedium.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Buttons',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVM,

        // Button variants
        Text(
          'Variants',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaButton(
              variant: ChromiaButtonVariant.filled,
              onPressed: () {},
              child: const Text('Filled'),
            ),
            ChromiaButton(
              variant: ChromiaButtonVariant.outlined,
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            ChromiaButton(
              variant: ChromiaButtonVariant.text,
              onPressed: () {},
              child: const Text('Text'),
            ),
            ChromiaButton(
              variant: ChromiaButtonVariant.tonal,
              onPressed: () {},
              child: const Text('Tonal'),
            ),
            ChromiaButton(
              variant: ChromiaButtonVariant.elevated,
              onPressed: () {},
              child: const Text('Elevated'),
            ),
          ],
        ),
        spacing.gapVL,

        // Button sizes
        Text(
          'Sizes',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ChromiaButton(
              size: ChromiaButtonSize.small,
              onPressed: () {},
              child: const Text('Small'),
            ),
            ChromiaButton(
              size: ChromiaButtonSize.medium,
              onPressed: () {},
              child: const Text('Medium'),
            ),
            ChromiaButton(
              size: ChromiaButtonSize.large,
              onPressed: () {},
              child: const Text('Large'),
            ),
          ],
        ),
        spacing.gapVL,

        // Button states
        Text(
          'States',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaButton(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
            ChromiaButton(
              onPressed: null,
              child: const Text('Disabled'),
            ),
            ChromiaButton(
              onPressed: () {},
              isLoading: true,
              child: const Text('Loading'),
            ),
          ],
        ),
        spacing.gapVL,

        // Button with icons
        Text(
          'With Icons',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: [
            ChromiaButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              child: const Text('Leading Icon'),
            ),
            ChromiaButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
              iconPosition: IconPosition.trailing,
              child: const Text('Trailing Icon'),
            ),
          ],
        ),
        spacing.gapVL,

        // Full width button
        Text(
          'Full Width',
          style: theme.typography.titleSmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
        spacing.gapVS,
        ChromiaButton(
          onPressed: () {},
          isFullWidth: true,
          child: const Text('Full Width Button'),
        ),
      ],
    );
  }

  Widget _buildTypographySection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Typography',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
        ),
        spacing.gapVM,
        _TypographyExample(
          label: 'Display Large',
          style: theme.typography.displayLarge,
        ),
        _TypographyExample(
          label: 'Display Medium',
          style: theme.typography.displayMedium,
        ),
        _TypographyExample(
          label: 'Display Small',
          style: theme.typography.displaySmall,
        ),
        _TypographyExample(
          label: 'Headline Large',
          style: theme.typography.headlineLarge,
        ),
        _TypographyExample(
          label: 'Headline Medium',
          style: theme.typography.headlineMedium,
        ),
        _TypographyExample(
          label: 'Headline Small',
          style: theme.typography.headlineSmall,
        ),
        _TypographyExample(
          label: 'Body Large',
          style: theme.typography.bodyLarge,
        ),
        _TypographyExample(
          label: 'Body Medium',
          style: theme.typography.bodyMedium,
        ),
        _TypographyExample(
          label: 'Body Small',
          style: theme.typography.bodySmall,
        ),
      ],
    );
  }

  Widget _buildColorsSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Colors',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
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
        Text(
          'Spacing Scale',
          style: theme.typography.headlineSmall.copyWith(
            color: colors.textPrimary,
          ),
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

class _TypographyExample extends StatelessWidget {
  const _TypographyExample({
    required this.label,
    required this.style,
  });

  final String label;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaSpacing;

    return Padding(
      padding: spacing.verticalS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: colors.textTertiary,
            ),
          ),
          Text(
            'The quick brown fox jumps over the lazy dog',
            style: style.copyWith(color: colors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({
    required this.name,
    required this.color,
  });

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
        Text(
          name,
          style: theme.typography.caption.copyWith(
            color: colors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _SpacingExample extends StatelessWidget {
  const _SpacingExample({
    required this.label,
    required this.value,
  });

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
            child: Text(
              label,
              style: theme.typography.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ),
          spacing.gapHM,
          Container(
            width: value,
            height: 24,
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: theme.radius.radiusS,
            ),
          ),
          spacing.gapHM,
          Text(
            '${value.toInt()}px',
            style: theme.typography.bodySmall.copyWith(
              color: colors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
