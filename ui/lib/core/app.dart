part of core;

/// A wrapper for themed apps that will automatically rebuild the app when [NcThemes.current] changes.
class NcApp extends StatelessWidget {
  /// Constructs a new [NcApp] with the given [builder].
  /// Wrapping with [NcApp] will automatically rebuild the app when [NcThemes.current] changes.
  /// If [onLoad] is set, it will be called when the app is first built.
  /// While waiting for the app to load, [loadingWidgetBuilder] will be used.
  /// If [appIcon] or [title] is set, both must not be null. This is because the app icon and title are used to build the [WindowHandle].
  /// In order for [WindowHandle] to work you have to do the following:
  /// - Add `bitsdojo_window` to your pubspec.yaml
  /// - For windows add the folowing lines to your `windows/runner/main.cpp` file:
  /// ```cpp
  /// #include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
  /// auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);
  /// ```
  /// - For macOS follow these [steps for macOS](https://github.com/bitsdojo/bitsdojo_window#for-macos-apps).
  /// - For Linux follow these [steps for Linux](https://github.com/bitsdojo/bitsdojo_window#for-linux-apps).
  NcApp({Key? key, required this.builder, this.loadingWidgetBuilder, this.onLoad, this.appIcon, this.title}) : super(key: key) {
    if (onLoad != null) {
      assert(loadingWidgetBuilder != null, 'If onLoad is set, loadingWidgetBuilder must also be set.');
    }

    if (appIcon != null || title != null) {
      assert(appIcon != null && title != null, 'If appIcon or title is set, both must be set.');
    }
  }

  /// The builder used to rebuild the app when [NcThemes.current] changes.
  final WidgetBuilder builder;

  /// The svg code for the app icon.
  /// If set, the app will display the icon in the window bar using [WindowHandle].
  final String? appIcon;

  /// The title of the app.
  /// If set, the app will display the title in the window bar using [WindowHandle].
  final String? title;

  /// Builds the loading indicator while the app is [load]ing.
  /// Muust not be null if [onLoad] is not null.
  final WidgetBuilder? loadingWidgetBuilder;

  /// This is only called once, before the app is built.
  /// While waiting for the app to load, the [loadingWidgetBuilder] is used, therefore it mus not be null if [onLoad] is set.
  final Future? onLoad;

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: title != null && appIcon != null,
      wrapper: (context, child) {
        return WindowHandle(
          child: child,
          appIcon: appIcon!,
          title: title!,
        );
      },
      child: ConditionalWrapper(
        condition: onLoad != null,
        wrapper: (context, app) => FutureBuilder(
          future: onLoad,
          builder: (context, snapshot) => snapshot.connectionState.isDone ? app : loadingWidgetBuilder!.call(context),
        ),
        child: StreamBuilder<NcTheme>(
          stream: NcThemes.onCurrentThemeChanged,
          builder: (context, _) => builder(context),
        ),
      ),
    );
  }
}

/// Wraps the given app in an [NcApp] with the given [appBuilder] and runs it using [runApp].
/// Wrapping with [NcApp] will automatically rebuild the app when [NcThemes.current] changes.
/// If [onLoad] is set, it will be called when the app is first built.
/// While waiting for the app to load, [loadingWidgetBuilder] will be used.
/// If [appIcon] or [title] is set, both must not be null. This is because the app icon and title are used to build the [WindowHandle].
/// In order for [WindowHandle] to work you have to do the following:
/// - Add `bitsdojo_window` to your pubspec.yaml
/// - For windows add the folowing lines to your `windows/runner/main.cpp` file:
/// ```cpp
/// #include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
/// auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);
/// ```
/// - For macOS follow these [steps for macOS](https://github.com/bitsdojo/bitsdojo_window#for-macos-apps).
/// - For Linux follow these [steps for Linux](https://github.com/bitsdojo/bitsdojo_window#for-linux-apps).
void runThemedApp({required WidgetBuilder appBuilder, Future? onLoad, WidgetBuilder? loadingWidgetBuilder, String? appIcon, String? title, Size minSize = const Size(800, 600)}) {
  NcThemes.initPredefinedThemes();

  runApp(NcApp(builder: appBuilder, loadingWidgetBuilder: loadingWidgetBuilder, onLoad: onLoad, appIcon: appIcon, title: title));

  doWhenWindowReady(() {
    appWindow
      ..minSize = minSize
      ..title = title ?? 'No  title provided'
      ..show();
  });
}
