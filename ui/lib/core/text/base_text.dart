part of nekolib_ui_core;

class NcBaseText extends StatelessWidget {
  NcBaseText(this.text, this.fontWeight, Key? key, this.fontSize, this.buttonText, this.overflow, this.textAlign, this.selectable, this.color) : super(key: key);

  final String text;
  final double? fontSize;
  final Color? color;
  final bool buttonText;
  final bool selectable;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  static const fontFamily = "Roboto";

  static TextStyle style({double? fontSize = 20, FontWeight fontWeight = FontWeight.normal, buttonText = false, Color? color}) {
    return TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: buttonText ? NcThemes.current.buttonTextColor : color ?? NcThemes.current.textColor, fontFamily: fontFamily);
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
              style: style(fontSize: fontSize, fontWeight: fontWeight, buttonText: buttonText, color: color),
              textAlign: textAlign,
            ),
          )
        : Text(
            text,
            style: style(fontSize: fontSize, fontWeight: fontWeight, buttonText: buttonText, color: color),
            overflow: overflow,
            textAlign: textAlign,
          );
  }
}
