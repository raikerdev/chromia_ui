import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SlidersScreen extends StatelessWidget {
  const SlidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Slider',
      children: [
        ComponentPage(
          description:
              'ChromiaSlider lets users select a numeric value from a continuous '
              'or discrete range. ChromiaRangeSlider supports selecting a range '
              'with two thumbs. Both support custom labels, value display, and '
              'icon thumbs.',
          whenToUse:
              'Use sliders for settings with a continuous range like volume or brightness. '
              'Add divisions for discrete steps (e.g., temperature in whole degrees). '
              'Use a range slider when users need to define minimum and maximum bounds.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            ComponentSection(
              title: 'Basic',
              description: 'A simple slider with min, max, and a value label. '
                  'Pass onChanged: null to disable.',
              child: ChromiaCodePreview(
                code: '''
ChromiaSlider(
  value: volume,
  min: 0,
  max: 100,
  label: '\$volume%',
  onChanged: (value) => setState(() => volume = value),
)

// Disabled
ChromiaSlider(
  value: 60,
  min: 0,
  max: 100,
  onChanged: null,
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    double volume = 40;
                    return Column(
                      children: [
                        ChromiaSlider(
                          value: volume,
                          min: 0,
                          max: 100,
                          label: '${volume.toInt()}%',
                          onChanged: (value) =>
                              setState(() => volume = value),
                        ),
                        const SizedBox(height: 8),
                        const ChromiaSlider(
                          value: 60,
                          min: 0,
                          max: 100,
                          onChanged: null,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── Value Display & Labels ────────────────────────────────────────
            ComponentSection(
              title: 'Value Display & Labels',
              description:
                  'Use valueBuilder to format the displayed value, '
                  'and minLabel/maxLabel for range endpoint annotations.',
              child: ChromiaCodePreview(
                code: '''
ChromiaSlider(
  value: brightness,
  min: 0,
  max: 100,
  minLabel: 'Min',
  maxLabel: 'Max',
  valueBuilder: (value) => '\${value.toInt()}%',
  onChanged: (value) => setState(() => brightness = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    double brightness = 50;
                    return ChromiaSlider(
                      value: brightness,
                      min: 0,
                      max: 100,
                      minLabel: 'Min',
                      maxLabel: 'Max',
                      valueBuilder: (value) => '${value.toInt()}%',
                      onChanged: (value) =>
                          setState(() => brightness = value),
                    );
                  },
                ),
              ),
            ),

            // ── Divisions ─────────────────────────────────────────────────────
            ComponentSection(
              title: 'With Divisions',
              description:
                  'Set divisions to restrict the slider to discrete steps '
                  'and show tick marks.',
              child: ChromiaCodePreview(
                code: '''
ChromiaSlider(
  value: temperature,
  min: 16,
  max: 30,
  divisions: 14,
  valueBuilder: (value) => '\${value.toInt()}°C',
  onChanged: (value) => setState(() => temperature = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    double temperature = 22;
                    return ChromiaSlider(
                      value: temperature,
                      min: 16,
                      max: 30,
                      divisions: 14,
                      valueBuilder: (value) => '${value.toInt()}°C',
                      onChanged: (value) =>
                          setState(() => temperature = value),
                    );
                  },
                ),
              ),
            ),

            // ── Range Slider ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Range Slider',
              description:
                  'ChromiaRangeSlider provides two thumbs to select '
                  'a minimum and maximum value.',
              child: ChromiaCodePreview(
                code: '''
ChromiaRangeSlider(
  values: priceRange,
  min: 0,
  max: 100,
  divisions: 20,
  showValues: true,
  valueBuilder: (value) => '\$\${value.toInt()}',
  onChanged: (values) => setState(() => priceRange = values),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    RangeValues priceRange = const RangeValues(20, 80);
                    return ChromiaRangeSlider(
                      values: priceRange,
                      min: 0,
                      max: 100,
                      divisions: 20,
                      showValues: true,
                      valueBuilder: (value) => '\$${value.toInt()}',
                      onChanged: (values) =>
                          setState(() => priceRange = values),
                    );
                  },
                ),
              ),
            ),

            // ── Slider Tiles ──────────────────────────────────────────────────
            ComponentSection(
              title: 'Slider Tiles',
              description:
                  'ChromiaListTileSlider embeds a slider inside a list tile '
                  'for settings screens.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTileSlider(
  value: volume,
  min: 0,
  max: 100,
  title: 'Volume',
  subtitle: 'Adjust system volume',
  valueBuilder: (value) => '\${value.toInt()}%',
  onChanged: (value) => setState(() => volume = value),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    double volume = 60;
                    double brightness = 40;
                    RangeValues priceRange = const RangeValues(20, 80);
                    final colors = context.chromiaColors;
                    final theme = context.chromiaTheme;
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.outline),
                        borderRadius: theme.radius.radiusM,
                      ),
                      child: Column(
                        children: [
                          ChromiaListTileSlider(
                            value: volume,
                            min: 0,
                            max: 100,
                            divisions: 10,
                            title: const Text('Volume'),
                            subtitle: const Text('Adjust system volume'),
                            valueBuilder: (value) => '${value.toInt()}%',
                            onChanged: (value) =>
                                setState(() => volume = value),
                          ),
                          Divider(height: 1, color: colors.outline),
                          ChromiaListTileSlider(
                            value: brightness,
                            min: 0,
                            max: 100,
                            divisions: 10,
                            title: const Text('Brightness'),
                            thumbIcon: Icons.brightness_7,
                            subtitle: const Text('Adjust screen brightness'),
                            valueBuilder: (value) => '${value.toInt()}%',
                            onChanged: (value) =>
                                setState(() => brightness = value),
                          ),
                          Divider(height: 1, color: colors.outline),
                          ChromiaListTileRangeSlider(
                            values: priceRange,
                            min: 0,
                            max: 100,
                            divisions: 20,
                            title: const Text('Price range'),
                            subtitle: const Text('Filter by price'),
                            valueBuilder: (value) =>
                                '\$${value.toInt()}',
                            onChanged: (values) =>
                                setState(() => priceRange = values),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
