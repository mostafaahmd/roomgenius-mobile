// lib/core/utils/logger.dart
// ✅ Logger that respects Environment.enableLogging

import 'package:logger/logger.dart';
import '../../app/config/environment.dart';

// ✅ Global logger instance
final logger = Logger(
  printer: PrettyPrinter(),
  // ✅ Logging level based on environment
  level: Environment.current.enableLogging ? Level.debug : Level.warning,
);

// ===========================
// 🎯 HOW IT WORKS
// ===========================

/*
1. In DEVELOPMENT (Environment.development):
   - enableLogging = true
   - Logger level = Level.debug
   - Result: ALL logs appear (debug, info, warning, error, fatal)

2. In PRODUCTION (Environment.production):
   - enableLogging = false
   - Logger level = Level.warning
   - Result: ONLY warnings, errors, and fatal logs appear (no debug/info)

3. Usage is the same everywhere:
   logger.d('Debug message');    // Only in dev
   logger.i('Info message');     // Only in dev
   logger.w('Warning message');  // In both dev and prod
   logger.e('Error message');    // In both dev and prod
   logger.f('Fatal message');    // In both dev and prod
*/

// ===========================
// 📝 OPTIONAL: Wrapper class for consistent logging
// ===========================

class AppLogger {
  // Debug (only in development)
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    if (Environment.current.enableLogging) {
      logger.d(message, error: error, stackTrace: stackTrace);
    }
  }

  // Info (only in development)
  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    if (Environment.current.enableLogging) {
      logger.i(message, error: error, stackTrace: stackTrace);
    }
  }

  // Warning (in both dev and prod)
  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  // Error (in both dev and prod)
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  // Fatal (in both dev and prod)
  static void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    logger.f(message, error: error, stackTrace: stackTrace);
  }
}

// ===========================
// 🎬 USAGE EXAMPLES
// ===========================

/*
// Option 1: Direct logger usage (simple)
logger.d('User logged in');  // Only in dev
logger.e('Login failed');    // In both dev and prod

// Option 2: Using AppLogger wrapper (explicit)
AppLogger.debug('User logged in');  // Only in dev
AppLogger.error('Login failed');    // In both dev and prod
*/
