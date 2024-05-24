import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart' show DateFormat;

abstract class BaseLogger {
  static DebugLogger? _instance;
  late Logger? _logger;
  DateFormat _dateFormatter = DateFormat('H:m:s:S');
  static const appName = 'my_app';

  void log(message, [Object? error, StackTrace? stackTrace]) =>
      _logger?.info(message, error, stackTrace);
}

class DebugLogger extends BaseLogger {
  static DebugLogger? _instance;

  DebugLogger._internal() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(_recordHandler);

    _logger = Logger(BaseLogger.appName);
    debugPrint('<debuglogger> creation');
    _instance = this;
  }

  factory DebugLogger() => _instance ??= DebugLogger._internal();

  void _recordHandler(LogRecord rec) {
    print('${_dateFormatter.format(rec.time)}: ${rec.message}');
  }
}
