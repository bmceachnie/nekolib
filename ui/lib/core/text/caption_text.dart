part of nekolib_ui_core;

// ignore: camel_case_types
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
