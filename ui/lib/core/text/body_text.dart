part of core;

/// Used to display a themed text with [FontWeight.normal].
class NcBodyText extends NcBaseText {
  /// Used to display a themed text with [FontWeight.normal].
  NcBodyText(
    String text, {
    Key? key,
    double? fontSize,
    bool buttonText = false,
    bool selectable = kIsWeb,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign textAlign = TextAlign.left,
    Color? color,
  }) : super(text, FontWeight.normal, key, fontSize, buttonText, overflow, textAlign, selectable, color);
}
