import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/screens/display/display_constants.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.chromiaColors;
    final layersIcon = Icon(Icons.layers, color: colors.primary);
    final chevronRight = Icon(Icons.chevron_right, color: colors.onSurfaceVariant);
    RangeValues priceRange = const RangeValues(200, 700);

    int selectedIndex = 0;
    bool notifications = true;
    String theme = 'light';
    bool sound = false;
    double volume = 60;
    double brightness = 80;

    return ExampleScaffold(
      title: 'List Tile',
      children: [
        ComponentPage(
          description:
              'A family of themed list-row components that share the same visual '
              'language: leading icon, title + subtitle, and a trailing control '
              'or action. All variants support standard, outlined and card styles.',
          whenToUse:
              'Use ChromiaListTile for navigation rows, settings lists and data '
              'tables. Use the control tiles (Checkbox, Radio, Toggle, Switch) '
              'to embed an interactive control inside a list row. Use the Slider '
              'tiles for continuous value adjustment in a form.',
          children: [
            // ── ChromiaListTile — Variants ────────────────────────────────────
            ComponentSection(
              title: 'Variants',
              description:
                  'Three visual styles that all tiles share: standard (default), '
                  'outlined (border), and card (elevated).',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Standard',
                    code: ListTileConstants.standard,
                    preview: ChromiaListTile(
                      variant: ChromiaListTileVariant.standard,
                      leading: layersIcon,
                      trailing: chevronRight,
                      title: const Text('Standard'),
                      subtitle: const Text('Default variant'),
                      onTap: () {},
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Outlined',
                    code: ListTileConstants.outlined,
                    preview: ChromiaListTile(
                      variant: ChromiaListTileVariant.outlined,
                      leading: layersIcon,
                      trailing: chevronRight,
                      title: const Text('Outlined'),
                      subtitle: const Text('With border'),
                      onTap: () {},
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Card',
                    code: ListTileConstants.card,
                    preview: ChromiaListTile(
                      variant: ChromiaListTileVariant.card,
                      leading: layersIcon,
                      trailing: chevronRight,
                      title: const Text('Card'),
                      subtitle: const Text('With elevation'),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),

            // ── ChromiaListTile — Selectable ──────────────────────────────────
            ComponentSection(
              title: 'Selectable List',
              description:
                  'Use selected: true and a check icon trailing to indicate '
                  'the active item.',
              child: ChromiaCodePreview(
                code: ListTileConstants.selectable,
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    final colors = context.chromiaColors;

                    final items = [
                      (icon: Icons.home, title: 'Home'),
                      (icon: Icons.explore, title: 'Explore'),
                      (icon: Icons.notifications, title: 'Notifications'),
                      (icon: Icons.settings, title: 'Settings'),
                    ];
                    return Column(
                      children: items.asMap().entries.map((e) {
                        final i = e.key;
                        final item = e.value;
                        final isSelected = selectedIndex == i;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: ChromiaListTile(
                            leading: Icon(
                              item.icon,
                              color: isSelected
                                  ? colors.primary
                                  : colors.onSurfaceVariant,
                            ),
                            title: Text(item.title),
                            selected: isSelected,
                            trailing: isSelected
                                ? Icon(Icons.check, color: colors.primary)
                                : null,
                            onTap: () =>
                                setState(() => selectedIndex = i),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),

            // ── ChromiaListTile — Disabled ────────────────────────────────────
            ComponentSection(
              title: 'Disabled State',
              description: 'Set enabled: false to prevent interaction and apply a muted visual style.',
              child: ChromiaCodePreview(
                code: ListTileConstants.disabledTile,
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return ChromiaListTile(
                      leading: Icon(Icons.block, color: colors.textDisabled),
                      title: const Text('Disabled Item'),
                      subtitle: const Text('This item is disabled'),
                      enabled: false,
                    );
                  },
                ),
              ),
            ),

            // ── ChromiaListTileCheckbox ───────────────────────────────────────
            ComponentSection(
              title: 'Checkbox Tile',
              description:
                  'ChromiaListTileCheckbox embeds a checkbox at the trailing end. The whole row is tappable.',
              child: ChromiaCodePreview(
                code: ListTileConstants.checkboxTile,
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    final colors = context.chromiaColors;
                    return ChromiaListTileCheckbox(
                      value: notifications,
                      onChanged: (v) =>
                          setState(() => notifications = v ?? false),
                      leading: Icon(
                        Icons.notifications,
                        color: colors.primary,
                      ),
                      title: const Text('Push Notifications'),
                      subtitle: const Text('Receive alerts in real time'),
                    );
                  },
                )
              ),
            ),

            // ── ChromiaListTileRadioButton ────────────────────────────────────
            ComponentSection(
              title: 'Radio Button Tile',
              description:
                  'ChromiaListTileRadioButton displays a radio button at the '
                  'trailing end. Group multiple tiles to form a single-choice list.',
              child: ChromiaCodePreview(
                code: ListTileConstants.radioTile,
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    final colors = context.chromiaColors;
                    return Column(
                      children: [
                        ChromiaListTileRadioButton<String>(
                          value: 'light',
                          groupValue: theme,
                          onChanged: (v) =>
                              setState(() => theme = v ?? theme),
                          leading: Icon(
                            Icons.light_mode,
                            color: colors.primary,
                          ),
                          title: const Text('Light'),
                          subtitle: const Text('Light color scheme'),
                        ),
                        ChromiaListTileRadioButton<String>(
                          value: 'dark',
                          groupValue: theme,
                          onChanged: (v) =>
                              setState(() => theme = v ?? theme),
                          leading: Icon(
                            Icons.dark_mode,
                            color: colors.primary,
                          ),
                          title: const Text('Dark'),
                          subtitle: const Text('Dark color scheme'),
                        ),
                        ChromiaListTileRadioButton<String>(
                          value: 'system',
                          groupValue: theme,
                          onChanged: (v) =>
                              setState(() => theme = v ?? theme),
                          leading: Icon(
                            Icons.settings_brightness,
                            color: colors.primary,
                          ),
                          title: const Text('System'),
                          subtitle: const Text('Follow system setting'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── ChromiaListTileToggleButton ───────────────────────────────────
            ComponentSection(
              title: 'Toggle Button Tile',
              description:
                  'ChromiaListTileToggleButton embeds a toggle button at the '
                  'trailing end — a compact alternative to a switch.',
              child: ChromiaCodePreview(
                code: ListTileConstants.toggleTile,
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    final colors = context.chromiaColors;
                    return Column(
                      children: [
                        ChromiaListTileToggleButton(
                          value: notifications,
                          onChanged: (v) =>
                              setState(() => notifications = v),
                          leading: Icon(
                            Icons.notifications,
                            color: colors.primary,
                          ),
                          title: const Text('Push Notifications'),
                          subtitle: const Text('Receive alerts in real time'),
                        ),
                        const SizedBox(height: 4),
                        ChromiaListTileToggleButton(
                          value: sound,
                          onChanged: (v) => setState(() => sound = v),
                          leading: Icon(
                            Icons.volume_up,
                            color: colors.primary,
                          ),
                          title: const Text('Sound'),
                          subtitle: const Text('Play notification sound'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── ChromiaListTileSlider ─────────────────────────────────────────
            ComponentSection(
              title: 'Slider Tile',
              description:
                  'ChromiaListTileSlider renders a label header above a '
                  'full-width slider track. Use valueBuilder to format the '
                  'displayed value.',
              child: ChromiaCodePreview(
                code: ListTileConstants.sliderTile,
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      children: [
                        ChromiaListTileSlider(
                          value: volume,
                          onChanged: (v) => setState(() => volume = v),
                          title: const Text('Volume'),
                          subtitle: const Text('Adjust playback volume'),
                          min: 0,
                          max: 100,
                          divisions: 10,
                          valueBuilder: (v) => '${v.toInt()}%',
                          variant: ChromiaListTileVariant.outlined,
                        ),
                        const SizedBox(height: 8),
                        ChromiaListTileSlider(
                          value: brightness,
                          onChanged: (v) => setState(() => brightness = v),
                          title: const Text('Brightness'),
                          min: 0,
                          max: 100,
                          divisions: 20,
                          valueBuilder: (v) => '${v.toInt()}%',
                          variant: ChromiaListTileVariant.outlined,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── ChromiaListTileRangeSlider ────────────────────────────────────
            ComponentSection(
              title: 'Range Slider Tile',
              description:
                  'ChromiaListTileRangeSlider renders a label header above a '
                  'two-thumb range slider. Use valueBuilder to format each '
                  'thumb value.',
              child: ChromiaCodePreview(
                code: ListTileConstants.rangeSliderTile,
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    return ChromiaListTileRangeSlider(
                      values: priceRange,
                      onChanged: (v) =>
                          setState(() => priceRange = v),
                      title: const Text('Price range'),
                      min: 0,
                      max: 1000,
                      divisions: 10,
                      valueBuilder: (v) => '\$${v.toInt()}',
                      variant: ChromiaListTileVariant.outlined,
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
