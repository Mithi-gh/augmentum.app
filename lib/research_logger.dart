import 'dart:io';
import 'package:flutter/foundation.dart';
import 'haptic_engine.dart';

/// Research Logger - Silent logging for data analysis
/// Logs to console (debug) or file (release) without UI feedback
class ResearchLogger {
  static final List<LogEntry> _entries = [];

  /// Log a scenario button press
  static void logScenarioPressed({
    required int scenarioId,
    required String scenarioName,
    required List<HapticCueType> cuesTriggered,
  }) {
    final entry = LogEntry(
      timestamp: DateTime.now(),
      scenarioId: scenarioId,
      scenarioName: scenarioName,
      cuesTriggered: cuesTriggered,
      platform: _getPlatform(),
      completed: true,
    );

    _entries.add(entry);

    // Silent console logging (debug mode only)
    if (kDebugMode) {
      debugPrint('📊 LOG: [${entry.timestamp}] Scenario #${entry.scenarioId} - ${entry.scenarioName}');
      debugPrint('    Platform: ${entry.platform}');
      debugPrint('    Cues: ${entry.cuesTriggered.map((c) => c.name).join(", ")}');
      debugPrint('    Completed: ${entry.completed}');
    }
  }

  /// Log interruption or error
  static void logError({
    required int scenarioId,
    required String error,
  }) {
    if (kDebugMode) {
      debugPrint('❌ ERROR LOG: Scenario #$scenarioId - $error');
    }
  }

  /// Get all logged entries
  static List<LogEntry> getEntries() => List.unmodifiable(_entries);

  /// Export log data as CSV format
  static String exportAsCSV() {
    final buffer = StringBuffer();
    buffer.writeln('Timestamp,Scenario_ID,Scenario_Name,Cues_Triggered,Platform,Completed');

    for (final entry in _entries) {
      buffer.writeln(
        '${entry.timestamp.toIso8601String()},'
        '${entry.scenarioId},'
        '"${entry.scenarioName}",'
        '"${entry.cuesTriggered.map((c) => c.name).join(";")}",'
        '${entry.platform},'
        '${entry.completed}',
      );
    }

    return buffer.toString();
  }

  /// Clear all log entries
  static void clear() {
    _entries.clear();
    if (kDebugMode) {
      debugPrint('🗑️ Research logs cleared');
    }
  }

  /// Detect platform
  static String _getPlatform() {
    if (kIsWeb) return 'Web';
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    return 'Unknown';
  }

  /// Get summary statistics
  static Map<String, dynamic> getSummary() {
    final scenarioCounts = <int, int>{};
    for (final entry in _entries) {
      scenarioCounts[entry.scenarioId] = (scenarioCounts[entry.scenarioId] ?? 0) + 1;
    }

    return {
      'total_tests': _entries.length,
      'scenarios_tested': scenarioCounts.length,
      'scenario_counts': scenarioCounts,
      'platform': _getPlatform(),
      'first_test': _entries.isNotEmpty ? _entries.first.timestamp : null,
      'last_test': _entries.isNotEmpty ? _entries.last.timestamp : null,
    };
  }
}

/// Log Entry - Single test record
class LogEntry {
  final DateTime timestamp;
  final int scenarioId;
  final String scenarioName;
  final List<HapticCueType> cuesTriggered;
  final String platform;
  final bool completed;

  LogEntry({
    required this.timestamp,
    required this.scenarioId,
    required this.scenarioName,
    required this.cuesTriggered,
    required this.platform,
    required this.completed,
  });
}
