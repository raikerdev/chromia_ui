import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Progress',
      children: [
        ComponentPage(
          description:
              'Chromia provides ChromiaLinearProgress for horizontal bars, '
              'ChromiaCircularProgress for spinner-style indicators, and '
              'ChromiaSteppedProgress for multi-step workflows.',
          whenToUse:
              'Use linear progress for file uploads and form completion. '
              'Use circular progress for loading spinners. '
              'Omit value for indeterminate (unknown duration) operations. '
              'Use stepped progress for wizards and onboarding flows.',
          children: [
            // ── Linear Progress ───────────────────────────────────────────────
            ComponentSection(
              title: 'Linear Progress',
              description:
                  'Pass a value in [0.0, 1.0] for determinate progress. '
                  'Omit value for indeterminate.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
// Determinate
ChromiaLinearProgress(value: 0.3)
ChromiaLinearProgress(value: 0.6)
ChromiaLinearProgress(value: 0.9)

// With label
ChromiaLinearProgress(value: 0.65, showLabel: true)

// Indeterminate
ChromiaLinearProgress()''',
                preview: const Column(
                  children: [
                    ChromiaLinearProgress(value: 0.3),
                    SizedBox(height: 12),
                    ChromiaLinearProgress(value: 0.6),
                    SizedBox(height: 12),
                    ChromiaLinearProgress(value: 0.9),
                    SizedBox(height: 12),
                    ChromiaLinearProgress(value: 0.65, showLabel: true),
                    SizedBox(height: 12),
                    ChromiaLinearProgress(),
                  ],
                ),
              ),
            ),

            // ── Circular Progress ─────────────────────────────────────────────
            ComponentSection(
              title: 'Circular Progress',
              description:
                  'Circular indicators support determinate values, '
                  'labels, and a custom child widget at the center.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
// Determinate values
ChromiaCircularProgress(value: 0.25)
ChromiaCircularProgress(value: 0.50)
ChromiaCircularProgress(value: 0.75)

// Indeterminate
ChromiaCircularProgress()

// With label
ChromiaCircularProgress(value: 0.67, showLabel: true)

// With center child
ChromiaCircularProgress(
  value: 1.0,
  child: Icon(Icons.check),
)''',
                preview: Column(
                  children: [
                    Wrap(
                      spacing: 24,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        ChromiaCircularProgress(value: 0.25),
                        ChromiaCircularProgress(value: 0.5),
                        ChromiaCircularProgress(value: 0.75),
                        ChromiaCircularProgress(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Wrap(
                      spacing: 24,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ChromiaCircularProgress(
                          value: 0.33,
                          showLabel: true,
                        ),
                        ChromiaCircularProgress(
                          value: 0.67,
                          showLabel: true,
                        ),
                        ChromiaCircularProgress(
                          value: 1.0,
                          showLabel: true,
                        ),
                        ChromiaCircularProgress(
                          value: 1.0,
                          child: Icon(Icons.check),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ── Customization ─────────────────────────────────────────────────
            ComponentSection(
              title: 'Customization',
              description:
                  'Override color, backgroundColor, height (linear), '
                  'strokeWidth, and size (circular).',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
ChromiaLinearProgress(
  value: 0.6,
  color: Colors.purple,
  backgroundColor: Colors.purple.withAlpha(40),
  height: 12,
)

ChromiaCircularProgress(
  value: 0.7,
  color: Colors.purple,
  backgroundColor: Colors.purple.withAlpha(40),
  strokeWidth: 8,
  size: 60,
)''',
                preview: Column(
                  children: [
                    const ChromiaLinearProgress(
                      value: 0.6,
                      color: Colors.purple,
                      backgroundColor: Color(0x28AB47BC),
                      height: 12,
                    ),
                    const SizedBox(height: 12),
                    const ChromiaLinearProgress(
                      color: Colors.teal,
                      backgroundColor: Color(0x2800897B),
                      height: 12,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 24,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        ChromiaCircularProgress(
                          value: 0.7,
                          color: Colors.purple,
                          backgroundColor: Color(0x28AB47BC),
                          strokeWidth: 8,
                          size: 60,
                        ),
                        ChromiaCircularProgress(
                          color: Colors.teal,
                          backgroundColor: Color(0x2800897B),
                          child: Icon(Icons.star, size: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ── Stepped Progress ──────────────────────────────────────────────
            ComponentSection(
              title: 'Stepped Progress',
              description:
                  'ChromiaSteppedProgress visualizes a workflow with '
                  'discrete numbered steps.',
              child: ChromiaCodePreview(
                layout: CodePreviewLayout.vertical,
                code: '''
ChromiaSteppedProgress(currentStep: 0, totalSteps: 4)
ChromiaSteppedProgress(currentStep: 1, totalSteps: 4)
ChromiaSteppedProgress(currentStep: 2, totalSteps: 4)
ChromiaSteppedProgress(currentStep: 3, totalSteps: 4)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    int step = 1;
                    return Column(
                      children: [
                        ChromiaSteppedProgress(
                          currentStep: step,
                          totalSteps: 4,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ChromiaButton(
                              variant: ChromiaButtonVariant.outlined,
                              size: ChromiaButtonSize.small,
                              onPressed: step > 0
                                  ? () => setState(() => step--)
                                  : null,
                              child: const Text('Back'),
                            ),
                            const SizedBox(width: 12),
                            ChromiaButton(
                              size: ChromiaButtonSize.small,
                              onPressed: step < 4
                                  ? () => setState(() => step++)
                                  : null,
                              child: const Text('Next'),
                            ),
                          ],
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
