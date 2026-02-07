# iOS Testing Guide for Augmentum Haptics

## 📱 How to Test on Your iPhone

### Method 1: PWA (Progressive Web App) - **RECOMMENDED FOR IMMEDIATE TESTING** ⚡

This method allows you to test haptics **RIGHT NOW** without needing Xcode or a Mac.

#### Step-by-Step Instructions:

**1. Open in Safari (iOS)**
- Open this URL in **Safari** on your iPhone:
  ```
  https://5060-iola4a0548r4ocibxwems-0e616f0a.sandbox.novita.ai
  ```
- ⚠️ **Must use Safari** - Chrome/Firefox on iOS don't support Vibration API

**2. Add to Home Screen**
- Tap the **Share** button (square with arrow pointing up)
- Scroll down and tap **"Add to Home Screen"**
- Name it: "Augmentum Haptics"
- Tap **"Add"**

**3. Launch the PWA**
- Go to your iPhone home screen
- Tap the **Augmentum Haptics** icon
- The app opens in full-screen mode (PWA)

**4. Test Haptics** ✅
- Press any scenario button (1-12)
- **You should feel vibrations!**
- Try different scenarios to compare patterns
- Focus on the timing and intensity differences

#### PWA Limitations:
- ✅ **Works**: Basic vibration patterns, timing sequences
- ⚠️ **Limited**: iOS doesn't support custom intensity in web (all vibrations are same strength)
- ❌ **Missing**: Core Haptics API (advanced haptic effects)

---

### Method 2: TestFlight (Full Native iOS App) - **BEST FOR RESEARCH** 🎯

For your actual research with friends, I recommend building a **native iOS app** and distributing via **TestFlight**.

#### What You'll Need:
- **Mac computer** (required for iOS builds)
- **Xcode** (free from Mac App Store)
- **Apple Developer Account** ($99/year - or free for testing on your own device)

#### Process Overview:
1. **Transfer this project to a Mac**
2. **Open in Xcode** (`flutter build ios` generates Xcode project)
3. **Sign with your Apple ID**
4. **Build and test** on your iPhone (via USB cable)
5. **Distribute via TestFlight** to your research participants

#### Benefits:
- ✅ **Full Core Haptics support** (rich, expressive haptics)
- ✅ **Custom intensity levels** (Soft/Firm/Strong)
- ✅ **Professional distribution** via TestFlight
- ✅ **No browser limitations**

---

### Method 3: Third-Party Build Services 🌐

If you don't have a Mac, you can use cloud build services:

**Options:**
- **Codemagic** (https://codemagic.io) - Free tier available
- **App Center** (https://appcenter.ms) - Microsoft's service
- **Bitrise** (https://bitrise.io) - CI/CD for mobile

**Process:**
1. Push code to GitHub (I can help with this)
2. Connect GitHub to build service
3. Configure iOS build settings
4. Download .ipa file
5. Install via TestFlight or direct install

---

## 🧪 Testing Checklist

When testing on iOS, verify:

### Category 1: Navigation Patterns
- [ ] **Scenario 1** - Left Turn: Double-tap pattern (220ms-280ms-220ms)
- [ ] **Scenario 2** - Right Turn: Single long pulse (500ms)
- [ ] **Scenario 3** - Continue: Short single pulse (180ms)

### Category 2: Attention/Hazard
- [ ] **Scenario 5** - Hazard: Triple-pulse complex pattern
- [ ] **Scenario 9** - Missed Turn: Same as hazard
- [ ] **Scenario 11** - Late Alert: Same as hazard

### Category 3: Arrival
- [ ] **Scenario 6** - Arrival: Very long gentle pulse (1100ms)
- [ ] **Scenario 12** - Final Arrival: Same as arrival

### Special Scenarios
- [ ] **Scenario 4** - Late Notice Turn: Random left or right
- [ ] **Scenario 8** - Complex Junction: Continue, then Left (2s gap)

---

## 🔍 What to Look For

**Perceptual Differentiation Test:**
1. Can you **notice** when haptic starts? (Alert Primer)
2. Can you **distinguish** between Navigation vs Attention vs Arrival?
3. Can you **tell apart** Left Turn vs Right Turn vs Continue?
4. Do patterns feel **consistent** across multiple tests?

**Research Questions:**
- Are the categories distinct enough?
- Is the Alert Primer useful or distracting?
- Do the processing gaps help attention shifts?
- Are any patterns too similar?

---

## 📊 Sharing with Research Participants

### For PWA Testing (Quick):
1. Share this URL: `https://5060-iola4a0548r4ocibxwems-0e616f0a.sandbox.novita.ai`
2. Send these instructions (SMS/Email):
   ```
   Test Augmentum Haptics:
   1. Open link in Safari on iPhone
   2. Tap Share → Add to Home Screen
   3. Launch the app from home screen
   4. Test scenarios 1-12
   5. Share your feedback
   ```

### For Native iOS Testing (Research Quality):
1. Build native iOS app (see Method 2 above)
2. Upload to TestFlight
3. Invite participants via email
4. They install TestFlight app, then your app
5. Collect structured feedback

---

## 🚀 Next Steps

**Immediate Testing (Today):**
- Use **Method 1 (PWA)** - works right now
- Test all 12 scenarios on your iPhone
- Note any patterns that are unclear

**For Research Study (This Week):**
- Set up Mac + Xcode (or cloud build service)
- Build native iOS app
- Test with TestFlight
- Invite research participants

---

## ⚠️ Important Notes

**PWA Limitations:**
- iOS Safari PWA supports basic vibration
- All vibrations have same intensity (iOS limitation)
- Timing and patterns work correctly
- Good for initial concept testing

**Why Native iOS App is Better:**
- Uses Core Haptics API (iPhone 8+)
- Custom intensity (Soft/Firm/Strong)
- Richer haptic vocabulary
- Better for research data quality

---

## 🆘 Troubleshooting

**"No vibration on iPhone"**
- Make sure phone is not in Silent mode (check physical switch)
- Check Settings → Sounds & Haptics → System Haptics (ON)
- Try in PWA mode (Add to Home Screen first)

**"Vibrations feel the same"**
- Expected in PWA - iOS web doesn't support custom intensity
- Build native app for full haptic differentiation

**"App doesn't load"**
- Make sure using Safari (not Chrome)
- Check internet connection
- Try force-refresh (pull down on page)

---

## 📧 Need Help?

If you need assistance with:
- Building native iOS app
- Setting up TestFlight
- Configuring Xcode project
- GitHub integration

Just let me know and I'll guide you through the process!
