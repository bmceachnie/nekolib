part of nekolib_ui_core;

class NcCaptionText extends NcBaseText {
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
