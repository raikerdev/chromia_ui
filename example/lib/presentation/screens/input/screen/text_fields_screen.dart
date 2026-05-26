import 'package:chromia_ui/chromia_ui.dart';
import 'package:chromia_ui_example/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldsScreen extends StatefulWidget {
  const TextFieldsScreen({super.key});

  @override
  State<TextFieldsScreen> createState() => _TextFieldsScreenState();
}

class _TextFieldsScreenState extends State<TextFieldsScreen> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: 'Text Field',
      children: [
        ComponentPage(
          description:
              'ChromiaTextField is a themed text input that supports filled and outlined '
              'variants, prefix/suffix icons and text, helper text, character limits, '
              'multiline mode, and built-in validation.',
          whenToUse:
              'Use the filled variant inside forms and surfaces. '
              'Use outlined when the input needs a clear boundary against a colored background. '
              'Always provide a label so screen readers can identify the field.',
          children: [
            // ── Variants ─────────────────────────────────────────────────────
            ComponentSection(
              title: 'Variants',
              description:
                  'Filled uses a background fill; Outlined uses a border. '
                  'Both adapt to light and dark modes automatically.',
              child: ChromiaCodePreviewGroup(
                items: [
                  CodePreviewItem(
                    label: 'Filled',
                    description: 'Recommended for most forms.',
                    code: '''
ChromiaTextField(
  variant: ChromiaTextFieldVariant.filled,
  label: 'Email',
  hintText: 'Enter your email',
)''',
                    preview: ChromiaTextField(
                      variant: ChromiaTextFieldVariant.filled,
                      label: 'Email',
                      hintText: 'Enter your email',
                    ),
                  ),
                  CodePreviewItem(
                    label: 'Outlined',
                    description:
                        'Use when the field needs a visible border boundary.',
                    code: '''
ChromiaTextField(
  variant: ChromiaTextFieldVariant.outlined,
  label: 'Email',
  hintText: 'Enter your email',
)''',
                    preview: ChromiaTextField(
                      variant: ChromiaTextFieldVariant.outlined,
                      label: 'Email',
                      hintText: 'Enter your email',
                    ),
                  ),
                ],
              ),
            ),

            // ── Prefix & Suffix ───────────────────────────────────────────────
            ComponentSection(
              title: 'Prefix & Suffix',
              description:
                  'Add icons, text, or interactive widgets to either side of the input.',
              child: ChromiaCodePreview(
                code: '''
// Prefix icon + suffix text
ChromiaTextField(
  label: 'Email',
  hintText: 'user',
  prefixIcon: Icon(Icons.email),
  suffixText: '@example.com',
)

// Prefix text + suffix icon
ChromiaTextField(
  label: 'Phone',
  hintText: '234 567 8900',
  prefixText: '+1 ',
  suffixIcon: Icon(Icons.phone),
  keyboardType: TextInputType.phone,
)''',
                preview: Column(
                  children: [
                    ChromiaTextField(
                      label: 'Email',
                      hintText: 'user',
                      prefixIcon: const Icon(Icons.email),
                      suffixText: '@example.com',
                    ),
                    const SizedBox(height: 12),
                    ChromiaTextField(
                      label: 'Phone',
                      hintText: '234 567 8900',
                      prefixText: '+1 ',
                      suffixIcon: const Icon(Icons.phone),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
            ),

            // ── Helper & Character Limit ──────────────────────────────────────
            ComponentSection(
              title: 'Helper Text & Character Limit',
              description:
                  'helperText provides context below the field. '
                  'maxLength shows a character counter.',
              child: ChromiaCodePreview(
                code: '''
ChromiaTextField(
  label: 'Document',
  helperText: 'We never share your personal information.',
  prefixIcon: Icon(Icons.assignment_ind),
)

ChromiaTextField(
  label: 'Username',
  maxLength: 20,
  prefixIcon: Icon(Icons.account_circle),
)''',
                preview: Column(
                  children: [
                    ChromiaTextField(
                      label: 'Document',
                      helperText: 'We never share your personal information.',
                      prefixIcon: const Icon(Icons.assignment_ind),
                    ),
                    const SizedBox(height: 12),
                    ChromiaTextField(
                      label: 'Username',
                      maxLength: 20,
                      prefixIcon: const Icon(Icons.account_circle),
                    ),
                  ],
                ),
              ),
            ),

            // ── Password ──────────────────────────────────────────────────────
            ComponentSection(
              title: 'Password',
              description:
                  'Use obscureText: true and a toggle icon in suffixIcon '
                  'to create a password field with show/hide functionality.',
              child: ChromiaCodePreview(
                code: '''
ChromiaTextField(
  label: 'Password',
  obscureText: isObscured,
  prefixIcon: Icon(Icons.lock),
  suffixIcon: IconButton(
    icon: Icon(isObscured ? Icons.visibility : Icons.visibility_off),
    onPressed: () => setState(() => isObscured = !isObscured),
  ),
)''',
                preview: StatefulBuilder(
                  builder: (context, setState) {
                    return ChromiaTextField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      obscureText: _isPasswordObscured,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => _isPasswordObscured = !_isPasswordObscured,
                        ),
                        child: Icon(
                          _isPasswordObscured
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // ── Validation ────────────────────────────────────────────────────
            ComponentSection(
              title: 'Validation',
              description:
                  'Pass a list of ChromiaTextFieldValidator to validators. '
                  'Built-in validators include required, email, min/max length, and regex.',
              child: ChromiaCodePreview(
                code: '''
// Email validator
ChromiaTextField(
  label: 'Email',
  validators: [EmailValidator('Enter a valid email address')],
)

// Custom "already taken" check
ChromiaTextField(
  label: 'Username',
  initialValue: 'john_doe',
  validators: [
    DifferentValidator('Username is already taken',
        compareValue: 'john_doe'),
  ],
)''',
                preview: Column(
                  children: [
                    ChromiaTextField(
                      label: 'Email',
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                      validators: [EmailValidator('Enter a valid email address')],
                    ),
                    const SizedBox(height: 12),
                    ChromiaTextField(
                      label: 'Username',
                      initialValue: 'john_doe',
                      prefixIcon: const Icon(Icons.account_circle),
                      validators: [
                        DifferentValidator(
                          'Username is already taken',
                          compareValue: 'john_doe',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ── Multiline ─────────────────────────────────────────────────────
            ComponentSection(
              title: 'Multiline',
              description:
                  'Set maxLines > 1 (and optionally minLines) for text area inputs.',
              child: ChromiaCodePreview(
                code: '''
ChromiaTextField(
  label: 'Description',
  hintText: 'Enter a description...',
  maxLines: 4,
  minLines: 3,
)''',
                preview: ChromiaTextField(
                  label: 'Description',
                  hintText: 'Enter a description...',
                  maxLines: 4,
                  minLines: 3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
