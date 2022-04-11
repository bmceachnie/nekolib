part of core;

/// Base class for every themed text.
class NcBaseText extends StatelessWidget {
  /// Base class for every themed text.
  NcBaseText(this.text, this.fontWeight, Key? key, this.fontSize, this.buttonText, this.overflow, this.textAlign, this.selectable, this.color) : super(key: key);

  /// The text to display.
  final String text;

  /// The font size to use for the text.
  final double? fontSize;

  /// The color to display the text in.
  final Color? color;

  /// If this is true [buttonTextColor] will be used as the text color.
  /// This will overwrite [color] if both are set.
  final bool buttonText;

  /// If this is true the text will be selectable.
  final bool selectable;

  /// How to handle text overflow.
  final TextOverflow overflow;

  /// Text alignment.
  final TextAlign textAlign;

  /// The font weight to use for the text.
  final FontWeight fontWeight;

  /// Creates a TextStyle based on the given [fontSize], [color], [fontWeight] and if [buttonText] is true [buttonTextColor] will be used as the text color.
  static TextStyle style({double? fontSize = 20, FontWeight fontWeight = FontWeight.normal, buttonText = false, Color? color}) {
    return GoogleFonts.roboto(fontWeight: fontWeight, fontSize: fontSize, color: buttonText ? NcThemes.current.buttonTextColor : color ?? NcThemes.current.textColor);
  }

  /// The theme data used if [selectable] is set to true.
  static TextSelectionThemeData webData() => TextSelectionThemeData(
        selectionColor: NcThemes.current.accentColor.withAlpha(100),
        cursorColor: NcThemes.current.accentColor,
        selectionHandleColor: NcThemes.current.accentColor,
      );

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
