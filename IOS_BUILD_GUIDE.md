# Complete iOS Build Guide - Augmentum Haptics

## 📱 Building Native iOS App with Full Core Haptics Support

This guide will walk you through building the Augmentum Haptics research app for iOS with full Core Haptics API support.

---

## 🎯 What You'll Get

**Native iOS App with:**
- ✅ **Core Haptics API** - Rich, expressive haptic feedback (iPhone 8+)
- ✅ **Custom Intensity** - Soft (Arrival), Firm (Navigation), Strong (Attention)
- ✅ **Precise Timing** - Exact pattern durations as specified
- ✅ **Professional Quality** - Production-ready for research distribution
- ✅ **TestFlight Ready** - Easy participant distribution

---

## 📋 Prerequisites

### Required:
1. **Mac Computer** (MacBook, iMac, Mac Mini, or Mac Studio)
   - macOS 12.0 (Monterey) or newer recommended
   - At least 20GB free disk space

2. **Xcode** (FREE from Mac App Store)
   - Download: Open App Store → Search "Xcode" → Install
   - Size: ~15GB
   - Latest version (Xcode 14+) recommended

3. **Flutter SDK** (FREE)
   - Download: https://docs.flutter.dev/get-started/install/macos
   - Or use your existing Flutter installation

4. **Apple ID** (FREE for testing on your own device)
   - Or Apple Developer Account ($99/year) for TestFlight distribution

5. **iPhone Device** (for testing)
   - iPhone 8 or newer (for Core Haptics)
   - iOS 13.0 or newer
   - USB cable to connect to Mac

### Optional:
- **CocoaPods** (usually auto-installed with Xcode)
- **Git** (for project transfer)

---

## 📦 Part 1: Transfer Project to Mac

### Option A: Download Project Archive

**Step 1: Create Project Archive** (I'll do this for you)
```bash
# This creates a transferable archive
cd /home/user
tar -czf augmentum_haptics_ios.tar.gz flutter_app/
```

**Step 2: Transfer to Mac**
- Download the archive file
- Copy to your Mac via:
  - Email (if < 25MB)
  - Cloud storage (Google Drive, Dropbox, iCloud)
  - USB drive
  - AirDrop

**Step 3: Extract on Mac**
```bash
# On your Mac Terminal
cd ~/Desktop
tar -xzf augmentum_haptics_ios.tar.gz
cd flutter_app
```

### Option B: GitHub Repository

**If you prefer Git:**
1. Push project to GitHub (I can help with this)
2. Clone on your Mac:
   ```bash
   git clone https://github.com/your-username/augmentum-haptics.git
   cd augmentum-haptics
   ```

---

## 🚀 Part 2: Setup on Mac

### Step 1: Verify Flutter Installation

**Open Terminal on Mac and run:**
```bash
flutter doctor -v
```

**Expected Output:**
```
[✓] Flutter (Channel stable, 3.x.x)
[✓] Xcode - develop for iOS and macOS
[✓] iOS tools
```

**If Flutter not installed:**
```bash
# Install Flutter on Mac
cd ~/
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"
flutter doctor
```

### Step 2: Install Dependencies

**In your project directory:**
```bash
cd ~/Desktop/flutter_app
flutter pub get
flutter precache --ios
```

### Step 3: Install CocoaPods (if needed)

**Check if CocoaPods is installed:**
```bash
pod --version
```

**If not installed:**
```bash
sudo gem install cocoapods
pod setup
```

---

## 🔨 Part 3: Configure Xcode Project

### Step 1: Open Project in Xcode

**Option A: Via Terminal (Recommended)**
```bash
cd ~/Desktop/flutter_app
open ios/Runner.xcworkspace
```

**Option B: Via Xcode**
1. Open Xcode
2. File → Open
3. Navigate to `flutter_app/ios/`
4. Select `Runner.xcworkspace` (NOT Runner.xcodeproj!)

### Step 2: Configure Signing

**In Xcode:**

1. **Select Runner** in the left sidebar (project navigator)
2. **Select Runner target** (under TARGETS)
3. **Go to "Signing & Capabilities" tab**
4. **Configure Team:**
   - If you have Apple Developer Account:
     - Team: Select your team
   - If personal testing only:
     - Team: Select your personal Apple ID
     - Bundle Identifier: Change to unique ID (e.g., `com.yourname.augmentumhaptics`)

**Bundle Identifier Setup:**
```
Original: com.augmentumhaptics.research
Personal: com.[your-name].augmentumhaptics
Example: com.johndoe.augmentumhaptics
```

### Step 3: Update Display Name (Optional)

**In Runner → Info.plist:**
- Find `CFBundleDisplayName`
- Set to: `Augmentum Haptics`

---

## 📱 Part 4: Build and Run on iPhone

### Step 1: Connect iPhone to Mac

1. **Connect via USB cable**
2. **Unlock your iPhone**
3. **Trust this computer** (prompt on iPhone)
   - Tap "Trust"
   - Enter iPhone passcode

### Step 2: Select Target Device

**In Xcode:**
1. Top bar: Click device dropdown (next to Run button)
2. Select your connected iPhone from list
3. Should show: "Your iPhone Name"

### Step 3: Build and Install

**Method A: Using Xcode (Recommended)**
```
1. Press the "Play" button (▶) in top-left
   OR
2. Press ⌘R (Command + R)
```

**Build Process:**
- Installing dependencies (CocoaPods)... ~2 minutes
- Compiling Flutter code... ~1 minute
- Building iOS app... ~3 minutes
- Installing on device... ~30 seconds

**Total time: ~5-7 minutes (first build)**

### Step 4: Trust Developer Certificate

**On your iPhone:**
1. Settings → General → VPN & Device Management
2. Find your Apple ID under "Developer App"
3. Tap your Apple ID
4. Tap "Trust [Your Apple ID]"
5. Tap "Trust" in popup

### Step 5: Launch App

- Return to home screen
- Find "Augmentum Haptics" app icon
- Tap to open
- **Test haptics!** 🎉

---

## 🧪 Part 5: Test Core Haptics

### Testing Checklist:

**1. Launch Verification**
- [ ] App opens without crashes
- [ ] UI displays correctly
- [ ] All 12 scenario buttons visible

**2. Basic Haptic Test**
- [ ] Press Scenario 1 (Left Turn)
- [ ] Feel the **Alert Primer** (120ms initial tap)
- [ ] Wait for **Processing Gap** (700ms silence)
- [ ] Feel **Main Pattern** (double-tap, repeated 3×)

**3. Intensity Differentiation** (Core Haptics Feature!)
- [ ] **Scenario 3 (Continue)**: Feel FIRM intensity
- [ ] **Scenario 5 (Hazard)**: Feel STRONG intensity
- [ ] **Scenario 6 (Arrival)**: Feel SOFT intensity
- [ ] Can you distinguish the three intensity levels?

**4. Pattern Complexity**
- [ ] **Left Turn**: Double-tap (short-short)
- [ ] **Right Turn**: Single long
- [ ] **Hazard**: Triple complex pattern
- [ ] Are patterns clearly distinct?

**5. Research Validation**
- [ ] Can you differentiate Navigation vs Attention vs Arrival?
- [ ] Is Alert Primer noticeable and helpful?
- [ ] Are processing gaps useful for attention shifting?

---

## 🐛 Troubleshooting

### "Build Failed" Errors

**Error: "CocoaPods not installed"**
```bash
sudo gem install cocoapods
cd ios
pod install
```

**Error: "Command PhaseScriptExecution failed"**
```bash
cd ios
rm -rf Pods
rm Podfile.lock
pod install
cd ..
flutter clean
flutter pub get
```

**Error: "Signing for Runner requires a development team"**
- Go to Signing & Capabilities in Xcode
- Add your Apple ID as Team
- Change Bundle Identifier to unique value

### "Could not launch app" Errors

**Error: "Failed to verify code signature"**
- On iPhone: Settings → General → VPN & Device Management
- Trust your developer certificate

**Error: "This device is not registered"**
- You need paid Apple Developer account ($99/year)
- Or test on personal device only (free)

### Runtime Issues

**"No haptic feedback"**
- iPhone 8 or newer required for Core Haptics
- Check device supports haptics: iPhone 7 and older have limited support
- Ensure Silent mode is OFF
- Settings → Sounds & Haptics → System Haptics ON

**"App crashes on launch"**
- Check Xcode console for errors
- Verify iOS version is 13.0+
- Clean build: Product → Clean Build Folder (⇧⌘K)

---

## 📤 Part 6: TestFlight Distribution (Optional)

### For Research Participants

**Requirements:**
- Apple Developer Account ($99/year)
- App Store Connect access

**Steps:**

1. **Archive App**
   ```
   Xcode → Product → Archive
   Wait for archive to complete
   ```

2. **Upload to App Store Connect**
   ```
   Archives window opens
   Click "Distribute App"
   Choose "App Store Connect"
   Click "Upload"
   ```

3. **Configure TestFlight**
   ```
   Go to App Store Connect (appstoreconnect.apple.com)
   Select your app
   Go to TestFlight tab
   Add external testers
   Send invitations
   ```

4. **Participants Install**
   ```
   Install TestFlight app from App Store
   Tap invitation link
   Install Augmentum Haptics
   Test and provide feedback
   ```

---

## 📊 Part 7: Development Tips

### Rapid Testing

**Hot Reload** (while app is running):
```
Make code changes in lib/*.dart
Press 'r' in terminal OR ⌘\ in Xcode
Changes apply instantly (no rebuild!)
```

**Hot Restart** (reset app state):
```
Press 'R' in terminal OR ⇧⌘\ in Xcode
```

### Debugging

**View Console Logs:**
```
Xcode → View → Debug Area → Show Debug Area
All debugPrint() statements appear here
```

**View Haptic Engine Logs:**
```dart
// In haptic_engine.dart
if (kDebugMode) {
  debugPrint('🎯 Starting haptic playback: ${cueType.name}');
}
```

### Performance Testing

**Profile Mode:**
```bash
flutter run --profile
# Better performance than debug
# Still allows some debugging
```

---

## 🎯 Expected Results

### What Should Work:

**Core Haptics Features:**
- ✅ Three distinct intensity levels (Soft/Firm/Strong)
- ✅ Precise timing patterns (exact millisecond durations)
- ✅ Complex pattern sequences
- ✅ Alert Primer clearly distinguishable
- ✅ Processing gaps noticeable
- ✅ All 12 scenarios functional

**Better than Android:**
- ✅ Richer haptic vocabulary (Core Haptics vs basic vibration)
- ✅ More expressive feedback
- ✅ Better intensity control
- ✅ Smoother pattern transitions

---

## 📝 Quick Command Reference

### Essential Commands:

```bash
# Navigate to project
cd ~/Desktop/flutter_app

# Open in Xcode
open ios/Runner.xcworkspace

# Install dependencies
flutter pub get

# Clean build
flutter clean

# Build iOS (terminal)
flutter build ios --release

# Run on connected device
flutter run

# Install pods
cd ios && pod install && cd ..

# View devices
flutter devices
```

---

## 🆘 Getting Help

### If You Get Stuck:

**1. Check Xcode Build Errors**
- Look at error messages in Xcode console
- Common issues: signing, pod installation, SDK versions

**2. Flutter Doctor**
```bash
flutter doctor -v
```
Shows all issues with your Flutter/iOS setup

**3. Clean and Rebuild**
```bash
flutter clean
cd ios
rm -rf Pods
pod install
cd ..
flutter pub get
```

**4. Check Device Compatibility**
- iPhone 8+ for Core Haptics
- iOS 13.0+ required
- Physical device needed (simulator has no haptics)

---

## 🎊 Success Criteria

**You'll know it's working when:**

1. ✅ App installs on your iPhone without errors
2. ✅ All 12 scenario buttons are visible and functional
3. ✅ You can feel the Alert Primer (120ms tap) before each pattern
4. ✅ You can distinguish between patterns (Left vs Right vs Continue)
5. ✅ You can feel intensity differences (Soft vs Firm vs Strong)
6. ✅ Complex patterns play smoothly (Hazard triple-tap)
7. ✅ No crashes or freezes during testing

---

## 📅 Timeline Estimate

**First-Time Setup:**
- Install Xcode: 30-60 minutes (one-time)
- Install Flutter: 15-30 minutes (if not installed)
- Transfer project: 5-10 minutes
- Configure signing: 5-10 minutes
- First build: 5-10 minutes
- **Total: ~2 hours** (mostly waiting for downloads)

**Subsequent Builds:**
- Incremental builds: 1-2 minutes
- Full clean builds: 3-5 minutes

---

## 🎓 Learning Resources

**Apple Core Haptics:**
- https://developer.apple.com/documentation/corehaptics
- https://developer.apple.com/videos/play/wwdc2019/520/

**Flutter iOS Development:**
- https://docs.flutter.dev/deployment/ios
- https://flutter.dev/docs/get-started/install/macos

**Xcode Basics:**
- https://developer.apple.com/xcode/

---

## ✅ Ready to Build!

**Project is prepared and ready for iOS build.**

**Next Steps:**
1. Transfer project to your Mac
2. Follow this guide step-by-step
3. Build and test on your iPhone
4. Share feedback on haptic quality

**Questions? Let me know at any step!** 🚀
