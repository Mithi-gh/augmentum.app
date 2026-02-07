# Android APK Installation Guide - Augmentum Haptics

## 📦 APK Build Complete!

**App Name**: Augmentum Haptics Research  
**Version**: 1.0.0  
**Package**: com.augmentumhaptics.research  
**File Size**: 41 MB  
**Build Date**: February 6, 2026  

---

## 📥 Download APK

**APK File Location**: `/home/user/flutter_app/build/app/outputs/flutter-apk/app-release.apk`

**To download the APK**, you can:
1. Use the file browser in your development environment
2. Copy the file from the path above
3. Transfer via USB, cloud storage, or email

---

## 📱 Installation on Android Device

### Step 1: Enable Unknown Sources

**For Android 8.0+:**
1. Open **Settings**
2. Go to **Apps & notifications** → **Special app access**
3. Tap **Install unknown apps**
4. Select your file browser or Chrome
5. Enable **Allow from this source**

**For Android 7.0 and below:**
1. Open **Settings**
2. Go to **Security**
3. Enable **Unknown sources**

### Step 2: Install APK

**Method A: Direct Install**
1. Transfer APK to your Android device
2. Tap the APK file in your file browser
3. Tap **Install**
4. Wait for installation to complete
5. Tap **Open** to launch

**Method B: ADB Install (via computer)**
```bash
adb install app-release.apk
```

### Step 3: Grant Permissions

When you first open the app:
- ✅ **Vibration permission**: Automatically granted (no prompt needed)

---

## 🧪 Testing the Haptics

### Verification Checklist:

**1. App Launches**
- [ ] App opens without crashes
- [ ] UI shows 12 scenario buttons
- [ ] Instructions panel visible

**2. Basic Haptic Test**
- [ ] Press Scenario 1 (Left Turn)
- [ ] Feel double-tap vibration (220ms-280ms-220ms)
- [ ] Pattern repeats 3 times

**3. Pattern Differentiation**
- [ ] **Left Turn** (Scenario 1): Double-tap pattern
- [ ] **Right Turn** (Scenario 2): Single long vibration (500ms)
- [ ] **Continue** (Scenario 3): Short single pulse (180ms)
- [ ] **Hazard** (Scenario 5): Complex triple pattern
- [ ] **Arrival** (Scenario 6): Very long gentle vibration (1100ms)

**4. Research Questions to Test**
- [ ] Can you distinguish Navigation from Attention patterns?
- [ ] Can you tell Left Turn from Right Turn?
- [ ] Is the Alert Primer (120ms) noticeable before each main pattern?
- [ ] Are the processing gaps (700ms) helpful for attention shifting?

---

## 🎯 Expected Haptic Behavior

### All Scenarios Follow This Structure:
```
[Alert Primer: 120ms] → [Gap: 700ms] → [Main Pattern: looped]
```

### Pattern Details:

**Navigation Patterns:**
- **Scenario 1 - Left Turn**: Double-tap × 3 loops
  - `220ms ON → 280ms OFF → 220ms ON → 580ms OFF` (repeat 3×)
  
- **Scenario 2 - Right Turn**: Single long × 3 loops
  - `500ms ON → 580ms OFF` (repeat 3×)
  
- **Scenario 3 - Continue**: Short single × 3 loops
  - `180ms ON → 850ms OFF` (repeat 3×)

**Attention/Hazard Patterns:**
- **Scenarios 5, 9, 11**: Complex triple pattern × 3 loops
  - `120ms ON → 120ms OFF → 300ms ON → 450ms OFF → 120ms ON` (repeat 3×)

**Arrival Patterns:**
- **Scenarios 6, 12**: Very long gentle × 2 loops
  - `1100ms ON → 1000ms OFF` (repeat 2×)

**Special Scenarios:**
- **Scenario 4**: Randomized Left or Right (changes each press)
- **Scenario 8**: Continue, wait 2 seconds, then Left

---

## 🔧 Troubleshooting

### "App won't install"
- Make sure "Install unknown apps" is enabled
- Check if you have enough storage space (need 100MB free)
- Try redownloading the APK file

### "No vibration felt"
- Check that phone is NOT in Silent/Do Not Disturb mode
- Go to Settings → Sounds & Vibration → enable vibration
- Test with other apps that vibrate to confirm hardware works
- Some Android phones have weak vibration motors

### "App crashes on open"
- Your Android version should be 5.0 (API 21) or higher
- Clear app data: Settings → Apps → Augmentum Haptics → Clear data
- Uninstall and reinstall

### "Vibrations feel the same"
- This is expected! Android web has intensity limitations
- Native Android has better control than web version
- Focus on timing patterns (short vs long, single vs double-tap)

---

## 📊 Sharing with Research Participants

### Distribution Methods:

**Method 1: Direct File Transfer**
```
1. Email APK file as attachment
2. Upload to Google Drive / Dropbox and share link
3. Transfer via USB to their device
```

**Method 2: QR Code (Recommended)**
```
1. Upload APK to cloud storage
2. Generate QR code for download link
3. Participants scan and install
```

**Method 3: Local Network**
```
1. Share via WiFi Direct / Bluetooth
2. Use app like ShareIt or Files by Google
```

### Participant Instructions Template:

```
Research Study: Augmentum Haptics Testing

1. Download the APK file: [insert link]
2. Enable "Install unknown apps" in Settings
3. Install the app
4. Open from app drawer
5. Test scenarios 1-12
6. Report which patterns you can distinguish

Focus on: Can you tell the difference between 
Navigation, Attention, and Arrival categories?
```

---

## 🔐 Security Note

**This is a research prototype APK:**
- Not signed with Play Store certificate
- Requires "Unknown sources" permission
- Safe for research participants in controlled study
- For production: Sign with your own keystore and publish to Play Store

---

## 📈 Next Steps

**For You:**
1. ✅ Install on your Android device
2. ✅ Test all 12 scenarios
3. ✅ Verify haptic patterns are distinguishable
4. ✅ Note any patterns that need adjustment

**For Participants:**
1. Distribute APK via preferred method
2. Provide installation instructions
3. Collect feedback on pattern differentiation
4. Analyze research data from app logs

**For Production:**
1. Sign APK with release keystore
2. Publish to Google Play Store (optional)
3. Or continue distributing APK directly

---

## 💡 Tips for Best Results

**Hardware Considerations:**
- Test on multiple Android devices if possible
- Different phones have different vibration motor quality
- Newer phones (2020+) generally have better haptics
- Gaming phones often have the best vibration motors

**Testing Environment:**
- Quiet room to focus on haptic feedback
- Hold phone firmly in hand (not on table)
- Test each scenario multiple times
- Take breaks to avoid habituation

**Data Collection:**
- App logs all button presses silently
- Collect qualitative feedback from participants
- Ask: "Which patterns could you distinguish?"
- Record: Device model, Android version, feedback

---

## 🆘 Support

If you encounter issues:
1. Check Android version (Settings → About phone)
2. Verify vibration works in other apps
3. Clear app cache and retry
4. Check logcat for errors: `adb logcat | grep Haptic`

---

**APK is ready! Install and test the haptic patterns now.** 🎉
