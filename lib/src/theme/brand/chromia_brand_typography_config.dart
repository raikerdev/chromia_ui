class ChromiaBrandTypographyConfig {
  const ChromiaBrandTypographyConfig({
    required this.defaultFontFamily,
    String? displayFontFamily,
    String? headlineFontFamily,
    String? titleFontFamily,
    String? bodyFontFamily,
    String? labelFontFamily,
  }) : _displayFontFamily = displayFontFamily,
       _headlineFontFamily = headlineFontFamily,
       _titleFontFamily = titleFontFamily,
       _bodyFontFamily = bodyFontFamily,
       _labelFontFamily = labelFontFamily;

  final String? defaultFontFamily;
  final String? _displayFontFamily;
  final String? _headlineFontFamily;
  final String? _titleFontFamily;
  final String? _bodyFontFamily;
  final String? _labelFontFamily;

  String? get displayFontFamily => _displayFontFamily ?? defaultFontFamily;

  String? get headlineFontFamily => _headlineFontFamily ?? defaultFontFamily;

  String? get titleFontFamily => _titleFontFamily ?? defaultFontFamily;

  String? get bodyFontFamily => _bodyFontFamily ?? defaultFontFamily;

  String? get labelFontFamily => _labelFontFamily ?? defaultFontFamily;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is ChromiaBrandTypographyConfig &&
        other.displayFontFamily == displayFontFamily &&
        other.headlineFontFamily == headlineFontFamily &&
        other.titleFontFamily == titleFontFamily &&
        other.bodyFontFamily == bodyFontFamily &&
        other.labelFontFamily == labelFontFamily;
  }

  @override
  int get hashCode {
    return Object.hash(
      displayFontFamily,
      headlineFontFamily,
      titleFontFamily,
      bodyFontFamily,
      labelFontFamily,
    );
  }
}
