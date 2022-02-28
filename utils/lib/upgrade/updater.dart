part of upgrade;

abstract class IUpdater {
  IUpdater({required this.currentVersion}) {
    assert(currentVersion != "");
    _instance = this;
  }

  static IUpdater? _instance;

  static bool _updateAvailable = false;
  static bool get updateAvailable => _updateAvailable;

  /// The current version of the app.
  final String currentVersion;

  /// Checks for an update and returns a Future that completes with true if an update is available.
  Future<bool> checkForUpdates();

  /// Downloads the lates installer and launches the installer.
  Future<void> upgrade();

  /// Checks for an update and returns a Future that completes with true if an update is available.
  static Future<bool> update() async {
    return _updateAvailable = await _instance?.checkForUpdates() ?? false;
  }
}
