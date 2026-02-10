import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChromiaThemeData', () {
    test('creates light theme with default values', () {
      final theme = ChromiaThemeData.light();

      expect(theme.brightness, Brightness.light);
      expect(theme.isLight, true);
      expect(theme.isDark, false);
      expect(theme.colors.primary, isNotNull);
      expect(theme.typography.bodyMedium, isNotNull);
      expect(theme.spacing.m, 12.0);
      expect(theme.radius.m, 8.0);
    });

    test('creates dark theme with default values', () {
      final theme = ChromiaThemeData.dark();

      expect(theme.brightness, Brightness.dark);
      expect(theme.isDark, true);
      expect(theme.isLight, false);
      expect(theme.colors.primary, isNotNull);
      expect(theme.typography.bodyMedium, isNotNull);
    });

    test('creates theme from brand config', () {
      const brandConfig = BrandConfig(
        name: 'Test Brand',
        primaryColor: Color(0xFFFF0000),
      );
      final theme = ChromiaThemeData.fromBrand(brandConfig);

      expect(theme.brandConfig, brandConfig);
      expect(theme.brandConfig?.name, 'Test Brand');
      expect(theme.brandConfig?.primaryColor, const Color(0xFFFF0000));
    });

    test('creates dark theme from brand config', () {
      const brandConfig = BrandConfig(
        name: 'Test Brand',
        primaryColor: Color(0xFFFF0000),
      );
      final theme = ChromiaThemeData.fromBrand(brandConfig, isDark: true);

      expect(theme.isDark, true);
      expect(theme.brightness, Brightness.dark);
    });

    test('copyWith creates new instance with updated values', () {
      final theme1 = ChromiaThemeData.light();
      final theme2 = theme1.copyWith(
        brightness: Brightness.dark,
      );

      expect(theme1.brightness, Brightness.light);
      expect(theme2.brightness, Brightness.dark);
      expect(theme1.colors, theme2.colors);
    });

    test('converts to Material ThemeData', () {
      final chromiaTheme = ChromiaThemeData.light();
      final materialTheme = chromiaTheme.toMaterialTheme();

      expect(materialTheme, isA<ThemeData>());
      expect(materialTheme.brightness, Brightness.light);
      expect(materialTheme.useMaterial3, true);
    });
  });

  group('ChromiaColors', () {
    test('creates light color scheme', () {
      final colors = ChromiaColors.light();

      expect(colors.primary, isNotNull);
      expect(colors.onPrimary, isNotNull);
      expect(colors.background, isNotNull);
      expect(colors.surface, isNotNull);
      expect(colors.error, isNotNull);
      expect(colors.success, isNotNull);
      expect(colors.warning, isNotNull);
    });

    test('creates dark color scheme', () {
      final colors = ChromiaColors.dark();

      expect(colors.primary, isNotNull);
      expect(colors.onPrimary, isNotNull);
      expect(colors.background, isNotNull);
      expect(colors.surface, isNotNull);
    });

    test('creates color scheme from primary color', () {
      final colors = ChromiaColors.fromPrimary(const Color(0xFFFF0000));

      expect(colors.primary, const Color(0xFFFF0000));
      expect(colors.primaryHover, isNot(const Color(0xFFFF0000)));
    });

    test('copyWith creates new instance with updated colors', () {
      final colors1 = ChromiaColors.light();
      final colors2 = colors1.copyWith(
        primary: const Color(0xFFFF0000),
      );

      expect(colors1.primary, isNot(const Color(0xFFFF0000)));
      expect(colors2.primary, const Color(0xFFFF0000));
      expect(colors1.secondary, colors2.secondary);
    });
  });

  group('ChromiaTypography', () {
    test('creates default typography', () {
      final typography = ChromiaTypography.defaultTypography();

      expect(typography.displayLarge, isNotNull);
      expect(typography.displayMedium, isNotNull);
      expect(typography.displaySmall, isNotNull);
      expect(typography.headlineLarge, isNotNull);
      expect(typography.bodyMedium, isNotNull);
      expect(typography.labelSmall, isNotNull);
    });

    test('applies color to all text styles', () {
      final typography = ChromiaTypography.defaultTypography();
      final coloredTypography = typography.apply(color: Colors.red);

      expect(coloredTypography.bodyMedium.color, Colors.red);
      expect(coloredTypography.displayLarge.color, Colors.red);
      expect(coloredTypography.labelSmall.color, Colors.red);
    });
  });

  group('ChromiaSpacing', () {
    test('creates default spacing', () {
      final spacing = ChromiaSpacing.defaultSpacing();

      expect(spacing.none, 0.0);
      expect(spacing.xs, 4.0);
      expect(spacing.s, 8.0);
      expect(spacing.m, 12.0);
      expect(spacing.l, 16.0);
      expect(spacing.xl, 20.0);
      expect(spacing.xxl, 24.0);
    });

    test('creates EdgeInsets correctly', () {
      final spacing = ChromiaSpacing.defaultSpacing();

      expect(spacing.paddingM, const EdgeInsets.all(12.0));
      expect(spacing.horizontalL, const EdgeInsets.symmetric(horizontal: 16.0));
      expect(spacing.verticalS, const EdgeInsets.symmetric(vertical: 8.0));
    });

    test('creates gap SizedBoxes correctly', () {
      final spacing = ChromiaSpacing.defaultSpacing();

      expect(spacing.gapHM.width, 12.0);
      expect(spacing.gapVL.height, 16.0);
    });
  });

  group('ChromiaRadius', () {
    test('creates default radius', () {
      final radius = ChromiaRadius.defaultRadius();

      expect(radius.none, 0.0);
      expect(radius.xs, 2.0);
      expect(radius.s, 4.0);
      expect(radius.m, 8.0);
      expect(radius.l, 12.0);
      expect(radius.xl, 16.0);
      expect(radius.full, 9999.0);
    });

    test('creates BorderRadius correctly', () {
      final radius = ChromiaRadius.defaultRadius();

      expect(radius.radiusM, BorderRadius.circular(8.0));
      expect(radius.radiusL, BorderRadius.circular(12.0));
    });

    test('creates shapes correctly', () {
      final radius = ChromiaRadius.defaultRadius();

      expect(radius.shapeM, isA<RoundedRectangleBorder>());
      expect(
        radius.shapeM.borderRadius,
        BorderRadius.circular(8.0),
      );
    });
  });

  group('ChromiaShadows', () {
    test('creates light shadows', () {
      final shadows = ChromiaShadows.light();

      expect(shadows.none, isEmpty);
      expect(shadows.xs, isNotEmpty);
      expect(shadows.s, isNotEmpty);
      expect(shadows.m, isNotEmpty);
      expect(shadows.l, isNotEmpty);
    });

    test('creates dark shadows', () {
      final shadows = ChromiaShadows.dark();

      expect(shadows.none, isEmpty);
      expect(shadows.xs, isNotEmpty);
      expect(shadows.s, isNotEmpty);
    });
  });

  group('BrandConfig', () {
    test('creates brand config with required parameters', () {
      const brand = BrandConfig(
        name: 'Test Brand',
        primaryColor: Color(0xFFFF0000),
      );

      expect(brand.name, 'Test Brand');
      expect(brand.primaryColor, const Color(0xFFFF0000));
      expect(brand.secondaryColor, isNull);
      expect(brand.logoPath, isNull);
    });

    test('creates brand config with custom colors', () {
      const brand = BrandConfig(
        name: 'Test Brand',
        primaryColor: Color(0xFFFF0000),
        customColors: {
          'accent': Color(0xFF00FF00),
          'highlight': Color(0xFF0000FF),
        },
      );

      expect(brand.getCustomColor('accent'), const Color(0xFF00FF00));
      expect(brand.getCustomColor('highlight'), const Color(0xFF0000FF));
      expect(brand.getCustomColor('nonexistent'), isNull);
    });

    test('copyWith creates new instance', () {
      const brand1 = BrandConfig(
        name: 'Brand 1',
        primaryColor: Color(0xFFFF0000),
      );
      final brand2 = brand1.copyWith(
        name: 'Brand 2',
      );

      expect(brand1.name, 'Brand 1');
      expect(brand2.name, 'Brand 2');
      expect(brand1.primaryColor, brand2.primaryColor);
    });

    test('predefined brands are available', () {
      expect(BrandConfigs.chromia.name, 'Chromia');
      expect(BrandConfigs.all, isNotEmpty);
      expect(BrandConfigs.all.length, greaterThan(1));
    });
  });

  group('ChromiaTheme Widget', () {
    testWidgets('provides theme data to descendants', (tester) async {
      final theme = ChromiaThemeData.light();
      ChromiaThemeData? retrievedTheme;

      await tester.pumpWidget(
        ChromiaTheme(
          data: theme,
          child: Builder(
            builder: (context) {
              retrievedTheme = ChromiaTheme.of(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(retrievedTheme, isNotNull);
      expect(retrievedTheme?.brightness, Brightness.light);
    });

    testWidgets('updates when theme data changes', (tester) async {
      final theme1 = ChromiaThemeData.light();
      final theme2 = ChromiaThemeData.dark();

      await tester.pumpWidget(
        ChromiaTheme(
          data: theme1,
          child: Builder(
            builder: (context) {
              final theme = ChromiaTheme.of(context);
              return Text(theme.brightness.toString());
            },
          ),
        ),
      );

      expect(find.text('Brightness.light'), findsOneWidget);

      await tester.pumpWidget(
        ChromiaTheme(
          data: theme2,
          child: Builder(
            builder: (context) {
              final theme = ChromiaTheme.of(context);
              return Text(theme.brightness.toString());
            },
          ),
        ),
      );

      expect(find.text('Brightness.dark'), findsOneWidget);
    });

    testWidgets('extension methods work correctly', (tester) async {
      final theme = ChromiaThemeData.light();

      await tester.pumpWidget(
        ChromiaTheme(
          data: theme,
          child: Builder(
            builder: (context) {
              expect(context.chromiaTheme, isNotNull);
              expect(context.chromiaColors, isNotNull);
              expect(context.chromiaTypography, isNotNull);
              expect(context.chromiaSpacing, isNotNull);
              expect(context.chromiaRadius, isNotNull);
              expect(context.chromiaShadows, isNotNull);
              expect(context.isLightTheme, true);
              expect(context.isDarkTheme, false);
              return const SizedBox();
            },
          ),
        ),
      );
    });
  });

  group('ColorUtils', () {
    test('detects dark colors correctly', () {
      expect(ColorUtils.isDark(Colors.black), true);
      expect(ColorUtils.isDark(Colors.white), false);
      expect(ColorUtils.isDark(Colors.blue.shade900), true);
    });

    test('gets contrasting color', () {
      expect(ColorUtils.getContrastColor(Colors.black), Colors.white);
      expect(ColorUtils.getContrastColor(Colors.white), Colors.black);
    });

    test('lightens color', () {
      const color = Color(0xFF808080);
      final lightened = ColorUtils.lighten(color, 0.2);

      expect(lightened, isNot(color));
      expect(
        ColorUtils.getLuminance(lightened),
        greaterThan(
          ColorUtils.getLuminance(color),
        ),
      );
    });

    test('darkens color', () {
      const color = Color(0xFF808080);
      final darkened = ColorUtils.darken(color, 0.2);

      expect(darkened, isNot(color));
      expect(
        ColorUtils.getLuminance(darkened),
        lessThan(
          ColorUtils.getLuminance(color),
        ),
      );
    });

    test('converts hex to color', () {
      expect(ColorUtils.fromHex('#FF0000'), const Color(0xFFFF0000));
      expect(ColorUtils.fromHex('FF0000'), const Color(0xFFFF0000));
      expect(ColorUtils.fromHex('#80FF0000'), const Color(0x80FF0000));
    });

    test('converts color to hex', () {
      expect(ColorUtils.toHex(const Color(0xFFFF0000)), '#FFFF0000');
      expect(
        ColorUtils.toHex(const Color(0xFFFF0000), includeAlpha: false),
        '#FF0000',
      );
    });

    test('calculates contrast ratio', () {
      final ratio = ColorUtils.getContrastRatio(Colors.black, Colors.white);
      expect(ratio, greaterThan(1.0));
      expect(ratio, lessThanOrEqualTo(21.0));
    });

    test('checks contrast requirements', () {
      expect(
        ColorUtils.hasContrast(Colors.black, Colors.white, minimumRatio: 4.5),
        true,
      );
      expect(
        ColorUtils.hasContrast(
          Colors.grey.shade800,
          Colors.grey.shade700,
          minimumRatio: 4.5,
        ),
        false,
      );
    });
  });

  group('PlatformDetector', () {
    test('detects platform type', () {
      expect(PlatformDetector.platformName, isNotEmpty);
      expect(
        PlatformDetector.isWeb || PlatformDetector.isMobile || PlatformDetector.isDesktop,
        true,
      );
    });

    test('select returns appropriate value', () {
      final value = PlatformDetector.select(
        mobile: 'mobile',
        desktop: 'desktop',
        web: 'web',
      );

      expect(value, isNotEmpty);
    });
  });
}
