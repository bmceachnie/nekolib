part of core;

/// Used to display a themed text with [FontWeight.bold].
class NcTitleText extends NcBaseText {
  /// Used to display a themed text with [FontWeight.bold].
  NcTitleText(
    String text, {
    Key? key,
    double? fontSize,
    bool buttonText = false,
    bool selectable = kIsWeb,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign textAlign = TextAlign.left,
    Color? color,
  }) : super(text, FontWeight.bold, key, fontSize, buttonText, overflow, textAlign, selectable, color);
}
