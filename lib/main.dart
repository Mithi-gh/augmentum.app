import 'package:flutter/material.dart';
import 'haptic_engine.dart';
import 'scenario_manager.dart';
import 'research_logger.dart';

void main() {
  runApp(const AugmentumHapticsApp());
}

class AugmentumHapticsApp extends StatelessWidget {
  const AugmentumHapticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Augmentum Haptics Research',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      home: const HapticTestScreen(),
    );
  }
}

class HapticTestScreen extends StatefulWidget {
  const HapticTestScreen({super.key});

  @override
  State<HapticTestScreen> createState() => _HapticTestScreenState();
}

class _HapticTestScreenState extends State<HapticTestScreen> {
  final HapticEngine _engine = HapticEngine();
  bool _isPlaying = false;

  @override
  void dispose() {
    _engine.cancel();
    super.dispose();
  }

  /// Handle scenario button press
  Future<void> _onScenarioPressed(HapticScenario scenario) async {
    if (_isPlaying) return; // Ignore taps during playback

    setState(() {
      _isPlaying = true;
    });

    // Log the test
    ResearchLogger.logScenarioPressed(
      scenarioId: scenario.id,
      scenarioName: scenario.name,
      cuesTriggered: scenario.cues.isEmpty 
          ? [HapticCueType.leftTurn] // Placeholder for randomized scenario
          : scenario.cues,
    );

    try {
      // Execute haptic sequence (no visual feedback during playback)
      await ScenarioManager.executeScenario(scenario, _engine);
    } catch (e) {
      ResearchLogger.logError(
        scenarioId: scenario.id,
        error: e.toString(),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Augmentum Haptics Research',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // iOS PWA Instructions
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                border: Border.all(color: Colors.blue[200]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone_iphone, color: Colors.blue[700], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'iOS Testing Instructions',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1. Open this page in Safari on iOS\n'
                    '2. Tap Share → Add to Home Screen\n'
                    '3. Open the installed app (PWA)\n'
                    '4. Haptics should work in the PWA',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue[800],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            // Instructions Panel (Clinical, minimal)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Press a button to trigger a haptic sequence.\n'
                    'No visual feedback will be shown during playback.\n'
                    'Focus on the vibration patterns.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Test Scenarios List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: ScenarioManager.allScenarios.length,
                itemBuilder: (context, index) {
                  final scenario = ScenarioManager.allScenarios[index];
                  return _buildScenarioButton(scenario);
                },
              ),
            ),

            // Status Bar (shows only when playing)
            if (_isPlaying)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: Colors.amber[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber[900]!),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Haptic playback in progress...',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.amber[900],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Build scenario button (clinical styling)
  Widget _buildScenarioButton(HapticScenario scenario) {
    final isDisabled = _isPlaying;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: isDisabled ? null : () => _onScenarioPressed(scenario),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[800],
          disabledBackgroundColor: Colors.grey[200],
          disabledForegroundColor: Colors.grey[400],
          elevation: 0,
          side: BorderSide(
            color: isDisabled ? Colors.grey[300]! : Colors.grey[400]!,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            // Scenario number badge
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isDisabled ? Colors.grey[300] : Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  '${scenario.id}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDisabled ? Colors.grey[500] : Colors.blueGrey[800],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            // Scenario details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scenario.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    scenario.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
