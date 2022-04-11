part of updater;

/// Interface for updaters.
abstract class IUpdater {
  /// Interface for updaters.
  @mustCallSuper
  IUpdater() {
    _instance = this;
  }

  static final List<Exception> _errors = [];

  static IUpdater? _instance;

  /// Connectivity instance.
  final Connectivity connectivity = Connectivity();

  /// Clears all errors
  static void clearErrors() {
    _errors.clear();
  }

  /// A list of [Exception]s that occured during the update process.
  static List<Exception> get errors => _errors;

  /// Reports an error that occured during the update process.
  static void reportError(Exception e) => _errors.add(e);

  /// Reports an error that occured during the update process.
  void error(Object msg) => reportError(Exception(msg));

  /// True if an update is available.
  bool get updateAvailable;

  /// The current version of the app.
  String get currentVersion;

  /// The name of the app.
  String get appName;

  /// Checks for an update and returns a Future that completes with true if an update is available.
  Future<bool> update();

  /// Downloads the lates installer and launches the installer.
  Future<bool> upgrade(void Function(int, int) onProgress);

  /// The current instacne of the updater.
  static IUpdater get instance => _instance!;
}
