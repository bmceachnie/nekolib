part of core;

/// Represents a theme for an application.
class NcTheme {
  /// Creates a new theme with the given properties and registers it in the database.
  /// Where [buttonTextColor] &rarr; The text color of the theme. Used for text or icons inside buttons. If not set, [textColor] is used.
  NcTheme(
    this.name, {
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.accentColor,
    required this.textColor,
    required this.brightness,
    Color? buttonTextColor,
    this.neutralColor = defaultNeutralColor,
    this.errorColor = defaultErrorColor,
    this.warningColor = defaultWarningColor,
    this.successColor = defaultSuccessColor,
    required this.icon,
    required this.iconColor,
  }) {
    this.buttonTextColor = buttonTextColor ?? textColor;

    NcThemes.registerTheme(this);
  }

  /// Creates a copy of this theme with a new given name and new given properties. If a property is not set, it will be inherited from the original theme.
  /// The new theme will be registered in the database automatically.
  ///
  /// [name] The name of the new theme.
  ///
  /// [primaryColor] The primary color of the theme. This is used for foreground elements.
  ///
  /// [secondaryColor] The secondary color of the theme. This is used for the background of the app.
  ///
  /// [tertiaryColor] The tertiary color of the theme. Used for popups, tooltips, etc.
  ///
  /// [accentColor] The accent color of the theme. Used for buttons, scrollbars, etc.
  ///
  /// [textColor] The text color of the theme. Used for text, labels, etc.
  ///
  /// [buttonTextColor] The text color of the theme. Used for text or icons inside buttons. If not set, [textColor] is used.
  ///
  /// [successColor] Success color. Used to give feedback to the user. For example, when a task is successfully uploaded.
  ///
  /// [warningColor] Warning color. Used to give feedback to the user. For example, when a task was completed with minor errors.
  ///
  /// [errorColor] The color of error messages.
  ///
  /// [neutralColor] The color of neutral messages.
  ///
  /// [icon] The icon used to represent the theme in the ui.
  ///
  /// [iconColor] The color of the icon of the theme.
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
    Brightness? brightness,
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
      brightness: brightness ?? this.brightness,
      icon: icon,
      iconColor: iconColor,
    );
  }

  /// The primary color of the theme. This is used for foreground elements.
  late final Color primaryColor;

  /// The secondary color of the theme. This is used for the background of the app.
  late final Color secondaryColor;

  /// The tertiary color of the theme. Used for popups, tooltips, etc.
  late final Color tertiaryColor;

  /// The accent color of the theme. Used for buttons, scrollbars, etc.
  late final Color accentColor;

  /// The text color of the theme. Used for text, labels, etc.
  late final Color textColor;

  /// The text color of the theme. Used for text or icons inside buttons. If not set, [textColor] is used.
  late final Color buttonTextColor;

  /// Success color. Used to give feedback to the user. For example, when a task was successfully completed. If not set, defaults to [defaultSuccessColor].
  late final Color successColor;

  /// Warning color. Used to give feedback to the user. For example, when a task was completed with minor errors. If not set, defaults to [defaultWarningColor].
  late final Color warningColor;

  /// Error color. Used to give feedback to the user. For example, when a task was completed with major errors. If not set, defaults to [defaultErrorColor].
  late final Color errorColor;

  /// Neutral color. Used to give feedback to the user. For example, when a task is pending. If not set, defaults to [defaultNeutralColor].
  late final Color neutralColor;

  /// The icon used to represent the theme in the ui.
  final IconData icon;

  /// The color of the icon of the theme.
  final Color iconColor;

  /// The brightness of the theme.
  final Brightness brightness;

  /// The name of the theme. Has to be unique.
  final String name;

  /// The default success color.
  static const Color defaultSuccessColor = const Color(0xFF4FB930);

  /// The default warning color.
  static const Color defaultWarningColor = const Color(0xFFF1C40F);

  /// The default error color.
  static const Color defaultErrorColor = const Color(0xFFE74C3C);

  /// The default neutral color.
  static const Color defaultNeutralColor = const Color(0xFF7F8C8D);
}
