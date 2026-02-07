import 'dart:math';
import 'package:flutter/foundation.dart';
import 'haptic_engine.dart';

/// Test Scenario - Maps to specific haptic sequence(s)
class HapticScenario {
  final int id;
  final String name;
  final String description;
  final List<HapticCueType> cues;
  final int? delayBetweenCues; // For complex scenarios with multiple cues

  const HapticScenario({
    required this.id,
    required this.name,
    required this.description,
    required this.cues,
    this.delayBetweenCues,
  });
}

/// Scenario Manager - Handles all 12 test scenarios
class ScenarioManager {
  static final Random _random = Random();

  /// All 12 test scenarios (exact mapping from document)
  static final List<HapticScenario> allScenarios = [
    // 1 - Standard Left Turn
    const HapticScenario(
      id: 1,
      name: 'Standard Left Turn',
      description: 'Basic left turn navigation cue',
      cues: [HapticCueType.leftTurn],
    ),

    // 2 - Standard Right Turn
    const HapticScenario(
      id: 2,
      name: 'Standard Right Turn',
      description: 'Basic right turn navigation cue',
      cues: [HapticCueType.rightTurn],
    ),

    // 3 - Continue Straight
    const HapticScenario(
      id: 3,
      name: 'Continue Straight',
      description: 'Reassurance to keep going',
      cues: [HapticCueType.continueStrait],
    ),

    // 4 - Late Notice Turn (randomized left/right)
    const HapticScenario(
      id: 4,
      name: 'Late Notice Turn',
      description: 'Random turn with short notice',
      cues: [], // Will be determined at runtime
    ),

    // 5 - Hazard
    const HapticScenario(
      id: 5,
      name: 'Hazard',
      description: 'Attention required for hazard',
      cues: [HapticCueType.attention],
    ),

    // 6 - Arrival
    const HapticScenario(
      id: 6,
      name: 'Arrival',
      description: 'Journey finished',
      cues: [HapticCueType.arrival],
    ),

    // 7 - Right Turn with Traffic
    const HapticScenario(
      id: 7,
      name: 'Right Turn w/ Traffic',
      description: 'Right turn in traffic conditions',
      cues: [HapticCueType.rightTurn],
    ),

    // 8 - Complex Junction (Continue → wait 2s → Left)
    const HapticScenario(
      id: 8,
      name: 'Complex Junction',
      description: 'Multi-step maneuver: Continue then Left',
      cues: [HapticCueType.continueStrait, HapticCueType.leftTurn],
      delayBetweenCues: 2000, // 2 seconds gap
    ),

    // 9 - Missed Turn (Attention for reroute)
    const HapticScenario(
      id: 9,
      name: 'Missed Turn',
      description: 'Attention signal for rerouting',
      cues: [HapticCueType.attention],
    ),

    // 10 - False Friend (Continue)
    const HapticScenario(
      id: 10,
      name: 'False Friend',
      description: 'Continue reassurance at confusing junction',
      cues: [HapticCueType.continueStrait],
    ),

    // 11 - Late Alert (Attention)
    const HapticScenario(
      id: 11,
      name: 'Late Alert',
      description: 'Urgent attention signal',
      cues: [HapticCueType.attention],
    ),

    // 12 - Final Arrival
    const HapticScenario(
      id: 12,
      name: 'Final Arrival',
      description: 'Journey complete',
      cues: [HapticCueType.arrival],
    ),
  ];

  /// Execute a scenario's haptic sequence
  static Future<void> executeScenario(
    HapticScenario scenario,
    HapticEngine engine,
  ) async {
    // Special handling for Scenario 4 (Late Notice Turn - randomized)
    if (scenario.id == 4) {
      final randomTurn = _random.nextBool() 
          ? HapticCueType.leftTurn 
          : HapticCueType.rightTurn;
      
      if (kDebugMode) {
        debugPrint('🎲 Scenario 4: Randomized to ${randomTurn == HapticCueType.leftTurn ? "LEFT" : "RIGHT"}');
      }
      
      await engine.playCue(randomTurn);
      return;
    }

    // Execute all cues in sequence
    for (int i = 0; i < scenario.cues.length; i++) {
      await engine.playCue(scenario.cues[i]);
      
      // Add delay between cues if specified (e.g., Complex Junction)
      if (i < scenario.cues.length - 1 && scenario.delayBetweenCues != null) {
        await Future.delayed(Duration(milliseconds: scenario.delayBetweenCues!));
      }
    }
  }
}
