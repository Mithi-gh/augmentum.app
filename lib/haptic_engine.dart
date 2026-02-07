import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:vibration/vibration.dart';

/// Haptic Engine - Implements structured haptic language exactly as specified
/// Structure: [Alert Primer] → [Processing Gap] → [Main Cue (looped)]
/// 
/// Enhanced for web/iOS compatibility
class HapticEngine {
  bool _isPlaying = false;
  
  /// Check if haptic playback is currently active
  bool get isPlaying => _isPlaying;

  /// Global Alert Primer (identical for all scenarios)
  /// Duration: 120ms, Intensity: Firm
  static const int _alertPrimerDuration = 120;

  /// Processing Gaps (silence after alert)
  static const int _processingGapStandard = 700; // All except Arrival
  static const int _processingGapArrival = 900; // Arrival only

  /// Play the complete haptic sequence for a given cue type
  Future<void> playCue(HapticCueType cueType) async {
    if (_isPlaying) {
      if (kDebugMode) {
        debugPrint('⏸️ Haptic playback already in progress. Ignoring.');
      }
      return;
    }

    _isPlaying = true;
    
    try {
      if (kDebugMode) {
        debugPrint('🎯 Starting haptic playback: ${cueType.name}');
      }

      // Step 1: Alert Primer (identical for all)
      await _playAlertPrimer();

      // Step 2: Processing Gap
      final gap = cueType == HapticCueType.arrival 
          ? _processingGapArrival 
          : _processingGapStandard;
      await Future.delayed(Duration(milliseconds: gap));

      // Step 3: Main Cue (looped)
      await _playMainCue(cueType);
      
      if (kDebugMode) {
        debugPrint('✅ Haptic playback complete: ${cueType.name}');
      }
      
    } catch (e) {
      if (kDebugMode) {
        debugPrint('❌ Haptic playback error: $e');
      }
    } finally {
      _isPlaying = false;
    }
  }

  /// Play the alert primer (semantic-empty attention signal)
  Future<void> _playAlertPrimer() async {
    try {
      await Vibration.vibrate(duration: _alertPrimerDuration);
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Alert primer error: $e');
      }
    }
  }

  /// Play the main haptic cue (with looping)
  Future<void> _playMainCue(HapticCueType cueType) async {
    switch (cueType) {
      case HapticCueType.leftTurn:
        await _playLeftTurn();
        break;
      case HapticCueType.rightTurn:
        await _playRightTurn();
        break;
      case HapticCueType.continueStrait:
        await _playContinue();
        break;
      case HapticCueType.attention:
        await _playAttention();
        break;
      case HapticCueType.arrival:
        await _playArrival();
        break;
    }
  }

  /// Navigation - Left Turn
  /// Pattern: ON 220ms → OFF 280ms → ON 220ms → OFF 580ms
  /// Loop: 3x, Intensity: Firm
  Future<void> _playLeftTurn() async {
    const loopCount = 3;
    
    for (int i = 0; i < loopCount; i++) {
      // Use pattern for double-tap
      await Vibration.vibrate(pattern: [0, 220, 280, 220, 580]);
    }
  }

  /// Navigation - Right Turn
  /// Pattern: ON 500ms → OFF 580ms
  /// Loop: 3x, Intensity: Firm
  Future<void> _playRightTurn() async {
    const loopCount = 3;
    
    for (int i = 0; i < loopCount; i++) {
      await Vibration.vibrate(duration: 500);
      await Future.delayed(const Duration(milliseconds: 580));
    }
  }

  /// Navigation - Continue/Reassurance
  /// Pattern: ON 180ms → OFF 850ms
  /// Loop: 3x, Intensity: Firm
  Future<void> _playContinue() async {
    const loopCount = 3;
    
    for (int i = 0; i < loopCount; i++) {
      await Vibration.vibrate(duration: 180);
      await Future.delayed(const Duration(milliseconds: 850));
    }
  }

  /// Attention/Hazard
  /// Pattern: ON 120ms → OFF 120ms → ON 300ms → OFF 450ms → ON 120ms
  /// Loop: 3x, Intensity: Strong
  Future<void> _playAttention() async {
    const loopCount = 3;
    
    for (int i = 0; i < loopCount; i++) {
      // Use pattern for complex sequence
      await Vibration.vibrate(pattern: [0, 120, 120, 300, 450, 120, 200]);
    }
  }

  /// Arrival/State End
  /// Pattern: ON 1100ms → OFF 1000ms
  /// Loop: 2x, Intensity: Soft
  Future<void> _playArrival() async {
    const loopCount = 2;
    
    for (int i = 0; i < loopCount; i++) {
      await Vibration.vibrate(duration: 1100);
      if (i < loopCount - 1) {
        await Future.delayed(const Duration(milliseconds: 1000));
      }
    }
  }

  /// Cancel any ongoing haptic playback
  void cancel() {
    _isPlaying = false;
    Vibration.cancel();
  }
}

/// Haptic Cue Types (Main Categories)
enum HapticCueType {
  leftTurn,        // Navigation - Left variant
  rightTurn,       // Navigation - Right variant
  continueStrait,  // Navigation - Continue/Reassurance
  attention,       // Attention/Hazard
  arrival,         // Arrival/State End
}
