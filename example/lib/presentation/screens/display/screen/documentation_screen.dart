import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final spacing = theme.spacing;

    return ExampleScaffold(
      title: 'Component Documentation',
      children: [
        Text(
          'Interactive Component Showcase',
          style: theme.typography.headlineMedium,
        ),
        spacing.gapVS,
        Text(
          'This page demonstrates how to use the ChromiaCodePreview component to create beautiful documentation with syntax highlighting.',
          style: theme.typography.bodyMedium.copyWith(
            color: theme.colors.textSecondary,
          ),
        ),
        spacing.gapVXL,

        // Simple Button Example
        ChromiaCodePreview(
          title: 'Basic Button',
          description: 'A simple button with text',
          code: '''
ChromiaButton(
  onPressed: () {
    print('Button pressed!');
  },
  child: Text('Click Me'),
)''',
          preview: ChromiaButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Button pressed!')),
              );
            },
            child: const Text('Click Me'),
          ),
        ),
        spacing.gapVXXL,

        // Button Variants Group
        ChromiaCodePreviewGroup(
          title: 'Button Variants',
          description: 'Different styles of buttons available',
          items: [
            CodePreviewItem(
              label: 'Filled',
              description: 'Primary filled button (default)',
              code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.filled,
  onPressed: () {},
  child: Text('Filled Button'),
)''',
              preview: ChromiaButton(
                variant: ChromiaButtonVariant.filled,
                onPressed: () {},
                child: const Text('Filled Button'),
              ),
            ),
            CodePreviewItem(
              label: 'Outlined',
              description: 'Button with border outline',
              code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.outlined,
  onPressed: () {},
  child: Text('Outlined Button'),
)''',
              preview: ChromiaButton(
                variant: ChromiaButtonVariant.outlined,
                onPressed: () {},
                child: const Text('Outlined Button'),
              ),
            ),
            CodePreviewItem(
              label: 'Text',
              description: 'Minimal text-only button',
              code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.text,
  onPressed: () {},
  child: Text('Text Button'),
)''',
              preview: ChromiaButton(
                variant: ChromiaButtonVariant.text,
                onPressed: () {},
                child: const Text('Text Button'),
              ),
            ),
            CodePreviewItem(
              label: 'Tonal',
              description: 'Button with subtle background',
              code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.tonal,
  onPressed: () {},
  child: Text('Tonal Button'),
)''',
              preview: ChromiaButton(
                variant: ChromiaButtonVariant.tonal,
                onPressed: () {},
                child: const Text('Tonal Button'),
              ),
            ),
            CodePreviewItem(
              label: 'Elevated',
              description: 'Button with shadow elevation',
              code: '''
ChromiaButton(
  variant: ChromiaButtonVariant.elevated,
  onPressed: () {},
  child: Text('Elevated Button'),
)''',
              preview: ChromiaButton(
                variant: ChromiaButtonVariant.elevated,
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
            ),
          ],
        ),
        spacing.gapVXXL,

        // Card Example
        const ChromiaCodePreview(
          title: 'Card with Content',
          description: 'A card component with header and content',
          code: '''
ChromiaCard(
  header: Text('Card Title'),
  child: Text(
    'This is the card content. Cards are perfect '
    'for grouping related information.',
  ),
)''',
          preview: ChromiaCard(
            header: Text('Card Title'),
            child: Text(
              'This is the card content. Cards are perfect '
              'for grouping related information.',
            ),
          ),
        ),
        spacing.gapVXXL,

        // Avatar Example
        ChromiaCodePreviewGroup(
          title: 'Avatar Variants',
          description: 'Different types of avatars',
          items: [
            CodePreviewItem(
              label: 'Initials',
              code: '''
ChromiaAvatar.initials(
  initials: 'AB',
  backgroundColor: colors.primary,
  size: ChromiaAvatarSize.large,
)''',
              preview: ChromiaAvatar.initials(
                initials: 'AB',
                backgroundColor: theme.colors.primary,
                size: ChromiaAvatarSize.large,
              ),
            ),
            CodePreviewItem(
              label: 'Icon',
              code: '''
ChromiaAvatar.icon(
  icon: Icons.person,
  backgroundColor: colors.secondary,
  size: ChromiaAvatarSize.large,
)''',
              preview: ChromiaAvatar.icon(
                icon: Icons.person,
                backgroundColor: theme.colors.secondary,
                size: ChromiaAvatarSize.large,
              ),
            ),
            CodePreviewItem(
              label: 'With Status',
              code: '''
ChromiaAvatarWithStatus(
  avatar: ChromiaAvatar.initials(
    initials: 'JD',
    backgroundColor: colors.primary,
    size: ChromiaAvatarSize.large,
  ),
  status: ChromiaAvatarStatus.online,
)''',
              preview: ChromiaAvatarWithStatus(
                avatar: ChromiaAvatar.initials(
                  initials: 'JD',
                  backgroundColor: theme.colors.primary,
                  size: ChromiaAvatarSize.large,
                ),
                status: ChromiaAvatarStatus.online,
              ),
            ),
          ],
        ),
        spacing.gapVXXL,

        // Chip Example
        const ChromiaCodePreview(
          title: 'Chips',
          description: 'Compact elements for tags and filters',
          code: '''
ChromiaChipGroup(
  children: [
    ChromiaChip(label: 'Flutter'),
    ChromiaChip(label: 'Dart'),
    ChromiaChip(label: 'Mobile'),
  ],
)''',
          preview: ChromiaChipGroup(
            children: [
              ChromiaChip(label: 'Flutter'),
              ChromiaChip(label: 'Dart'),
              ChromiaChip(label: 'Mobile'),
            ],
          ),
        ),
        spacing.gapVXXL,

        // Badge Example
        ChromiaCodePreview(
          title: 'Badge',
          description: 'Notification indicators',
          code: '''
ChromiaBadge(
  value: '3',
  child: Icon(
    Icons.notifications,
    size: 32,
  ),
)''',
          preview: ChromiaBadge(
            value: '3',
            child: Icon(
              Icons.notifications,
              size: 32,
              color: theme.colors.primary,
            ),
          ),
        ),
        spacing.gapVXXL,

        // Vertical Layout Example
        ChromiaCodePreview(
          title: 'Vertical Layout',
          description: 'Preview on top, code below',
          layout: CodePreviewLayout.vertical,
          code: '''
ChromiaProgress(
  value: 0.65,
  label: '65%',
)''',
          preview: ChromiaLinearProgress(
            value: 0.65,
            showLabel: true,
            labelBuilder: (value) => '${value * 100}%',
          ),
        ),
        spacing.gapVXXL,

        // Text Examples
        ChromiaCodePreviewGroup(
          title: 'Text Components',
          description: 'Typography-integrated text widgets',
          items: [
            CodePreviewItem(
              label: 'ChromiaText',
              description: 'Text with Chromia typography',
              code: '''
ChromiaText(
  'Hello World',
  type: ChromiaTypographyType.headlineMedium,
  color: colors.primary,
)''',
              preview: ChromiaText(
                'Hello World',
                type: ChromiaTypographyType.headlineMedium,
                color: theme.colors.primary,
              ),
            ),
            const CodePreviewItem(
              label: 'Body Text',
              description: 'Different typography types',
              code: '''
Column(
  children: [
    ChromiaText(
      'Display Large',
      type: ChromiaTypographyType.displayLarge,
    ),
    ChromiaText(
      'Headline Medium',
      type: ChromiaTypographyType.headlineMedium,
    ),
    ChromiaText(
      'Body Medium',
      type: ChromiaTypographyType.bodyMedium,
    ),
  ],
)''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChromiaText(
                    'Display Large',
                    type: ChromiaTypographyType.displayLarge,
                  ),
                  ChromiaText(
                    'Headline Medium',
                    type: ChromiaTypographyType.headlineMedium,
                  ),
                  ChromiaText(
                    'Body Medium',
                    type: ChromiaTypographyType.bodyMedium,
                  ),
                ],
              ),
            ),
            /*CodePreviewItem(
              label: 'Rich Text',
              description: 'Text with multiple styles',
              code: '''
ChromiaRichText(
  children: [
    ChromiaTextSpan(
      context: context,
      text: 'Hello ',
      type: ChromiaTypographyType.bodyLarge,
    ),
    ChromiaTextSpan(
      context: context,
      text: 'World',
      type: ChromiaTypographyType.bodyLarge,
      color: colors.primary,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
)''',
              preview: ChromiaRichText(
                children: [
                  ChromiaTextSpan(
                    context: context,
                    text: 'Hello ',
                    type: ChromiaTypographyType.bodyLarge,
                  ),
                  ChromiaTextSpan(
                    context: context,
                    text: 'World',
                    type: ChromiaTypographyType.bodyLarge,
                    color: theme.colors.primary,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),*/
          ],
        ),
        spacing.gapVXXL,

        // Text Examples
        const ChromiaCodePreviewGroup(
          title: 'ChromiaText - Typography Styles',
          description: 'Text component with integrated Chromia typography',
          items: [
            CodePreviewItem(
              label: 'Display',
              code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ChromiaText(
      'Display Large',
      type: ChromiaTypographyType.displayLarge,
    ),
    ChromiaText(
      'Display Medium',
      type: ChromiaTypographyType.displayMedium,
    ),
    ChromiaText(
      'Display Small',
      type: ChromiaTypographyType.displaySmall,
    ),
  ],
)''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChromiaText(
                    'Display Large',
                    type: ChromiaTypographyType.displayLarge,
                  ),
                  ChromiaText(
                    'Display Medium',
                    type: ChromiaTypographyType.displayMedium,
                  ),
                  ChromiaText(
                    'Display Small',
                    type: ChromiaTypographyType.displaySmall,
                  ),
                ],
              ),
            ),
            CodePreviewItem(
              label: 'Headline',
              code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ChromiaText(
      'Headline Large',
      type: ChromiaTypographyType.headlineLarge,
    ),
    ChromiaText(
      'Headline Medium',
      type: ChromiaTypographyType.headlineMedium,
    ),
    ChromiaText(
      'Headline Small',
      type: ChromiaTypographyType.headlineSmall,
    ),
  ],
)''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChromiaText(
                    'Headline Large',
                    type: ChromiaTypographyType.headlineLarge,
                  ),
                  ChromiaText(
                    'Headline Medium',
                    type: ChromiaTypographyType.headlineMedium,
                  ),
                  ChromiaText(
                    'Headline Small',
                    type: ChromiaTypographyType.headlineSmall,
                  ),
                ],
              ),
            ),
            CodePreviewItem(
              label: 'Title',
              code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ChromiaText(
      'Title Large',
      type: ChromiaTypographyType.titleLarge,
    ),
    ChromiaText(
      'Title Medium',
      type: ChromiaTypographyType.titleMedium,
    ),
    ChromiaText(
      'Title Small',
      type: ChromiaTypographyType.titleSmall,
    ),
  ],
)''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChromiaText(
                    'Title Large',
                    type: ChromiaTypographyType.titleLarge,
                  ),
                  ChromiaText(
                    'Title Medium',
                    type: ChromiaTypographyType.titleMedium,
                  ),
                  ChromiaText(
                    'Title Small',
                    type: ChromiaTypographyType.titleSmall,
                  ),
                ],
              ),
            ),
            CodePreviewItem(
              label: 'Body',
              code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ChromiaText(
      'Body Large - Regular text for content',
      type: ChromiaTypographyType.bodyLarge,
    ),
    ChromiaText(
      'Body Medium - Default text style',
      type: ChromiaTypographyType.bodyMedium,
    ),
    ChromiaText(
      'Body Small - Smaller body text',
      type: ChromiaTypographyType.bodySmall,
    ),
  ],
)''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChromiaText(
                    'Body Large - Regular text for content',
                    type: ChromiaTypographyType.bodyLarge,
                  ),
                  ChromiaText(
                    'Body Medium - Default text style',
                    type: ChromiaTypographyType.bodyMedium,
                  ),
                  ChromiaText(
                    'Body Small - Smaller body text',
                    type: ChromiaTypographyType.bodySmall,
                  ),
                ],
              ),
            ),
            CodePreviewItem(
              label: 'Label',
              code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ChromiaText(
      'Label Large',
      type: ChromiaTypographyType.labelLarge,
    ),
    ChromiaText(
      'Label Medium',
      type: ChromiaTypographyType.labelMedium,
    ),
    ChromiaText(
      'Label Small',
      type: ChromiaTypographyType.labelSmall,
    ),
  ],
)''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChromiaText(
                    'Label Large',
                    type: ChromiaTypographyType.labelLarge,
                  ),
                  ChromiaText(
                    'Label Medium',
                    type: ChromiaTypographyType.labelMedium,
                  ),
                  ChromiaText(
                    'Label Small',
                    type: ChromiaTypographyType.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        spacing.gapVXXL,

        // Text Customization Examples
        ChromiaCodePreviewGroup(
          title: 'ChromiaText - Customization',
          description: 'Custom colors, styles, and overflow handling',
          items: [
            CodePreviewItem(
              label: 'Colors',
              code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ChromiaText(
      'Primary Color',
      type: ChromiaTypographyType.titleMedium,
      color: theme.colors.primary,
    ),
    ChromiaText(
      'Error Color',
      type: ChromiaTypographyType.titleMedium,
      color: theme.colors.error,
    ),
    ChromiaText(
      'Success Color',
      type: ChromiaTypographyType.titleMedium,
      color: theme.colors.success,
    ),
  ],
)''',
              preview: Builder(
                builder: (context) {
                  final theme = context.chromiaTheme;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChromiaText(
                        'Primary Color',
                        type: ChromiaTypographyType.titleMedium,
                        color: theme.colors.primary,
                      ),
                      ChromiaText(
                        'Error Color',
                        type: ChromiaTypographyType.titleMedium,
                        color: theme.colors.error,
                      ),
                      ChromiaText(
                        'Success Color',
                        type: ChromiaTypographyType.titleMedium,
                        color: theme.colors.success,
                      ),
                    ],
                  );
                },
              ),
            ),
            const CodePreviewItem(
              label: 'Custom Style',
              code: '''
ChromiaText(
  'Bold and Spaced',
  type: ChromiaTypographyType.bodyMedium,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
    decoration: TextDecoration.underline,
  ),
)''',
              preview: ChromiaText(
                'Bold and Spaced',
                type: ChromiaTypographyType.bodyMedium,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const CodePreviewItem(
              label: 'Overflow',
              code: '''
ChromiaText(
  'Very long text that will overflow...',
  type: ChromiaTypographyType.bodyMedium,
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
)''',
              preview: SizedBox(
                width: 200,
                child: ChromiaText(
                  'Very long text that will overflow and be truncated with ellipsis',
                  type: ChromiaTypographyType.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const CodePreviewItem(
              label: 'Alignment',
              code: '''
ChromiaText(
  'Centered Text',
  type: ChromiaTypographyType.titleMedium,
  textAlign: TextAlign.center,
)''',
              preview: SizedBox(
                width: double.infinity,
                child: ChromiaText(
                  'Centered Text',
                  type: ChromiaTypographyType.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        spacing.gapVXXL,

        // RichText Basic Examples
        ChromiaCodePreview(
          title: 'ChromiaRichText - Multi-Style Text',
          description: 'Display text with multiple styles',
          code: '''
ChromiaRichText(
  text: TextSpan(
    style: theme.typography.bodyMedium,
    children: [
      TextSpan(text: 'This is '),
      TextSpan(
        text: 'bold',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: ' and this is '),
      TextSpan(
        text: 'colored',
        style: TextStyle(color: theme.colors.primary),
      ),
      TextSpan(text: ' text.'),
    ],
  ),
)''',
          preview: Builder(
            builder: (context) {
              final theme = context.chromiaTheme;
              return ChromiaRichText(
                text: TextSpan(
                  style: theme.typography.bodyMedium,
                  children: [
                    const TextSpan(text: 'This is '),
                    const TextSpan(
                      text: 'bold',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ' and this is '),
                    TextSpan(
                      text: 'colored',
                      style: TextStyle(color: theme.colors.primary),
                    ),
                    const TextSpan(text: ' text.'),
                  ],
                ),
              );
            },
          ),
        ),
        spacing.gapVXXL,

        // RichText Helper Examples
        ChromiaCodePreviewGroup(
          title: 'ChromiaRichText - Helpers',
          description: 'Convenient factory constructors for common patterns',
          items: [
            CodePreviewItem(
              label: 'Highlight',
              description: 'Highlight specific words in text',
              code: '''
ChromiaRichText.highlight(
  text: 'Flutter is amazing and powerful',
  highlights: ['amazing', 'powerful'],
  highlightStyle: TextStyle(
    color: theme.colors.primary,
    fontWeight: FontWeight.bold,
  ),
)''',
              preview: Builder(
                builder: (context) {
                  final theme = context.chromiaTheme;
                  return ChromiaRichText.highlight(
                    text: 'Flutter is amazing and powerful',
                    highlights: const ['amazing', 'powerful'],
                    highlightStyle: TextStyle(
                      color: theme.colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            CodePreviewItem(
              label: 'Label-Value',
              description: 'Display label-value pairs',
              code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ChromiaRichText.labelValue(
      label: 'Name:',
      value: 'John Doe',
    ),
    ChromiaRichText.labelValue(
      label: 'Email:',
      value: 'john@example.com',
    ),
    ChromiaRichText.labelValue(
      label: 'Phone:',
      value: '+1 234 567 890',
    ),
  ],
)''',
              preview: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChromiaRichText.labelValue(
                    label: 'Name:',
                    value: 'John Doe',
                  ),
                  const SizedBox(height: 8),
                  ChromiaRichText.labelValue(
                    label: 'Email:',
                    value: 'john@example.com',
                  ),
                  const SizedBox(height: 8),
                  ChromiaRichText.labelValue(
                    label: 'Phone:',
                    value: '+1 234 567 890',
                  ),
                ],
              ),
            ),
          ],
        ),
        spacing.gapVXXL,

        // RichText Advanced Examples
        ChromiaCodePreviewGroup(
          title: 'ChromiaRichText - Advanced',
          description: 'Interactive and complex text layouts',
          items: [
            CodePreviewItem(
              label: 'Interactive',
              description: 'Clickable text with tap handlers',
              code: '''
ChromiaRichText(
  text: TextSpan(
    style: theme.typography.bodyMedium,
    children: [
      TextSpan(text: 'Click '),
      TextSpan(
        text: 'here',
        style: TextStyle(
          color: theme.colors.primary,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Link tapped!')),
            );
          },
      ),
      TextSpan(text: ' for more info'),
    ],
  ),
)''',
              preview: Builder(
                builder: (context) {
                  final theme = context.chromiaTheme;
                  return ChromiaRichText(
                    text: TextSpan(
                      style: theme.typography.bodyMedium,
                      children: [
                        const TextSpan(text: 'Click '),
                        TextSpan(
                          text: 'here',
                          style: TextStyle(
                            color: theme.colors.primary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Link tapped!')),
                              );
                            },
                        ),
                        const TextSpan(text: ' for more info'),
                      ],
                    ),
                  );
                },
              ),
            ),
            CodePreviewItem(
              label: 'Price Tag',
              description: 'Strikethrough price with discount',
              code: '''
ChromiaRichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: '\\\$99.99 ',
        style: theme.typography.bodyMedium.copyWith(
          decoration: TextDecoration.lineThrough,
          color: theme.colors.textTertiary,
        ),
      ),
      TextSpan(
        text: '\\\$49.99',
        style: theme.typography.titleLarge.copyWith(
          color: theme.colors.error,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
)''',
              preview: Builder(
                builder: (context) {
                  final theme = context.chromiaTheme;
                  return ChromiaRichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$99.99 ',
                          style: theme.typography.bodyMedium.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: theme.colors.textTertiary,
                          ),
                        ),
                        TextSpan(
                          text: '\$49.99',
                          style: theme.typography.titleLarge.copyWith(
                            color: theme.colors.error,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            CodePreviewItem(
              label: 'Terms',
              description: 'Terms and conditions with links',
              code: '''
ChromiaRichText(
  text: TextSpan(
    style: theme.typography.bodySmall,
    children: [
      TextSpan(text: 'By signing up, you agree to our '),
      TextSpan(
        text: 'Terms',
        style: TextStyle(
          color: theme.colors.primary,
          decoration: TextDecoration.underline,
        ),
      ),
      TextSpan(text: ' and '),
      TextSpan(
        text: 'Privacy Policy',
        style: TextStyle(
          color: theme.colors.primary,
          decoration: TextDecoration.underline,
        ),
      ),
    ],
  ),
)''',
              preview: Builder(
                builder: (context) {
                  final theme = context.chromiaTheme;
                  return ChromiaRichText(
                    text: TextSpan(
                      style: theme.typography.bodySmall,
                      children: [
                        const TextSpan(text: 'By signing up, you agree to our '),
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            color: theme.colors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: theme.colors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        spacing.gapVXXL,
      ],
    );
  }
}
