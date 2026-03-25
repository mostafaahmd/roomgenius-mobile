// lib/core/config/environment.dart
// ✅ Environment configuration (like Angular environment files)
enum EnvironmentType { development, production }

class Environment {
  const Environment({
    required this.type,
    required this.appName,
    required this.enableLogging,
    required this.enableErrorTracking,
  });

  final EnvironmentType type;
  final String appName;
  final bool enableLogging;
  final bool enableErrorTracking;

  static const development = Environment(
    type: EnvironmentType.development,
    appName: 'RoomGenius Dev',
    enableLogging: true,
    enableErrorTracking: false,
  );

  static const production = Environment(
    type: EnvironmentType.production,
    appName: 'RoomGenius',
    enableLogging: false,
    enableErrorTracking: true,
  );

  static late Environment current;
}
