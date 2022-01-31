part of nekolib_ui_crossplatform;

class NcTitleText extends NcBaseText {
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
