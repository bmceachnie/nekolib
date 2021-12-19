import 'package:flutter/material.dart';
import 'package:nekolib.ui/ui.dart';

// ignore: camel_case_types
class NcTitleText extends NcBaseText {
  NcTitleText(
    String text, {
    Key? key,
    double? fontSize,
    bool buttonText = false,
    bool selectable = false,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign textAlign = TextAlign.left,
  }) : super(text, FontWeight.bold, key, fontSize, buttonText, overflow, textAlign, selectable);
}
