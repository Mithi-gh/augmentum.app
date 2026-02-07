# iOS Build Quick Start Checklist

## 📦 Project Package Ready!

**Archive**: `augmentum_haptics_ios_build.tar.gz`  
**Size**: 337 KB  
**Location**: `/home/user/augmentum_haptics_ios_build.tar.gz`

---

## ✅ Pre-Flight Checklist

### Before Starting (verify you have):

- [ ] **Mac Computer** (MacBook, iMac, Mac Mini, etc.)
- [ ] **macOS 12+** (Monterey or newer)
- [ ] **20GB+ free disk space**
- [ ] **Xcode installed** (from Mac App Store - 15GB download)
- [ ] **iPhone 8 or newer** (for Core Haptics testing)
- [ ] **USB cable** (to connect iPhone to Mac)
- [ ] **Apple ID** (free - for signing the app)

---

## 🚀 5-Step Quick Start

### Step 1: Transfer Project to Mac (5 minutes)

```bash
# Download the archive file:
augmentum_haptics_ios_build.tar.gz

# Transfer to Mac via:
- Email (file is only 337KB!)
- AirDrop
- Cloud storage (Google Drive, Dropbox)
- USB drive
```

### Step 2: Extract on Mac (1 minute)

```bash
# Open Terminal on Mac (⌘ + Space, type "Terminal")
cd ~/Desktop
# Drag the .tar.gz file here, or upload it
tar -xzf augmentum_haptics_ios_build.tar.gz
cd flutter_app
```

### Step 3: Install Dependencies (3 minutes)

```bash
# In Terminal, from flutter_app directory:
flutter pub get
flutter precache --ios
```

**If Flutter not installed on Mac:**
```bash
# Quick Flutter install:
cd ~/
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"
flutter doctor
```

### Step 4: Open in Xcode (1 minute)

```bash
# From flutter_app directory:
open ios/Runner.xcworkspace
```

**IMPORTANT**: Open `Runner.xcworkspace` NOT `Runner.xcodeproj`!

### Step 5: Build and Run (5-10 minutes first time)

**In Xcode:**

1. **Configure Signing** (top bar):
   - Click "Runner" in left sidebar
   - Select "Runner" under TARGETS
   - Go to "Signing & Capabilities" tab
   - Set Team: Your Apple ID
   - Bundle Identifier: `com.[yourname].augmentumhaptics`

2. **Connect iPhone** via USB:
   - Unlock iPhone
   - Tap "Trust" when prompted

3. **Select Device**:
   - Top bar dropdown: Select your iPhone

4. **Build & Run**:
   - Press ▶ (Play button) OR press ⌘R
   - Wait 5-10 minutes (first build)

5. **Trust on iPhone**:
   - Settings → General → VPN & Device Management
   - Trust your developer certificate

6. **Launch & Test!** 🎉

---

## 🎯 What to Test After Build

### Immediate Tests:

1. **Launch App** - Opens without crashes?
2. **Test Scenario 1** - Press "Left Turn" button
3. **Feel Alert Primer** - Initial 120ms tap?
4. **Feel Main Pattern** - Double-tap (tap-tap)?
5. **Try Scenario 5** - "Hazard" - Feel STRONG intensity?
6. **Try Scenario 6** - "Arrival" - Feel SOFT intensity?

### Research Validation:

- [ ] Can you distinguish Navigation from Attention from Arrival?
- [ ] Can you feel intensity differences (Soft/Firm/Strong)?
- [ ] Are patterns clearly distinct (Left vs Right vs Continue)?
- [ ] Is Alert Primer helpful for attention?

---

## 🐛 Quick Troubleshooting

### "No such command: flutter"
```bash
# Install Flutter (see Step 3 above)
# Or add to PATH:
export PATH="$PATH:$HOME/flutter/bin"
```

### "CocoaPods not installed"
```bash
sudo gem install cocoapods
cd ios
pod install
```

### "Signing requires a development team"
```
Xcode → Signing & Capabilities → Add your Apple ID as Team
Change Bundle Identifier to: com.[yourname].augmentumhaptics
```

### "No haptic feedback on iPhone"
```
- iPhone must be 8 or newer (Core Haptics)
- Silent mode must be OFF
- Settings → Sounds & Haptics → System Haptics ON
```

---

## 📚 Full Documentation

**Detailed guides available in project:**

1. **IOS_BUILD_GUIDE.md** - Complete step-by-step guide (12k words)
2. **ANDROID_INSTALLATION_GUIDE.md** - Android APK distribution
3. **README.md** - Technical documentation
4. **iOS_TESTING_GUIDE.md** - Testing methodology

---

## 🎊 Success Indicators

**You'll know it worked when:**

✅ App installs on iPhone  
✅ All 12 scenarios visible  
✅ Haptics work (feel vibrations)  
✅ Patterns are distinct  
✅ Intensity levels feel different  
✅ No crashes or errors  

---

## 📊 Timeline

**First Time:**
- Xcode install: 30-60 min (one-time)
- Project setup: 10 min
- First build: 5-10 min
- **Total: ~1.5-2 hours** (mostly Xcode download)

**Subsequent Builds:**
- Changes + rebuild: 1-2 min
- Full clean build: 3-5 min

---

## 💡 Pro Tips

1. **Keep Xcode open** - Faster subsequent builds
2. **Use Hot Reload** - ⌘\ for instant UI changes
3. **Check Console** - View → Debug Area for error logs
4. **Test on multiple iPhones** - Different haptic motors
5. **Use TestFlight** - Easy participant distribution

---

## 🆘 Need Help?

**If you get stuck:**

1. Read error messages in Xcode console
2. Run `flutter doctor -v` to check setup
3. Try clean build: `flutter clean` then rebuild
4. Check device is iPhone 8+ with iOS 13+
5. Verify USB cable is working (try different cable)

**Common issues are covered in IOS_BUILD_GUIDE.md**

---

## ✨ What's Included

**Your project archive contains:**

- ✅ Complete Flutter source code
- ✅ iOS native configuration
- ✅ Haptic engine implementation
- ✅ All 12 research scenarios
- ✅ Clinical UI design
- ✅ Research data logging
- ✅ Full documentation

**Ready for:**
- ✅ Core Haptics (iPhone 8+)
- ✅ TestFlight distribution
- ✅ Research participant testing
- ✅ App Store submission (optional)

---

## 🎯 Next Steps

1. **Download** `augmentum_haptics_ios_build.tar.gz` (337KB)
2. **Transfer** to your Mac
3. **Follow** the 5 steps above
4. **Test** on your iPhone
5. **Share** feedback on haptic quality

---

**Ready to build? Let's get those haptics working on iOS! 🚀**

Questions? Issues? Let me know at any step!
