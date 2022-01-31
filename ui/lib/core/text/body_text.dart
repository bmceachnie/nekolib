part of nekolib_ui_core;

class NcBodyText extends NcBaseText {
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
