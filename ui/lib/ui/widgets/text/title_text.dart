import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nekolib.ui/ui.dart';

// ignore: camel_case_types
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
