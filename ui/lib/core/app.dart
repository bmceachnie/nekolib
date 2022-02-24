part of core;

/// A wrapper for themed apps that will automatically rebuild the app when [NcThemes.current] changes.
class NcApp extends StatelessWidget {
  NcApp({Key? key, required this.builder}) : super(key: key);

  /// The builder used to rebuild the app when [NcThemes.current] changes.
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NcTheme>(
      stream: NcThemes.onCurrentThemeChanged,
      builder: (context, _) => builder(context),
    );
  }
}

/// Wraps the given [app] in an [NcApp] widget and calls the [runApp] method.
void runThemedApp(WidgetBuilder app) {
  NcThemes.initPredefinedThemes();

  runApp(NcApp(builder: app));
}
