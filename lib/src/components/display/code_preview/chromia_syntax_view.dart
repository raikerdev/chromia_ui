import 'dart:math' as math;

import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class ChromiaSyntaxView extends StatefulWidget {
  const ChromiaSyntaxView({
    required this.code,
    required this.syntax,
    this.syntaxTheme,
    this.fontSize = 14.0,
    super.key,
  });

  /// Code text
  final String code;

  /// Syntax/Language (Dart, C, C++...)
  final Syntax syntax;

  /// Theme of syntax view example SyntaxTheme.dracula() (default: SyntaxTheme.dracula())
  final SyntaxTheme? syntaxTheme;

  /// Font Size with a default value of 14.0
  final double fontSize;

  @override
  State<StatefulWidget> createState() => ChromiaSyntaxViewState();
}

class ChromiaSyntaxViewState extends State<ChromiaSyntaxView> {
  /// For zooming Controls
  static const double maxFontScaleFactor = 1.3;
  static const double minFontScaleFactor = 1;
  double _fontScaleFactor = 1.0;
  late ScrollController _verticalScrollController;

  @override
  void initState() {
    super.initState();
    _verticalScrollController = ScrollController();
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.chromiaTheme;
    final isDark = theme.brightness == Brightness.dark;
    final fontFamily = theme.typography.code.fontFamily;

    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: widget.syntaxTheme!.backgroundColor,
          child: buildCodeWithLinesCount(isDark, fontFamily),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: zoomControls(),
        ),
      ],
    );
  }

  Widget buildCodeWithLinesCount(bool isDark, String? fontFamily) {
    final int numLines = '\n'.allMatches(widget.code).length + 1;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      spacing: 10,
      children: [
        Container(
          width: 35,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF21252B) : const Color(0xFFEEEEEE),
            border: Border(right: BorderSide(color: widget.syntaxTheme!.linesCountColor!)),
          ),
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int i = 1; i <= numLines; i++)
                ChromiaRichText(
                  textScaler: TextScaler.linear(_fontScaleFactor),
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: widget.fontSize,
                      color: widget.syntaxTheme!.linesCountColor,
                    ),
                    text: '$i',
                  ),
                ),
            ],
          ),
        ),
        buildCode(fontFamily),
      ],
    );
  }

  Widget buildCode(String? fontFamily) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
      child: RichText(
        textScaler: TextScaler.linear(_fontScaleFactor),
        text: TextSpan(
          style: TextStyle(fontFamily: fontFamily, fontSize: widget.fontSize),
          children: <TextSpan>[getSyntax(widget.syntax, widget.syntaxTheme).format(widget.code)],
        ),
      ),
    );
  }

  Widget zoomControls() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.zoom_out, color: widget.syntaxTheme!.zoomIconColor),
          onPressed: () => setState(() {
            _fontScaleFactor = math.max(minFontScaleFactor, _fontScaleFactor - 0.1);
          }),
        ),
        IconButton(
          icon: Icon(Icons.zoom_in, color: widget.syntaxTheme!.zoomIconColor),
          onPressed: () => setState(() {
            _fontScaleFactor = math.min(maxFontScaleFactor, _fontScaleFactor + 0.1);
          }),
        ),
      ],
    );
  }
}
