part of log;

/// An entry in the log.
class LogEntry {
  /// The message text to log.
  final String message;

  /// The time this entry was logged.
  final DateTime date;

  /// The type of the log.
  final LogTypes type;

  /// The group this entry belongs to e.g. "API" or "UI".
  final String group;

  /// Creates a new log entry with the given [message] and [type].
  LogEntry({required this.message, required this.date, required this.type, this.group = ''});

  /// Creates a new empty log entry.
  LogEntry.empty() : this(message: '', date: DateTime.now(), type: LogTypes.info, group: '');

  @override
  String toString() => "${date.logFormat}: ${type.emoji} ${EnumToString.convertToString(type).toUpperCase()}:    ${group.isNotEmpty ? " [$group]" : ""} $message\n";
}
