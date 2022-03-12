part of log;

/// Types of log messages.
enum LogTypes {
  /// Log message containing user information.
  info,

  /// Log message of a warning.
  warning,

  /// Log message of an error.
  error,

  /// Log message for debugging.
  debug,

  /// Log message for a successfull action.
  success,

  /// Log message for a critical error, which could cause the application to crash.
  fatal,
}
