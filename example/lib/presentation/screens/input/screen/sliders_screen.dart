import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SlidersScreen extends StatefulWidget {
  const SlidersScreen({super.key});

  @override
  State<SlidersScreen> createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SlidersScreen> {
  double _volume = 40;
  double _brightness = 0;
  double _temperature = 16;
  RangeValues _priceRange = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;
    return ExampleScaffold(
      title: 'Sliders',
      children: [
        // Slider section
        _buildSliderSection(context),
        spacing.gapVXXL,
      ],
    );
  }

  Widget _buildSliderSection(BuildContext context) {
    final theme = context.chromiaTheme;
    final colors = theme.colors;
    final spacing = theme.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic slider
        ChromiaText(
          'Basic Slider',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaSlider(
          value: 60,
          min: 0,
          max: 100,
          label: '$_volume%',
          onChanged: null,
        ),
        spacing.gapVS,
        ChromiaSlider(
          value: _volume,
          min: 0,
          max: 100,
          label: '$_volume%',
          onChanged: (value) => setState(() => _volume = value),
        ),
        spacing.gapVL,

        // Customizable slider
        ChromiaText(
          'Customizable Slider',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaSlider(
          value: _volume,
          min: 0,
          max: 100,
          activeColor: Colors.red,
          inactiveColor: Colors.green,
          thumbColor: Colors.amber,
          thumbRadius: 5,
          onChanged: (value) => setState(() => _volume = value),
        ),
        spacing.gapVS,
        ChromiaSlider(
          value: _volume,
          min: 0,
          max: 100,
          thumbIcon: Icons.star,
          thumbRadius: 16,
          onChanged: (value) => setState(() => _volume = value),
        ),
        spacing.gapVS,
        ChromiaSlider(
          value: _volume,
          min: 0,
          max: 100,
          trackHeight: 16,
          onChanged: (value) => setState(() => _volume = value),
        ),
        spacing.gapVL,

        // With value display
        ChromiaText(
          'With Labels & Value Display',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaSlider(
          value: _brightness,
          min: 0,
          max: 100,
          minLabel: 'Min',
          maxLabel: 'Max',
          valueBuilder: (value) => '${value.toInt()}%',
          onChanged: (value) => setState(() => _brightness = value),
        ),
        spacing.gapVL,

        // With divisions
        ChromiaText(
          'With Divisions',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaSlider(
          value: _temperature,
          min: 16,
          max: 30,
          divisions: 14,
          valueBuilder: (value) => '${value.toInt()}°C',
          onChanged: (value) => setState(() => _temperature = value),
        ),
        spacing.gapVL,

        // Range slider
        ChromiaText(
          'Range Slider',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        ChromiaRangeSlider(
          values: _priceRange,
          min: 0,
          max: 100,
          divisions: 20,
          thumbRadius: 16,
          showValues: true,
          startThumbIcon: Icons.favorite,
          endThumbIcon: Icons.star,
          valueBuilder: (value) => '\$${value.toInt()}',
          onChanged: (values) => setState(() => _priceRange = values),
        ),
        spacing.gapVL,

        // Slider tiles
        ChromiaText(
          'Slider Tiles',
          type: ChromiaTypographyType.headlineSmall,
          color: colors.textPrimary,
        ),
        spacing.gapVS,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: colors.border),
            borderRadius: theme.radius.radiusM,
          ),
          child: Column(
            children: [
              ChromiaListTileSlider(
                value: _volume,
                min: 0,
                max: 100,
                divisions: 10,
                enabled: false,
                title: 'Volume',
                subtitle: 'Adjust system volume',
                valueBuilder: (value) => '${value.toInt()}%',
                onChanged: (value) => setState(() => _volume = value),
              ),
              Divider(height: 1, color: colors.divider),
              ChromiaListTileSlider(
                value: _brightness,
                min: 0,
                max: 100,
                divisions: 10,
                title: 'Brightness',
                thumbIcon: Icons.brightness_7,
                subtitle: 'Adjust screen brightness',
                valueBuilder: (value) => '${value.toInt()}%',
                onChanged: (value) => setState(() => _brightness = value),
              ),
              Divider(height: 1, color: colors.divider),
              ChromiaListTileRangeSlider(
                values: _priceRange,
                min: 0,
                max: 100,
                divisions: 20,
                title: 'Price range',
                subtitle: 'Adjust price range',
                valueBuilder: (value) => '\$${value.toInt()}',
                onChanged: (values) => setState(() => _priceRange = values),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
