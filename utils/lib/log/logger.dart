part of log;

/// Class for logging messages.
class Logger {
  /// The path to the directory where app files are stored.
  static String _appStoragePath = "";

  /// A flag that determines whether the log file is automatically saved.
  static bool _autoSave = false;

  static bool _isInitialized = false;

  /// Ensures that the logger is initialized.
  static void _ensureInitialized() {
    assert(_isInitialized, "Logger is not initialized.");
  }

  /// Inintializes the logger.
  /// [appStoragePath] is the path to the directory where app files are stored.
  /// [autoSave] is a flag that determines whether the log file is automatically saved.
  /// If [autoSave] is true, the given [appStoragePath] has to be not null and must exist.
  static void init({bool autoSave = false, String? appStoragePath}) {
    assert(!_isInitialized, "Logger is already initialized.");

    if (autoSave) {
      assert(appStoragePath != null && Directory(appStoragePath).existsSync(), "The given app storage path does not exist.");
    }

    _appStoragePath = appStoragePath ?? "";
    _autoSave = autoSave;

    FlutterError.onError = (FlutterErrorDetails details) {
      if (kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        log(details.exception.toString(), LogTypes.flutter);
      }
    };

    _isInitialized = true;
  }

  /// All logs that have been logged so far in this session.
  static final List<LogEntry> _logs = [];

  /// All logs that have been logged so far in this session.
  static List<LogEntry> get logs => List.unmodifiable(_logs);

  /// Stream of logs.
  static final StreamController<LogEntry> _logNotifier = BehaviorSubject.seeded(LogEntry.empty());

  /// Emmits new logs when [log] is called.
  static Stream<LogEntry> get logStream => _logNotifier.stream;

  /// The name of the file where the logs are saved.
  static final logFileName = "session_${DateTime.now().logFormat}.log";

  /// Logs the given [msg].
  /// [type] is the type of the log (defaults to [LogTypes.debug]).
  /// If in [kDebugMode] the [msg] is logged to the console.
  /// If [autoSave] is true, the log is saved to the file.
  static Future log(String msg, [LogTypes type = LogTypes.debug]) async {
    var entry = LogEntry(message: msg, type: type, date: DateTime.now(), group: StackTrace.current.method);

    if (kDebugMode) {
      print(entry.toString());
    } else if (_autoSave) {
      var f = await logFile;
      f.writeAsStringSync(entry.toString(), mode: FileMode.append);
    }

    _logNotifier.sink.add(entry);
    _logs.add(entry);
  }

  /// Returns the directory where the logs are saved.
  static Future<Directory> get logDir async {
    _ensureInitialized();
    return Directory("$_appStoragePath/logs").create();
  }

  /// Returns the log file.
  static Future<File> get logFile async {
    _ensureInitialized();
    var dir = await logDir;
    return File('${dir.path}/$logFileName');
  }
}

/// Logs the given [msg].
/// [type] is the type of the log (defaults to [LogTypes.debug]).
/// If in [kDebugMode] the [msg] is logged to the console.
/// If [autoSave] is true, the log is saved to the file.
void log(Object msg, [LogTypes type = LogTypes.debug]) => Logger.log(msg.toString(), type);
