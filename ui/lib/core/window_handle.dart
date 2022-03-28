part of core;

/// Wrapper for a themed window bar.
/// [WindowHandle] uses [secondaryColor] for the window bar background.
/// Using [bitsdojo_window](https://pub.dev/packages/bitsdojo_window).
/// In order to use this window handle you have to do the following:
/// - Add `bitsdojo_window` to your pubspec.yaml
/// - For windows add the folowing lines to your `windows/runner/main.cpp` file:
/// ```cpp
/// #include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
/// auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);
/// ```
/// - For macOS follow these [steps for macOS](https://github.com/bitsdojo/bitsdojo_window#for-macos-apps).
/// - For Linux follow these [steps for Linux](https://github.com/bitsdojo/bitsdojo_window#for-linux-apps).
class WindowHandle extends StatelessWidget {
  /// Wrapper for a themed window bar.
  /// Using [bitsdojo_window](https://pub.dev/packages/bitsdojo_window).
  const WindowHandle({Key? key, required this.child, required this.appIcon, required this.title}) : super(key: key);

  /// The child widget.
  final Widget child;

  /// The svg code for the app icon.
  final String appIcon;

  /// The title of the app.
  final String title;

  @override
  Widget build(BuildContext context) {
    var defaultColors = WindowButtonColors(
      iconNormal: textColor,
      normal: Colors.transparent,
      iconMouseOver: textColor,
      mouseOver: tertiaryColor.withOpacity(.3),
      iconMouseDown: textColor,
      mouseDown: tertiaryColor.withOpacity(.5),
    );

    var closeColors = WindowButtonColors(
      mouseOver: errorColor,
      iconNormal: textColor,
      normal: Colors.transparent,
      iconMouseOver: buttonTextColor,
      iconMouseDown: buttonTextColor,
      mouseDown: errorColor,
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          WindowTitleBarBox(
            child: Container(
              color: secondaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NcSpacing.small(),
                  NcVectorImage(
                    code: appIcon,
                    width: 18,
                    height: 18,
                  ),
                  NcSpacing.xs(),
                  Expanded(
                    child: MoveWindow(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: NcCaptionText(
                          title,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  MinimizeWindowButton(colors: defaultColors),
                  MaximizeWindowButton(colors: defaultColors),
                  CloseWindowButton(colors: closeColors),
                ],
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
