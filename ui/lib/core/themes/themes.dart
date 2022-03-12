part of core;

/// Database of all themes.
class NcThemes {
  /// The current active theme.
  /// Defaults to [lightTheme].
  static NcTheme _current = lightTheme;

  /// The current active theme.
  /// Defaults to [lightTheme].
  static NcTheme get current => _current;

  /// Sets the current [theme] and calls [onCurrentThemeChanged] the theme changes.
  /// Use [force] in order to force an update of the theme even if it has not changed.
  static void setTheme(NcTheme theme, {bool force = false}) {
    if (theme == _current && !force) return;

    log('[NcThemes] setTheme: ${theme.name}', type: LogTypes.tracking);

    _current = theme;
    _themeNotfier.sink.add(theme);
  }

  /// Stream to notify listeners when the current theme changes.
  // ignore: close_sinks
  static final StreamController<NcTheme> _themeNotfier = BehaviorSubject.seeded(lightTheme);

  /// Emmits the new [NcTheme] when [setTheme] is used and the current theme changes.
  static Stream<NcTheme> get onCurrentThemeChanged => _themeNotfier.stream;

  /// Contains all themes.
  static Map<String, NcTheme> _all = {};

  /// Contains all themes with their corresponding names as key.
  static Map<String, NcTheme> get all => Map.unmodifiable(_all);

  /// Adds a new [theme] to the database.
  /// The [theme] must have a unique name.
  static void registerTheme(NcTheme theme) {
    assert(!_all.containsKey(theme.name));

    _all[theme.name] = theme;
  }

  /// Ensures that all predefined themes are registered.
  /// This method is called automatically when using [runThemedApp].
  static void initPredefinedThemes() {
    registerTheme(lightTheme);
    registerTheme(darkTheme);
    registerTheme(oceanTheme);
    registerTheme(sakuraTheme);
  }
}

/// Sets the current [theme] and calls [onCurrentThemeChanged] the theme changes.
/// Use [force] in order to force an update of the theme even if it has not changed.
void setTheme(NcTheme theme, {bool force = false}) => NcThemes.setTheme(theme, force: force);

/// Predefined Light Theme
final NcTheme lightTheme = NcTheme.predifined(
  "Light",
  brightness: Brightness.light,
  primaryColor: Color(0xFFFFFFFF),
  secondaryColor: Color(0xFFF2F3F9),
  tertiaryColor: Color(0xFFCFCFCF),
  accentColor: Color(0xFF27BCF3),
  textColor: Color(0xFF1D1D1D),
  buttonTextColor: Color(0xFFFFFFFF),
  icon: Icons.wb_sunny,
  iconColor: Colors.amber,
);

/// Predefined Dark Theme
final NcTheme darkTheme = NcTheme.predifined(
  "Dark",
  brightness: Brightness.dark,
  primaryColor: Color(0xFF1D1D1D),
  secondaryColor: Color(0xFF2A2A2A),
  tertiaryColor: Color(0xFF444444),
  accentColor: Color(0xFF27BCF3),
  textColor: Color(0xFFFFFFFF),
  icon: FontAwesome5Solid.moon,
  iconColor: Colors.white,
);

/// Predefined Ocean Theme
final NcTheme oceanTheme = NcTheme.predifined(
  "Ocean",
  brightness: Brightness.dark,
  primaryColor: Color(0xFF212942),
  secondaryColor: Color(0xFF262E48),
  tertiaryColor: Color(0xFF3D4C80),
  accentColor: Color(0xFF78A5FE),
  textColor: Color(0xFFF8F2F2),
  successColor: Color(0xFF208767),
  warningColor: Color(0xFFCCB941),
  errorColor: Color(0xFFD15C4F),
  neutralColor: Color(0xFF626D6E),
  icon: FontAwesome5Solid.tint,
  iconColor: Color(0xFF78A5FE),
);

/// Predefined Sakura Theme
final NcTheme sakuraTheme = NcTheme.predifined(
  "桜",
  brightness: Brightness.light,
  primaryColor: Color(0xFFFCE9EB),
  secondaryColor: Color(0xFFF3DCDB),
  tertiaryColor: Color(0xFFECBDB0),
  accentColor: Color(0xFFF3A39E),
  textColor: Color(0xFF8C5E6B),
  buttonTextColor: Color(0xFFFCE9EB),
  successColor: Color(0xFFB2C959),
  warningColor: Color(0xFFE5D75A),
  errorColor: Color(0xFFC26161),
  neutralColor: Color(0xFFE0BAC0),
  icon: FontAwesome5Solid.tree,
  iconColor: Color(0xFFF3A39E),
);

/// The primary color of the current active [NcThemes]. This is used for foreground elements.
Color get primaryColor => NcThemes.current.primaryColor;

/// The secondary color of the current active [NcTheme]. This is used for the background of the app.
Color get secondaryColor => NcThemes.current.secondaryColor;

/// The teritary color of the current active [NcTheme]. Used for popups, tooltips, etc.
Color get tertiaryColor => NcThemes.current.tertiaryColor;

/// The accent color of the current active [NcTheme]. Used for buttons, scrollbars, etc.
Color get accentColor => NcThemes.current.accentColor;

/// The text color of the current active [NcTheme]. Used for text, labels, etc.
Color get textColor => NcThemes.current.textColor;

/// The button text color of the current active [NcTheme]. Used for text or icons inside buttons.
Color get buttonTextColor => NcThemes.current.buttonTextColor;

/// The neutral color of the current active [NcTheme]. Used to give feedback to the user. For example, when a task is pending.
Color get neutralColor => NcThemes.current.neutralColor;

/// The error color of the current active [NcTheme]. Used to give feedback to the user. For example, when a task was completed with major errors.
Color get errorColor => NcThemes.current.errorColor;

/// The warning color of the current active [NcTheme]. Used to give feedback to the user. For example, when a task was completed with minor errors.
Color get warningColor => NcThemes.current.warningColor;

/// The success color of the current active [NcTheme]. Used to give feedback to the user. For example, when a task was successfully completed.
Color get successColor => NcThemes.current.successColor;

/// The brightness of the current active [NcTheme].
Brightness get brightness => NcThemes.current.brightness;
