// Basic widget test for Augmentum Haptics Research Prototype

import 'package:flutter_test/flutter_test.dart';

import 'package:augmentum_haptics/main.dart';

void main() {
  testWidgets('Haptic test screen loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const AugmentumHapticsApp());

    // Verify app title is displayed
    expect(find.text('Augmentum Haptics Research'), findsOneWidget);
    
    // Verify instructions are displayed
    expect(find.text('Instructions'), findsOneWidget);
    
    // Verify at least one scenario button exists
    expect(find.text('Standard Left Turn'), findsOneWidget);
  });
}
