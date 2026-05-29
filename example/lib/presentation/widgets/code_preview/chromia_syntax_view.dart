import 'package:chromia_ui/chromia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ChromiaSyntaxView extends StatefulWidget {
  const ChromiaSyntaxView({
    required this.code,
    this.syntaxTheme,
    this.fontSize = 14.0,
    this.fontScaleFactor = 1.0,
    super.key,
  });

  /// Code text
  final String code;

  /// Theme of syntax view
  final SyntaxTheme? syntaxTheme;

  /// Font Size (default: 14.0)
  final double fontSize;

  final double fontScaleFactor;

  @override
  State<StatefulWidget> createState() => ChromiaSyntaxViewState();
}

class ChromiaSyntaxViewState extends State<ChromiaSyntaxView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: widget.syntaxTheme!.backgroundColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: _buildCodeWithLinesCount(context),
      ),
    );
  }

  Widget _buildCodeWithLinesCount(BuildContext context) {
    final int numLines = '\n'.allMatches(widget.code).length + 1;
    final colors = context.chromiaColors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        Container(
          width: 40,
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int i = 1; i <= numLines; i++)
                ChromiaRichText(
                  textScaler: TextScaler.linear(widget.fontScaleFactor),
                  text: TextSpan(
                    style: GoogleFonts.googleSansCode(
                      fontSize: widget.fontSize,
                      color: colors.onSurfaceContainer,
                    ),
                    text: '$i',
                  ),
                ),
            ],
          ),
        ),
        _buildCode(),
      ],
    );
  }

  Widget _buildCode() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
      child: RichText(
        textScaler: TextScaler.linear(widget.fontScaleFactor),
        text: TextSpan(
          style: GoogleFonts.googleSansCode(fontSize: widget.fontSize),
          children: <TextSpan>[
            getSyntax(Syntax.DART, widget.syntaxTheme).format(widget.code),
          ],
        ),
      ),
    );
  }
}
