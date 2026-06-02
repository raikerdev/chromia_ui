import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Card',
      children: [
        ComponentPage(
          description:
              'ChromiaCard is a themed container that groups related content '
              'with optional header, footer, image, and elevation. '
              'ChromiaListTileCard combines a card with a list tile layout.',
          whenToUse:
              'Use cards to group related information into a single contained unit. '
              'Use the header for a title widget and footer for actions. '
              'Provide onTap to make the card interactive. '
              'Use ChromiaListTileCard for feed items or list entries that need elevation.',
          children: [
            // ── Basic ─────────────────────────────────────────────────────────
            const ComponentSection(
              title: 'Basic',
              description:
                  'A simple card wrapping any content.',
              child: ChromiaCodePreview(
                code: '''
ChromiaCard(
  child: ChromiaText(
    'Cards group related information into a '
    'contained, visually distinct unit.',
  ),
)''',
                preview: ChromiaCard(
                  child: ChromiaText(
                    'Cards group related information into a '
                    'contained, visually distinct unit.',
                  ),
                ),
              ),
            ),

            // ── Header & Footer ───────────────────────────────────────────────
            ComponentSection(
              title: 'Header & Footer',
              description:
                  'Add a header for a title and a footer for action buttons.',
              child: ChromiaCodePreview(
                code: '''
ChromiaCard(
  header: ChromiaText('Project Card'),
  footer: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      ChromiaButton(variant: ChromiaButtonVariant.text, child: Text('Cancel'), onPressed: () {}),
      ChromiaButton(child: Text('Save'), onPressed: () {}),
    ],
  ),
  child: ChromiaText('Add action buttons in the footer.'),
)''',
                preview: Builder(
                  builder: (context) {
                    final spacing = context.chromiaTheme.spacing;
                    return ChromiaCard(
                      header: const ChromiaText('Project Card'),
                      footer: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ChromiaButton(
                            variant: ChromiaButtonVariant.text,
                            size: ChromiaButtonSize.small,
                            onPressed: () {},
                            child: const Text('Cancel'),
                          ),
                          spacing.gapHM,
                          ChromiaButton(
                            size: ChromiaButtonSize.small,
                            onPressed: () {},
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                      child: const ChromiaText(
                        'Add action buttons in the footer section.',
                      ),
                    );
                  },
                ),
              ),
            ),

            // ── Interactive ───────────────────────────────────────────────────
            ComponentSection(
              title: 'Interactive',
              description:
                  'Provide onTap to make a card tappable with hover and press states.',
              child: ChromiaCodePreview(
                code: '''
ChromiaCard(
  elevation: 2,
  onTap: () {},
  child: Row(
    children: [
      Icon(Icons.touch_app, color: colors.primary, size: 40),
      Expanded(child: ChromiaText('Tap this card')),
    ],
  ),
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return ChromiaCard(
                      elevation: 2,
                      onTap: () => context.showInfoSnackBar(
                        message: 'Card tapped!',
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.touch_app,
                            color: colors.primary,
                            size: 40,
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: ChromiaText(
                              'Tap this card to see the interaction.',
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // ── With Image ────────────────────────────────────────────────────
            ComponentSection(
              title: 'With Image',
              description:
                  'Add an image at the top, bottom, start, or end using '
                  'the image and imagePosition parameters.',
              child: ChromiaCodePreview(
                code: '''
ChromiaCard(
  image: Container(
    height: 150,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [colors.primary, colors.secondary]),
    ),
  ),
  imagePosition: CardImagePosition.top,
  header: ChromiaText('Photo Card'),
  child: ChromiaText('Include an image at the top of the card.'),
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    return ChromiaCard(
                      image: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [colors.primary, colors.secondary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            size: 64,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      imagePosition: CardImagePosition.top,
                      header: const ChromiaText('Photo Card'),
                      child: const ChromiaText(
                        'Perfect for gallery views or product cards.',
                      ),
                    );
                  },
                ),
              ),
            ),

            // ── Elevations ────────────────────────────────────────────────────
            ComponentSection(
              title: 'Elevations',
              description:
                  'Control depth with the elevation parameter. '
                  'Use borderColor + borderWidth at elevation 0 for a flat outlined style.',
              child: ChromiaCodePreview(
                code: '''
ChromiaCard(elevation: 0, borderColor: colors.outline, borderWidth: 1, child: ...)
ChromiaCard(elevation: 2, child: ...)
ChromiaCard(elevation: 4, child: ...)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    final spacing = context.chromiaTheme.spacing;
                    return Row(
                      children: [
                        Expanded(
                          child: ChromiaCard(
                            elevation: 0,
                            borderColor: colors.outline,
                            borderWidth: 1,
                            child: Column(
                              children: [
                                ChromiaText(
                                  'Elevation 0',
                                  type: ChromiaTypographyType.labelMedium,
                                  color: colors.onSurface,
                                ),
                                spacing.gapVXS,
                                ChromiaText(
                                  'Flat',
                                  type: ChromiaTypographyType.bodySmall,
                                  color: colors.onSurfaceVariant,
                                ),
                              ],
                            ),
                          ),
                        ),
                        spacing.gapHM,
                        Expanded(
                          child: ChromiaCard(
                            elevation: 2,
                            child: Column(
                              children: [
                                ChromiaText(
                                  'Elevation 2',
                                  type: ChromiaTypographyType.labelMedium,
                                  color: colors.onSurface,
                                ),
                                spacing.gapVXS,
                                ChromiaText(
                                  'Default',
                                  type: ChromiaTypographyType.bodySmall,
                                  color: colors.onSurfaceVariant,
                                ),
                              ],
                            ),
                          ),
                        ),
                        spacing.gapHM,
                        Expanded(
                          child: ChromiaCard(
                            elevation: 4,
                            child: Column(
                              children: [
                                ChromiaText(
                                  'Elevation 4',
                                  type: ChromiaTypographyType.labelMedium,
                                  color: colors.onSurface,
                                ),
                                spacing.gapVXS,
                                ChromiaText(
                                  'Raised',
                                  type: ChromiaTypographyType.bodySmall,
                                  color: colors.onSurfaceVariant,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ── List Tile (card variant) ──────────────────────────────────────
            ComponentSection(
              title: 'List Tile — Card',
              description:
                  'Use ChromiaListTile with variant: card for feed items and '
                  'notification entries that need elevation.',
              child: ChromiaCodePreview(
                code: '''
ChromiaListTile(
  variant: ChromiaListTileVariant.card,
  leading: CircleAvatar(child: Icon(Icons.person, color: Colors.white)),
  title: Text('John Doe'),
  subtitle: Text('Software Engineer'),
  trailing: Icon(Icons.chevron_right),
  onTap: () {},
)''',
                preview: Builder(
                  builder: (context) {
                    final colors = context.chromiaColors;
                    final spacing = context.chromiaTheme.spacing;
                    return Column(
                      children: [
                        ChromiaListTile(
                          variant: ChromiaListTileVariant.card,
                          leading: CircleAvatar(
                            backgroundColor: colors.primary,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text('John Doe'),
                          subtitle: const Text('Software Engineer'),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: colors.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                        spacing.gapVM,
                        ChromiaListTile(
                          variant: ChromiaListTileVariant.card,
                          leading: CircleAvatar(
                            backgroundColor: colors.success,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text('Task Completed'),
                          subtitle: const Text(
                            'Successfully deployed to production',
                          ),
                          trailing: ChromiaText(
                            '2 hours ago',
                            type: ChromiaTypographyType.bodySmall,
                            color: colors.onSurfaceVariant,
                          ),
                          onTap: () {},
                        ),
                      ],
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
