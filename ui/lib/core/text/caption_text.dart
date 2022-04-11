part of core;

/// Used to display a themed text with [FontWeight.w600].
class NcCaptionText extends NcBaseText {
  /// Used to display a themed text with [FontWeight.w600].
  NcCaptionText(
    String text, {
    Key? key,
    double? fontSize,
    bool buttonText = false,
    bool selectable = kIsWeb,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign textAlign = TextAlign.left,
    Color? color,
  }) : super(text, FontWeight.w600, key, fontSize, buttonText, overflow, textAlign, selectable, color);
}
