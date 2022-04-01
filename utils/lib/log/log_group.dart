part of log;

/// Implements a logging group for logging messages.
/// This will automatically use [logGroup] as the group for all log called from within the implementing class.
abstract class ILogGroup {
  /// The name of the group.
  /// This is used to identify the group in the log file.
  String get logGroup;

  @nonVirtual

  /// Logs the given [msg].
  /// [type] is the type of the log (defaults to [LogTypes.debug]).
  /// If in [kDebugMode] the [msg] is logged to the console.
  /// If [autoSave] is true, the log is saved to the file.
  /// Users [logGroup] as the group name.
  void log(Object msg, [LogTypes type = LogTypes.debug]) => Logger.log(msg.toString(), type, logGroup);
}
