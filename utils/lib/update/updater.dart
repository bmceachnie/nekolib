part of update;

abstract class IUpdater {
  @mustCallSuper
  IUpdater({required this.appName, required this.currentVersion}) {
    assert(currentVersion != "");
    _instance = this;
  }

  static final List<Exception> _errors = [];

  static IUpdater? _instance;

  static void clearErrors() {
    _errors.clear();
  }

  static List<Exception> get errors => _errors;

  static void reportError(Exception e) => _errors.add(e);

  // ignore: prefer_final_fields, unused_field
  bool _updateAvailable = false;

  /// True if an update is available.
  bool get updateAvailable => _updateAvailable;

  /// The current version of the app.
  final String currentVersion;

  /// The name of the app.
  final String appName;

  /// Checks for an update and returns a Future that completes with true if an update is available.
  Future<bool> update();

  /// Downloads the lates installer and launches the installer.
  Future<bool> upgrade(Function(int int) onProgress);

  static IUpdater get instance => _instance!;
}
