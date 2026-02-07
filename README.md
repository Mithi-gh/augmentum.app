# Augmentum Haptics Research App

A web-based haptic feedback testing application for research purposes.

## 🎯 Purpose

This application is designed to test haptic perception and differentiation across 12 standardized scenarios. It implements precise haptic patterns based on research specifications for navigation, attention, and arrival cues.

## 🌐 Live Demo

**Test the app:** [https://mithi-gh.github.io/augmentum.app](https://mithi-gh.github.io/augmentum.app)

⚠️ **Note:** Haptic feedback requires an Android device with Chrome browser. iOS Safari does not support the Web Vibration API.

## 📱 How to Use

1. Open the URL on an **Android device** (Chrome browser recommended)
2. Tap **"Yes"** to start testing
3. Test all **12 scenarios** across two pages
4. Try to identify differences between haptic patterns

## 🎮 Scenarios

The app includes 12 haptic scenarios:
- **Scenarios 1-6**: Page 1 (Navigation patterns)
- **Scenarios 7-12**: Page 2 (Attention and arrival patterns)

Each scenario triggers a unique haptic pattern with:
- Alert Primer (120ms)
- Processing Gap (700-900ms)
- Main Cue (looped pattern)

## 🔬 Research Focus

This tool is designed to test:
- Perceptual differentiation of haptic categories
- Attention priming effectiveness
- Non-visual guidance confidence
- Pattern distinctiveness across scenarios

## 🛠️ Technology

- **Platform:** Flutter Web
- **Haptic Engine:** Web Vibration API
- **Deployment:** GitHub Pages
- **Target Devices:** Android smartphones

## 📊 Pattern Categories

1. **Navigation Cues**: Left turn, Right turn, Continue
2. **Attention Cues**: Hazard, Missed turn, Late alert
3. **State Cues**: Arrival, Final arrival

## ⚠️ Platform Support

| Platform | Support | Notes |
|----------|---------|-------|
| Android | ✅ Full | Chrome, Firefox, Edge |
| iOS | ❌ Limited | Safari does not support Web Vibration API |
| Desktop | ❌ None | Most desktop browsers lack haptic hardware |

## 📝 For Participants

**Testing Instructions:**
1. Use an Android phone
2. Open in Chrome browser
3. Tap each scenario button
4. Note the differences you feel
5. Try to categorize patterns

## 🔒 Privacy

- No data collection
- No user tracking
- No external analytics
- Local logging only (not transmitted)

## 📄 License

Research prototype - Augmentum Haptics

---

**Built with Flutter** | **Deployed on GitHub Pages**
