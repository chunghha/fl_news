import 'package:logger/logger.dart';

class Log {
  // Disable colors for now till the issue resolved.
  static final logger = Logger(printer: PrettyPrinter(colors: false));

  static void d(message) {
    return logger.d(message);
  }

  static void e(message) {
    return logger.e(message);
  }

  static void i(message) {
    return logger.i(message);
  }

  static void w(message) {
    return logger.w(message);
  }
}
