import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nekolib.ui/ui.dart';

class NcBaseText extends StatelessWidget {
  const NcBaseText(this.text, this.fontWeight, Key? key, this.fontSize, this.buttonText, this.overflow, this.textAlign, this.selectable) : super(key: key);

  final String text;
  final double? fontSize;
  final bool buttonText;
  final bool selectable;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  static TextStyle style({double? fontSize = 20, FontWeight fontWeight = FontWeight.normal, buttonText = false}) {
    return TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: buttonText ? NcThemes.current.buttonTextColor : NcThemes.current.textColor, fontFamily: "Roboto");
  }

  static TextSelectionThemeData webData() {
    return TextSelectionThemeData(selectionColor: NcThemes.current.accentColor.withAlpha(100), cursorColor: NcThemes.current.accentColor, selectionHandleColor: NcThemes.current.accentColor);
  }

  @override
  Widget build(BuildContext context) {
    return selectable && !buttonText
        ? Theme(
            data: ThemeData(
              textSelectionTheme: webData(),
            ),
            child: SelectableText(
              text,
              style: style(fontSize: fontSize, fontWeight: fontWeight, buttonText: buttonText),
              textAlign: textAlign,
            ),
          )
        : Text(
            text,
            style: style(fontSize: fontSize, fontWeight: fontWeight, buttonText: buttonText),
            overflow: overflow,
            textAlign: textAlign,
          );
  }
}
