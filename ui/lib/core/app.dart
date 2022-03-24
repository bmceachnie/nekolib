part of core;

/// A wrapper for themed apps that will automatically rebuild the app when [NcThemes.current] changes.
class NcApp extends StatelessWidget {
  /// Constructs a new [NcApp] with the given [builder].
  /// Wrapping with [NcApp] will automatically rebuild the app when [NcThemes.current] changes.
  /// If [onLoad] is set, it will be called when the app is first built.
  /// While waiting for the app to load, [loadingWidgetBuilder] will be used.
  NcApp({Key? key, required this.builder, this.loadingWidgetBuilder, this.onLoad}) : super(key: key) {
    if (onLoad != null) {
      assert(loadingWidgetBuilder != null, 'If onLoad is set, loadingWidgetBuilder must also be set.');
    }
  }

  /// The builder used to rebuild the app when [NcThemes.current] changes.
  final WidgetBuilder builder;

  /// Builds the loading indicator while the app is [load]ing.
  /// Muust not be null if [onLoad] is not null.
  final WidgetBuilder? loadingWidgetBuilder;

  /// This is only called once, before the app is built.
  /// While waiting for the app to load, the [loadingWidgetBuilder] is used, therefore it mus not be null if [onLoad] is set.
  final Future? onLoad;

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: onLoad != null,
      wrapper: (context, app) => FutureBuilder(
        future: onLoad,
        builder: (context, snapshot) => snapshot.connectionState.isDone ? app : loadingWidgetBuilder!.call(context),
      ),
      child: StreamBuilder<NcTheme>(
        stream: NcThemes.onCurrentThemeChanged,
        builder: (context, _) => builder(context),
      ),
    );
  }
}

/// Wraps the given app in an [NcApp] with the given [appBuilder] and runs it using [runApp].
/// Wrapping with [NcApp] will automatically rebuild the app when [NcThemes.current] changes.
/// If [onLoad] is set, it will be called when the app is first built.
/// While waiting for the app to load, [loadingWidgetBuilder] will be used.
void runThemedApp({required WidgetBuilder appBuilder, Future Function()? onLoad, WidgetBuilder? loadingWidgetBuilder}) {
  NcThemes.initPredefinedThemes();

  runApp(NcApp(builder: appBuilder, loadingWidgetBuilder: loadingWidgetBuilder, onLoad: onLoad));
}
