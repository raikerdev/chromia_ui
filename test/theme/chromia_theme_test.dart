import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // ── ChromiaThemeData ────────────────────────────────────────────────────────

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
      const brandConfig = ChromiaBrandConfig(
        name: 'Test Brand',
        colorConfig: ChromiaBrandColorConfig(
          primaryLight: Color(0xFFFF0000),
        ),
      );
      final theme = ChromiaThemeData.fromBrand(brandConfig);

      expect(theme.brandConfig, brandConfig);
      expect(theme.brandConfig?.name, 'Test Brand');
      expect(
        theme.brandConfig?.colorConfig.primaryLight,
        const Color(0xFFFF0000),
      );
    });

    test('creates dark theme from brand config', () {
      const brandConfig = ChromiaBrandConfig(
        name: 'Test Brand',
        colorConfig: ChromiaBrandColorConfig(
          primaryLight: Color(0xFFFF0000),
        ),
      );
      final theme = ChromiaThemeData.fromBrand(brandConfig, isDark: true);

      expect(theme.isDark, true);
      expect(theme.brightness, Brightness.dark);
    });

    test('copyWith creates new instance with updated values', () {
      final theme1 = ChromiaThemeData.light();
      final theme2 = theme1.copyWith(brightness: Brightness.dark);

      expect(theme1.brightness, Brightness.light);
      expect(theme2.brightness, Brightness.dark);
      // colors are preserved when only brightness changes
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

  // ── ChromiaColors ───────────────────────────────────────────────────────────

  group('ChromiaColors', () {
    test('creates light color scheme', () {
      final colors = ChromiaColors.light();

      expect(colors.primary, isNotNull);
      expect(colors.onPrimary, isNotNull);
      expect(colors.surface, isNotNull);
      expect(colors.error, isNotNull);
      expect(colors.success, isNotNull);
      expect(colors.warning, isNotNull);
    });

    test('creates dark color scheme', () {
      final colors = ChromiaColors.dark();

      expect(colors.primary, isNotNull);
      expect(colors.onPrimary, isNotNull);
      expect(colors.surface, isNotNull);
      expect(colors.isDark, true);
    });

    test('creates color scheme from brand color config', () {
      final colors = ChromiaColors.fromBrandColorConfig(
        const ChromiaBrandColorConfig(primaryLight: Color(0xFFFF0000)),
      );

      expect(colors.primary, const Color(0xFFFF0000));
    });

    test('copyWith creates new instance with updated colors', () {
      final colors1 = ChromiaColors.light();
      final colors2 = colors1.copyWith(primary: const Color(0xFFFF0000));

      expect(colors1.primary, isNot(const Color(0xFFFF0000)));
      expect(colors2.primary, const Color(0xFFFF0000));
      // unchanged fields carry over
      expect(colors1.secondary, colors2.secondary);
    });
  });

  // ── ChromiaTypography ───────────────────────────────────────────────────────

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

  // ── ChromiaSpacing ──────────────────────────────────────────────────────────

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

  // ── ChromiaRadius ───────────────────────────────────────────────────────────

  group('ChromiaRadius', () {
    test('creates default radius values', () {
      final radius = ChromiaRadius.defaultRadius();

      expect(radius.none, 0.0);
      expect(radius.xs, 2.0);
      expect(radius.s, 4.0);
      expect(radius.m, 8.0);
      expect(radius.l, 12.0);
      expect(radius.xl, 16.0);
      expect(radius.full, 9999.0);
    });

    test('creates BorderRadius getters correctly', () {
      final radius = ChromiaRadius.defaultRadius();

      expect(radius.radiusM, BorderRadius.circular(8.0));
      expect(radius.radiusL, BorderRadius.circular(12.0));
    });

    test('creates shapes correctly', () {
      final radius = ChromiaRadius.defaultRadius();

      expect(radius.shapeM, isA<RoundedRectangleBorder>());
      expect(radius.shapeM.borderRadius, BorderRadius.circular(8.0));
    });
  });

  // ── ChromiaShadows ──────────────────────────────────────────────────────────

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

  // ── ChromiaBrandConfig ──────────────────────────────────────────────────────

  group('ChromiaBrandConfig', () {
    test('creates brand config with required parameters', () {
      const brand = ChromiaBrandConfig(
        name: 'Test Brand',
        colorConfig: ChromiaBrandColorConfig(
          primaryLight: Color(0xFFFF0000),
        ),
      );

      expect(brand.name, 'Test Brand');
      expect(brand.colorConfig.primaryLight, const Color(0xFFFF0000));
      expect(brand.typographyConfig, isNull);
    });

    test('creates brand config with custom colors', () {
      const brand = ChromiaBrandConfig(
        name: 'Test Brand',
        colorConfig: ChromiaBrandColorConfig(
          primaryLight: Color(0xFFFF0000),
          customColors: {
            'accent': Color(0xFF00FF00),
            'highlight': Color(0xFF0000FF),
          },
        ),
      );

      expect(brand.getCustomColor('accent'), const Color(0xFF00FF00));
      expect(brand.getCustomColor('highlight'), const Color(0xFF0000FF));
      expect(brand.getCustomColor('nonexistent'), isNull);
    });

    test('copyWith creates new instance', () {
      const brand1 = ChromiaBrandConfig(
        name: 'Brand 1',
        colorConfig: ChromiaBrandColorConfig(
          primaryLight: Color(0xFFFF0000),
        ),
      );
      final brand2 = brand1.copyWith(name: 'Brand 2');

      expect(brand1.name, 'Brand 1');
      expect(brand2.name, 'Brand 2');
      // colorConfig is unchanged
      expect(brand1.colorConfig.primaryLight, brand2.colorConfig.primaryLight);
    });

    test('predefined brands are available', () {
      expect(BrandConfigs.chromia.name, 'Default Chromia Brand');
      expect(BrandConfigs.all, isNotEmpty);
      expect(BrandConfigs.all.length, greaterThan(1));
    });
  });

  // ── ChromiaTheme Widget ─────────────────────────────────────────────────────

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
        Directionality(
          textDirection: TextDirection.ltr,
          child: ChromiaTheme(
            data: theme1,
            child: Builder(
              builder: (context) {
                final theme = ChromiaTheme.of(context);
                return Text(theme.brightness.toString());
              },
            ),
          ),
        ),
      );

      expect(find.text('Brightness.light'), findsOneWidget);

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: ChromiaTheme(
            data: theme2,
            child: Builder(
              builder: (context) {
                final theme = ChromiaTheme.of(context);
                return Text(theme.brightness.toString());
              },
            ),
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

  // ── lerp ────────────────────────────────────────────────────────────────────

  group('ChromiaThemeData.lerp', () {
    test('lerp at t=0 equals a', () {
      final a = ChromiaThemeData.light();
      final b = ChromiaThemeData.dark();
      final result = ChromiaThemeData.lerp(a, b, 0.0);

      expect(result.brightness, Brightness.light);
      expect(result.colors.primary, a.colors.primary);
      expect(result.spacing.m, a.spacing.m);
      expect(result.radius.m, a.radius.m);
    });

    test('lerp at t=1 equals b', () {
      final a = ChromiaThemeData.light();
      final b = ChromiaThemeData.dark();
      final result = ChromiaThemeData.lerp(a, b, 1.0);

      expect(result.brightness, Brightness.dark);
      expect(result.colors.primary, b.colors.primary);
      expect(result.spacing.m, b.spacing.m);
      expect(result.radius.m, b.radius.m);
    });

    test('brightness switches at t=0.5', () {
      final a = ChromiaThemeData.light();
      final b = ChromiaThemeData.dark();

      expect(ChromiaThemeData.lerp(a, b, 0.499).brightness, Brightness.light);
      expect(ChromiaThemeData.lerp(a, b, 0.5).brightness, Brightness.dark);
    });

    test('colors are interpolated at t=0.5', () {
      final a = ChromiaThemeData.light();
      final b = ChromiaThemeData.dark();
      final mid = ChromiaThemeData.lerp(a, b, 0.5);

      // Midpoint color must be strictly between the endpoints (not equal to either).
      expect(mid.colors.surface, isNot(a.colors.surface));
      expect(mid.colors.surface, isNot(b.colors.surface));
    });
  });

  group('ChromiaColors.lerp', () {
    test('lerp at t=0 returns a colors', () {
      final a = ChromiaColors.light();
      final b = ChromiaColors.dark();
      final result = ChromiaColors.lerp(a, b, 0.0);

      expect(result.primary, a.primary);
      expect(result.surface, a.surface);
      expect(result.error, a.error);
    });

    test('lerp at t=1 returns b colors', () {
      final a = ChromiaColors.light();
      final b = ChromiaColors.dark();
      final result = ChromiaColors.lerp(a, b, 1.0);

      expect(result.primary, b.primary);
      expect(result.surface, b.surface);
      expect(result.error, b.error);
    });

    test('lerp at t=0.5 produces intermediate color', () {
      const black = Color(0xFF000000);
      const white = Color(0xFFFFFFFF);
      final a = ChromiaColors.light().copyWith(surface: black);
      final b = ChromiaColors.light().copyWith(surface: white);
      final mid = ChromiaColors.lerp(a, b, 0.5);

      // Flutter 3.27+: Color.r/g/b return doubles in [0.0, 1.0].
      // 50% between black and white → ~0.5 (≈ 128/255).
      expect(mid.surface.r, closeTo(0.5, 0.01));
      expect(mid.surface.g, closeTo(0.5, 0.01));
      expect(mid.surface.b, closeTo(0.5, 0.01));
    });
  });

  group('ChromiaSpacing.lerp', () {
    test('lerp at t=0 returns a spacing', () {
      final a = ChromiaSpacing.defaultSpacing();
      final b = a.copyWith(m: 100.0);
      expect(ChromiaSpacing.lerp(a, b, 0.0).m, a.m);
    });

    test('lerp at t=1 returns b spacing', () {
      final a = ChromiaSpacing.defaultSpacing();
      final b = a.copyWith(m: 100.0);
      expect(ChromiaSpacing.lerp(a, b, 1.0).m, 100.0);
    });

    test('lerp at t=0.5 produces midpoint', () {
      final a = ChromiaSpacing.defaultSpacing().copyWith(m: 0.0);
      final b = ChromiaSpacing.defaultSpacing().copyWith(m: 100.0);
      expect(ChromiaSpacing.lerp(a, b, 0.5).m, closeTo(50.0, 0.001));
    });
  });

  group('ChromiaRadius.lerp', () {
    test('lerp at t=0 returns a radius', () {
      final a = ChromiaRadius.defaultRadius();
      final b = a.copyWith(m: 100.0);
      expect(ChromiaRadius.lerp(a, b, 0.0).m, a.m);
    });

    test('lerp at t=1 returns b radius', () {
      final a = ChromiaRadius.defaultRadius();
      final b = a.copyWith(m: 100.0);
      expect(ChromiaRadius.lerp(a, b, 1.0).m, 100.0);
    });

    test('lerp at t=0.5 produces midpoint', () {
      final a = ChromiaRadius.defaultRadius().copyWith(m: 0.0);
      final b = ChromiaRadius.defaultRadius().copyWith(m: 100.0);
      expect(ChromiaRadius.lerp(a, b, 0.5).m, closeTo(50.0, 0.001));
    });
  });

  group('ChromiaShadows.lerp', () {
    test('lerp at t=0 returns a shadows', () {
      final a = ChromiaShadows.light();
      final b = ChromiaShadows.dark();
      final result = ChromiaShadows.lerp(a, b, 0.0);

      expect(result.s.first.color, a.s.first.color);
    });

    test('lerp at t=1 returns b shadows', () {
      final a = ChromiaShadows.light();
      final b = ChromiaShadows.dark();
      final result = ChromiaShadows.lerp(a, b, 1.0);

      expect(result.s.first.color, b.s.first.color);
    });
  });

  group('ChromiaTypography.lerp', () {
    test('lerp at t=0 returns a text styles', () {
      final a = ChromiaTypography.defaultTypography();
      final b = a.copyWith(
        bodyMedium: a.bodyMedium.copyWith(fontSize: 100.0),
      );
      expect(
        ChromiaTypography.lerp(a, b, 0.0).bodyMedium.fontSize,
        a.bodyMedium.fontSize,
      );
    });

    test('lerp at t=1 returns b text styles', () {
      final a = ChromiaTypography.defaultTypography();
      final b = a.copyWith(
        bodyMedium: a.bodyMedium.copyWith(fontSize: 100.0),
      );
      expect(ChromiaTypography.lerp(a, b, 1.0).bodyMedium.fontSize, 100.0);
    });
  });

  // ── ChromiaTheme.maybeOf ────────────────────────────────────────────────────

  group('ChromiaTheme.maybeOf', () {
    testWidgets('returns null when no ancestor', (tester) async {
      ChromiaThemeData? result;

      await tester.pumpWidget(
        Builder(
          builder: (context) {
            result = ChromiaTheme.maybeOf(context);
            return const SizedBox();
          },
        ),
      );

      expect(result, isNull);
    });

    testWidgets('returns theme data when ancestor is present', (tester) async {
      final theme = ChromiaThemeData.light();
      ChromiaThemeData? result;

      await tester.pumpWidget(
        ChromiaTheme(
          data: theme,
          child: Builder(
            builder: (context) {
              result = ChromiaTheme.maybeOf(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(result, isNotNull);
      expect(result?.brightness, Brightness.light);
    });
  });

  // ── AnimatedChromiaTheme ────────────────────────────────────────────────────

  group('AnimatedChromiaTheme', () {
    testWidgets('renders without crash', (tester) async {
      await tester.pumpWidget(
        AnimatedChromiaTheme(
          data: ChromiaThemeData.light(),
          child: const SizedBox(),
        ),
      );
      expect(find.byType(AnimatedChromiaTheme), findsOneWidget);
    });

    testWidgets('provides theme to descendants', (tester) async {
      ChromiaThemeData? received;

      await tester.pumpWidget(
        AnimatedChromiaTheme(
          data: ChromiaThemeData.light(),
          child: Builder(
            builder: (context) {
              received = ChromiaTheme.of(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(received, isNotNull);
    });

    testWidgets('transitions to new theme after pumpAndSettle', (tester) async {
      Brightness? captured;

      // Start with light theme.
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: AnimatedChromiaTheme(
            data: ChromiaThemeData.light(),
            duration: const Duration(milliseconds: 100),
            child: Builder(
              builder: (context) {
                captured = ChromiaTheme.of(context).brightness;
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      expect(captured, Brightness.light);

      // Switch to dark theme and settle the animation.
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: AnimatedChromiaTheme(
            data: ChromiaThemeData.dark(),
            duration: const Duration(milliseconds: 100),
            child: Builder(
              builder: (context) {
                captured = ChromiaTheme.of(context).brightness;
                return const SizedBox();
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(captured, Brightness.dark);
    });
  });

  // ── ColorUtils ──────────────────────────────────────────────────────────────

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
        greaterThan(ColorUtils.getLuminance(color)),
      );
    });

    test('darkens color', () {
      const color = Color(0xFF808080);
      final darkened = ColorUtils.darken(color, 0.2);

      expect(darkened, isNot(color));
      expect(
        ColorUtils.getLuminance(darkened),
        lessThan(ColorUtils.getLuminance(color)),
      );
    });

    test('converts hex to color', () {
      expect(ColorUtils.fromHex('#FF0000'), const Color(0xFFFF0000));
      expect(ColorUtils.fromHex('FF0000'), const Color(0xFFFF0000));
      expect(ColorUtils.fromHex('#80FF0000'), const Color(0x80FF0000));
    });

    test('converts color to hex', () {
      // default: includeAlpha is false
      expect(ColorUtils.toHex(const Color(0xFFFF0000)), '#FF0000');
      expect(
        ColorUtils.toHex(const Color(0xFFFF0000), includeAlpha: true),
        '#FFFF0000',
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

  // ── PlatformDetector ────────────────────────────────────────────────────────

  group('PlatformDetector', () {
    test('detects platform type', () {
      expect(PlatformDetector.platformName, isNotEmpty);
      expect(
        PlatformDetector.isWeb ||
            PlatformDetector.isMobile ||
            PlatformDetector.isDesktop,
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

  // ── debugFillProperties ─────────────────────────────────────────────────────

  group('ChromiaThemeData.debugFillProperties', () {
    test('exposes brightness property', () {
      final theme = ChromiaThemeData.light();
      final builder = DiagnosticPropertiesBuilder();
      theme.debugFillProperties(builder);

      final names = builder.properties.map((p) => p.name).toList();
      expect(names, contains('brightness'));
    });

    test('exposes colors, typography, spacing, radius, shadows', () {
      final theme = ChromiaThemeData.light();
      final builder = DiagnosticPropertiesBuilder();
      theme.debugFillProperties(builder);

      final names = builder.properties.map((p) => p.name).toList();
      expect(
        names,
        containsAll(['colors', 'typography', 'spacing', 'radius', 'shadows']),
      );
    });

    test('brandConfig property is included in properties list', () {
      final theme = ChromiaThemeData.light();
      final builder = DiagnosticPropertiesBuilder();
      theme.debugFillProperties(builder);

      final names = builder.properties.map((p) => p.name).toList();
      expect(names, contains('brandConfig'));
    });

    test('ChromiaColors exposes key color properties', () {
      final colors = ChromiaThemeData.light().colors;
      final builder = DiagnosticPropertiesBuilder();
      colors.debugFillProperties(builder);

      final names = builder.properties.map((p) => p.name).toList();
      expect(names, containsAll(['brightness', 'primary', 'surface']));
    });

    test('ChromiaSpacing exposes spacing values', () {
      final spacing = ChromiaThemeData.light().spacing;
      final builder = DiagnosticPropertiesBuilder();
      spacing.debugFillProperties(builder);

      final names = builder.properties.map((p) => p.name).toList();
      expect(names, containsAll(['xs', 's', 'm', 'l']));
    });

    test('ChromiaRadius exposes radius values', () {
      final radius = ChromiaThemeData.light().radius;
      final builder = DiagnosticPropertiesBuilder();
      radius.debugFillProperties(builder);

      final names = builder.properties.map((p) => p.name).toList();
      expect(names, containsAll(['s', 'm', 'l', 'full']));
    });

    testWidgets('ChromiaTheme widget exposes data property', (tester) async {
      final themeData = ChromiaThemeData.light();
      await tester.pumpWidget(
        ChromiaTheme(
          data: themeData,
          child: const SizedBox(),
        ),
      );

      final chromiaTheme = tester.widget<ChromiaTheme>(
        find.byType(ChromiaTheme),
      );
      final builder = DiagnosticPropertiesBuilder();
      chromiaTheme.debugFillProperties(builder);

      final names = builder.properties.map((p) => p.name).toList();
      expect(names, contains('data'));
    });
  });
}
