import 'package:flutter/material.dart';
import 'package:nekolib.ui/crossplatform.dart';

/// Represents a theme for an application.
class NcTheme {
  /// Creates a new theme and registers it in the database.
  /// [name] is the name of the theme.
  /// [primaryColor] is the primary color of the theme.
  /// [secondaryColor] is the secondary color of the theme. It is used for the background of the app.
  /// [tertiaryColor] is the tertiary color of the theme.
  /// [accentColor] is the color of the accent.
  /// [textColor] is the text color of the theme.
  /// [buttonTextColor] is the text color of the buttons.
  ///
  ///
  NcTheme(
    this.name, {
    required Color primaryColor,
    required Color secondaryColor,
    required Color tertiaryColor,
    required Color accentColor,
    required Color textColor,
    Color? buttonTextColor,
    Color? pendingColor,
    Color? lateColor,
    Color? uploadedColor,
    Color? successColor,
    required this.icon,
    required this.iconColor,
  }) {
    assert(!NcThemes.all.containsKey(name));

    this.primaryColor = primaryColor;
    this.secondaryColor = secondaryColor;
    this.tertiaryColor = tertiaryColor;
    this.accentColor = accentColor;
    this.textColor = textColor;
    this.buttonTextColor = buttonTextColor ?? textColor;

    this.successColor = successColor ?? Color(0xFF4FB930);
    this.warningColor = uploadedColor ?? Color(0xFFF1C40F);
    this.errorColor = lateColor ?? Color(0xFFE74C3C);
    this.neutralColor = pendingColor ?? Color(0xFF7F8C8D);

    NcThemes.registerTheme(this);
  }

  NcTheme copyWith(
    String name, {
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? accentColor,
    Color? textColor,
    Color? buttonTextColor,
    Color? pendingColor,
    Color? lateColor,
    Color? uploadedColor,
    Color? successColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return new NcTheme(
      name,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      accentColor: accentColor ?? this.accentColor,
      textColor: textColor ?? this.textColor,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      icon: icon,
      iconColor: iconColor,
    );
  }

  late final Color primaryColor;
  late final Color secondaryColor;
  late final Color tertiaryColor;
  late final Color accentColor;
  late final Color textColor;
  late final Color buttonTextColor;

  late final Color successColor;
  late final Color warningColor;
  late final Color errorColor;
  late final Color neutralColor;

  final IconData icon;
  final Color iconColor;
  final String name;
}
