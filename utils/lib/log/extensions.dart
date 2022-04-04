part of log;

/// Stack trace extension for logging.
extension LoggerExtensions on StackTrace {
  /// Returns the method that called the stack trace.
  /// Format: "$method:$lineNumber:$charNumber"
  String get method {
    var line = StackTrace.current.toString().toString().split("\n")[3];
    line = line.replaceAll("#2      ", "replace");

    var file = line.split(" ").last;
    var method = line.split(" (").first;

    var temp = file.split(":");

    var lineNumber = temp[temp.length - 2];
    var charNumber = temp.last.replaceAll(")", "");

    return "$method:$lineNumber:$charNumber";
  }
}
