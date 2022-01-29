import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nekolib.ui/crossplatform.dart';

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
