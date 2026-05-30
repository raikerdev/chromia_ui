import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/blocs/theme/theme_cubit.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ─── Screen ───────────────────────────────────────────────────────────────────

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final spacing = context.chromiaTheme.spacing;

    return ExampleScaffold(
      title: 'Design Tokens',
      children: [
        _BrandSelector(selectedBrand: themeState.selectedBrand),
        spacing.gapVXXL,
        const _ColorPaletteSection(),
        spacing.gapVXXL,
        const _TypographySection(),
        spacing.gapVXXL,
        const _SpacingSection(),
        spacing.gapVXXL,
        const _RadiusSection(),
        SizedBox(height: spacing.xxl),
      ],
    );
  }
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

String _hexOf(Color c) {
  final r = (c.r * 255).round();
  final g = (c.g * 255).round();
  final b = (c.b * 255).round();
  return '#'
      '${r.toRadixString(16).padLeft(2, '0')}'
      '${g.toRadixString(16).padLeft(2, '0')}'
      '${b.toRadixString(16).padLeft(2, '0')}'
      .toUpperCase();
}

Color _contrastFor(Color bg) =>
    bg.computeLuminance() > 0.35 ? const Color(0xFF1C1C1E) : const Color(0xFFFFFFFF);

// ─── Shared section header ────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaTheme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChromiaText(
          title,
          type: ChromiaTypographyType.headlineSmall,
          color: colors.onSurface,
        ),
        if (subtitle != null) ...[
          spacing.gapVXS,
          ChromiaText(
            subtitle!,
            type: ChromiaTypographyType.bodySmall,
            color: colors.onSurfaceVariant,
          ),
        ],
      ],
    );
  }
}

// ─── 1. Brand Selector ────────────────────────────────────────────────────────

class _BrandSelector extends StatelessWidget {
  const _BrandSelector({required this.selectedBrand});

  final ChromiaBrandConfig selectedBrand;

  @override
  Widget build(BuildContext context) {
    final spacing = context.chromiaTheme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          title: 'Brand',
          subtitle: 'Switch brands to see every token update live.',
        ),
        spacing.gapVL,
        Wrap(
          spacing: spacing.m,
          runSpacing: spacing.m,
          children: BrandConfigs.all.map((brand) {
            final isSelected = brand.name == selectedBrand.name;
            return _BrandCard(
              brand: brand,
              isSelected: isSelected,
              onTap: () => context.read<ThemeCubit>().changeBrand(brand),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _BrandCard extends StatelessWidget {
  const _BrandCard({
    required this.brand,
    required this.isSelected,
    required this.onTap,
  });

  final ChromiaBrandConfig brand;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final spacing = theme.spacing;
    final radius = theme.radius;
    final primary = brand.colorConfig.primaryLight;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AnimationTokens.fast,
        curve: AnimationTokens.easeOut,
        width: 148,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: radius.radiusXXL,
          border: Border.all(
            color: isSelected ? colors.primary : colors.outline,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected ? theme.shadows.s : theme.shadows.xs,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Color strip
            Container(
              height: 60,
              decoration: BoxDecoration(color: primary),
              child: isSelected
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: _contrastFor(primary).withAlpha(30),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          size: 16,
                          color: _contrastFor(primary),
                        ),
                      ),
                    )
                  : null,
            ),
            // Label row
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: spacing.m,
                vertical: spacing.s,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChromiaText(
                          brand.name,
                          type: ChromiaTypographyType.labelMedium,
                          color: isSelected ? colors.primary : colors.onSurface,
                        ),
                        ChromiaText(
                          _hexOf(primary),
                          type: ChromiaTypographyType.caption,
                          color: colors.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── 2. Color Palette ─────────────────────────────────────────────────────────

class _SwatchData {
  const _SwatchData(this.name, this.color);
  final String name;
  final Color color;
}

class _ColorPaletteSection extends StatelessWidget {
  const _ColorPaletteSection();

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaTheme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          title: 'Color Palette',
          subtitle: 'Semantic roles — brand-agnostic and dark-mode aware.',
        ),
        spacing.gapVL,
        _ColorGroup(
          label: 'PRIMARY',
          swatches: [
            _SwatchData('primary', colors.primary),
            _SwatchData('onPrimary', colors.onPrimary),
            _SwatchData('primaryContainer', colors.primaryContainer),
            _SwatchData('onPrimaryContainer', colors.onPrimaryContainer),
          ],
        ),
        spacing.gapVM,
        _ColorGroup(
          label: 'SECONDARY',
          swatches: [
            _SwatchData('secondary', colors.secondary),
            _SwatchData('onSecondary', colors.onSecondary),
            _SwatchData('secondaryContainer', colors.secondaryContainer),
            _SwatchData('onSecondaryContainer', colors.onSecondaryContainer),
          ],
        ),
        spacing.gapVM,
        _ColorGroup(
          label: 'SEMANTIC',
          swatches: [
            _SwatchData('error', colors.error),
            _SwatchData('errorContainer', colors.errorContainer),
            _SwatchData('success', colors.success),
            _SwatchData('successContainer', colors.successContainer),
            _SwatchData('warning', colors.warning),
            _SwatchData('warningContainer', colors.warningContainer),
            _SwatchData('info', colors.info),
            _SwatchData('infoContainer', colors.infoContainer),
          ],
        ),
        spacing.gapVM,
        _ColorGroup(
          label: 'SURFACE',
          swatches: [
            _SwatchData('surface', colors.surface),
            _SwatchData('surfaceContainer', colors.surfaceContainer),
            _SwatchData('onSurface', colors.onSurface),
            _SwatchData('onSurfaceVariant', colors.onSurfaceVariant),
            _SwatchData('outline', colors.outline),
            _SwatchData('outlineVariant', colors.outlineVariant),
          ],
        ),
      ],
    );
  }
}

class _ColorGroup extends StatelessWidget {
  const _ColorGroup({required this.label, required this.swatches});

  final String label;
  final List<_SwatchData> swatches;

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaTheme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: colors.onSurfaceVariant,
            letterSpacing: 1.4,
          ),
        ),
        SizedBox(height: spacing.xs),
        Wrap(
          spacing: spacing.xs,
          runSpacing: spacing.xs,
          children: swatches.map((s) => _ColorSwatch(swatch: s)).toList(),
        ),
      ],
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({required this.swatch});

  final _SwatchData swatch;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final radius = theme.radius;
    final spacing = theme.spacing;

    final fg = _contrastFor(swatch.color);
    final hex = _hexOf(swatch.color);
    final lum = swatch.color.computeLuminance();
    // Subtle border for very light or very dark colors to define edges
    final showBorder = lum > 0.88 || lum < 0.03;

    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: radius.radiusL,
        border: Border.all(
          color: colors.outline.withAlpha(30),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Color fill
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: swatch.color,
              border: showBorder
                  ? Border(
                      bottom: BorderSide(
                        color: colors.outline.withAlpha(60),
                      ),
                    )
                  : null,
            ),
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(spacing.xxs + 2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              decoration: BoxDecoration(
                color: fg.withAlpha(28),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                hex,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: fg,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
          // Token name
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: spacing.xs,
              vertical: spacing.xs,
            ),
            child: Text(
              swatch.name,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: colors.onSurfaceVariant,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 3. Typography ────────────────────────────────────────────────────────────

class _TypeEntry {
  const _TypeEntry(this.name, this.style, this.sample, this.specs, this.group);
  final String name;
  final TextStyle style;
  final String sample;
  final String specs;
  final String group;
}

class _TypographySection extends StatelessWidget {
  const _TypographySection();

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final typo = theme.typography;
    final spacing = theme.spacing;
    final colors = context.chromiaColors;

    final entries = [
      _TypeEntry('Display Large', typo.displayLarge, 'Aa', '57 · Regular · −0.02em', 'DISPLAY'),
      _TypeEntry('Display Medium', typo.displayMedium, 'Aa', '45 · Regular · −0.02em', 'DISPLAY'),
      _TypeEntry('Display Small', typo.displaySmall, 'Aa', '36 · Regular · −0.02em', 'DISPLAY'),
      _TypeEntry('Headline Large', typo.headlineLarge, 'The quick brown fox', '32 · SemiBold · −0.02em', 'HEADLINE'),
      _TypeEntry('Headline Medium', typo.headlineMedium, 'The quick brown fox', '28 · SemiBold · −0.02em', 'HEADLINE'),
      _TypeEntry('Headline Small', typo.headlineSmall, 'The quick brown fox', '24 · SemiBold · −0.02em', 'HEADLINE'),
      _TypeEntry('Title Large', typo.titleLarge, 'The quick brown fox jumps', '22 · Medium', 'TITLE'),
      _TypeEntry('Title Medium', typo.titleMedium, 'The quick brown fox jumps over', '16 · Medium', 'TITLE'),
      _TypeEntry('Title Small', typo.titleSmall, 'The quick brown fox jumps over the lazy dog', '14 · Medium', 'TITLE'),
      _TypeEntry('Body Large', typo.bodyLarge, 'The quick brown fox jumps over the lazy dog.', '16 · Regular', 'BODY'),
      _TypeEntry('Body Medium', typo.bodyMedium, 'The quick brown fox jumps over the lazy dog.', '14 · Regular', 'BODY'),
      _TypeEntry('Body Small', typo.bodySmall, 'The quick brown fox jumps over the lazy dog.', '12 · Regular', 'BODY'),
      _TypeEntry('Label Large', typo.labelLarge, 'BUTTON LABEL', '14 · Medium · +0.5', 'LABEL'),
      _TypeEntry('Label Medium', typo.labelMedium, 'Chip · Tag', '12 · Medium · +0.5', 'LABEL'),
      _TypeEntry('Label Small', typo.labelSmall, 'Small label', '11 · Medium · +0.5', 'LABEL'),
      _TypeEntry('Caption', typo.caption, 'Footer note or caption text here', '12 · Regular', 'MISC'),
      _TypeEntry('Overline', typo.overline, 'SECTION CATEGORY', '10 · Medium · +1.5', 'MISC'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          title: 'Typography',
          subtitle: 'Plus Jakarta Sans · 17 styles · negative tracking on display & headlines',
        ),
        spacing.gapVL,
        // Render entries, grouping with a divider label at each group change
        ...() {
          final widgets = <Widget>[];
          String? lastGroup;
          for (int i = 0; i < entries.length; i++) {
            final e = entries[i];
            if (e.group != lastGroup) {
              if (i > 0) {
                widgets.add(spacing.gapVS);
              }
              widgets.add(
                Padding(
                  padding: EdgeInsets.only(bottom: spacing.xs),
                  child: Text(
                    e.group,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: colors.onSurfaceVariant,
                      letterSpacing: 1.4,
                    ),
                  ),
                ),
              );
              lastGroup = e.group;
            }
            widgets.add(_TypeRow(entry: e));
            if (i < entries.length - 1) {
              widgets.add(
                Divider(
                  height: 1,
                  thickness: 0.5,
                  color: colors.outline.withAlpha(50),
                ),
              );
            }
          }
          return widgets;
        }(),
      ],
    );
  }
}

class _TypeRow extends StatelessWidget {
  const _TypeRow({required this.entry});

  final _TypeEntry entry;

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final spacing = context.chromiaSpacing;
    final radius = context.chromiaRadius;

    return Container(
      margin: EdgeInsets.only(bottom: spacing.s),
      padding: spacing.paddingL,
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: radius.radiusM,
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChromiaText(
                  entry.name,
                  type: ChromiaTypographyType.labelMedium,
                  color: colors.primary,
                ),
                ChromiaText(
                  entry.specs,
                  type: ChromiaTypographyType.labelSmall,
                  color: colors.onSurfaceVariant,
                ),
              ],
            ),
          ),
          Expanded(
            child: ChromiaText(
              'The quick brown fox',
              style: entry.style.copyWith(color: colors.onSurface),
              color: colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 4. Spacing ───────────────────────────────────────────────────────────────

class _SpacingSection extends StatelessWidget {
  const _SpacingSection();

  @override
  Widget build(BuildContext context) {
    final spacing = context.chromiaTheme.spacing;

    const steps = [
      ('xxs', 2.0),
      ('xs', 4.0),
      ('s', 8.0),
      ('m', 12.0),
      ('l', 16.0),
      ('xl', 20.0),
      ('xxl', 24.0),
      ('xxxl', 32.0),
      ('huge', 40.0),
      ('xhuge', 48.0),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          title: 'Spacing',
          subtitle: 'Base-4 scale — 10 steps from 2 px to 48 px',
        ),
        spacing.gapVL,
        ...steps.map(
          (step) => _SpacingBar(
            label: step.$1,
            value: step.$2,
            isLast: step == steps.last,
          ),
        ),
      ],
    );
  }
}

class _SpacingBar extends StatelessWidget {
  const _SpacingBar({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  final String label;
  final double value;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final spacing = theme.spacing;
    final radius = theme.radius;

    // Scale bar: 48px (xhuge) maps to ~200px visual width
    final barWidth = (value / 48.0) * 200.0;

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : spacing.xxs),
      child: Row(
        children: [
          SizedBox(
            width: 42,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: colors.onSurface,
                letterSpacing: 0.1,
              ),
            ),
          ),
          SizedBox(
            width: 44,
            child: Text(
              '${value.toInt()} px',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 10,
                color: colors.onSurfaceVariant,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
          spacing.gapHM,
          AnimatedContainer(
            duration: AnimationTokens.fast,
            curve: AnimationTokens.easeOut,
            width: barWidth,
            height: 22,
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: radius.radiusS,
              border: Border.all(
                color: colors.primary.withAlpha(60),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: null,
          ),
        ],
      ),
    );
  }
}

// ─── 5. Border Radius ─────────────────────────────────────────────────────────

class _RadiusSection extends StatelessWidget {
  const _RadiusSection();

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final radius = theme.radius;
    final spacing = theme.spacing;

    final steps = [
      ('none', radius.none),
      ('xs', radius.xs),
      ('s', radius.s),
      ('m', radius.m),
      ('l', radius.l),
      ('xl', radius.xl),
      ('xxl', radius.xxl),
      ('full', radius.full),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          title: 'Border Radius',
          subtitle: '8 levels — sharp to pill',
        ),
        spacing.gapVL,
        Wrap(
          spacing: spacing.l,
          runSpacing: spacing.l,
          children: steps
              .map((s) => _RadiusTile(label: s.$1, value: s.$2))
              .toList(),
        ),
      ],
    );
  }
}

class _RadiusTile extends StatelessWidget {
  const _RadiusTile({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = context.chromiaColors;
    final spacing = theme.spacing;
    // Clamp so the visual square doesn't go full-circle at 9999
    final clampedRadius = value.clamp(0.0, 36.0);
    final isPill = value >= 9999;

    return Column(
      children: [
        // Preview square
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: isPill
                ? BorderRadius.circular(30) // full circle for pill
                : BorderRadius.circular(clampedRadius),
            border: Border.all(
              color: colors.primary.withAlpha(80),
              width: 1.5,
            ),
          ),
        ),
        SizedBox(height: spacing.xs),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: colors.onSurface,
          ),
        ),
        Text(
          isPill ? '∞ pill' : '${value.toInt()} px',
          style: TextStyle(
            fontSize: 9,
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
