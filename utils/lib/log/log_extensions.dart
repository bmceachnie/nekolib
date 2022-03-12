part of log;

/// Formatter for the log file name.
final DateFormat _formatter = DateFormat('yyyy-MM-dd--HH-mm-ss');

/// Extionson for date formatting.
extension DateLogExtension on DateTime {
  String get logFormat => _formatter.format(this);
}

extension LogTypeEmojis on LogTypes {
  /// Returns the emoji for the log type.
  String get emoji => this == LogTypes.info
      ? '💡'
      : this == LogTypes.error
          ? '❌'
          : this == LogTypes.warning
              ? '⚠️'
              : this == LogTypes.success
                  ? '✅'
                  : this == LogTypes.debug
                      ? '🐞'
                      : this == LogTypes.tracking
                          ? '📈'
                          : this == LogTypes.flutter
                              ? '🐦'
                              : '🔥';
}
