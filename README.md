# YiHuo ETor - English Translation

## 🌍 Translation Disclaimer

**This is NOT my original work.**

I have rebuilt this tool for the CachyOS / Linux community.

All credit for the development, design, and functionality of this application belongs to the original creators of **易火-ETor (YiHuo ETor)**.
All credit for the english translation goes to GIBOo_

---

## 📦 What This Is

YiHuo ETor is a comprehensive tracking and analysis tool for **Torchlight: Infinite** that helps players:
- Monitor farming efficiency in real-time
- Track item pickups and loot history
- Analyze profit per minute and cost effectiveness
- Record detailed statistics across multiple maps and sessions
- Optimize farming strategies with data-driven insights

---

## ⚠️ Important Notes

- This is an **unofficial rebuild** - not endorsed by the original developers
- If the rebuilt version doesn't work correctly, please revert to the original Chinese Windows version
- All feedback regarding core functionality should be directed to the original creators


---

## 🙏 Credits

All credit goes to the original YiHuo ETor development team for creating this powerful tool.

---

## 🐧 Linux / CachyOS Build

This project can be built for Linux as an AppImage or installed natively on Arch Linux / CachyOS.

### Prerequisites

- Node.js 18+ and npm
- For Arch/CachyOS: `base-devel`, `electron`, `asar`, `npm`, `nodejs`

### Building an AppImage

```bash
# One-step build (extracts asar, installs deps, builds):
./scripts/prepare-build.sh
```

Or manually:
```bash
npm install -g @electron/asar
asar extract resources/app.asar extracted-app
cp -r extracted-app/build/obf-app build/obf-app
npm install
npm run dist:linux
```

The output will be in the `dist/` directory.

### Installing on CachyOS / Arch Linux

```bash
makepkg -si
```

This uses the system `electron32` package and installs a launcher at `/usr/bin/yihuo-etor`.

### Notes

- The app connects to a remote web UI and monitors local **Torchlight: Infinite** game logs to provide real-time tracking data.
- **Steam Proton users:** Game logs will be located under the Steam Proton compatibility path, typically:
  ```
  ~/.local/share/Steam/steamapps/compatdata/<APP_ID>/pfx/drive_c/...
  ```
  You may need to configure the app to point to this directory.

---

## 📄 License

The original application's license applies. This translation is provided as-is with no warranties.

If you're the original developer and want this rebuild removed or modified, please contact me.
