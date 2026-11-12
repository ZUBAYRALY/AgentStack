---
name: github-release
description: "Universal workflow to prepare, package, and publish closed-source GitHub releases for Android applications with proprietary EULA licenses. Triggered with /github-release."
user-invocable: true
argument-hint: "[version-name] [app-name]"
license: MIT
metadata:
  purpose: "Closed-Source Android App GitHub Release & Distribution"
---

# 📦 GitHub Release Protocol – Closed Source Android App (`/github-release`)

This skill defines the complete process of preparing and publishing an official release of an Android app on GitHub without revealing proprietary source code.

---

## Step 1: Update App Version
1. Check `/app/build.gradle.kts` (or `.gradle`), increment `versionCode`, and update `versionName`.
2. Update the `AboutScreen` or Settings UI file to reflect the new release version if displayed.

---

## Step 2: Apply Proprietary EULA License
To protect closed-source distribution, ensure the `LICENSE` file at the root contains the End User License Agreement:

```text
END USER LICENSE AGREEMENT (EULA) FOR {{APP_NAME}}

TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
1. Definitions.
   "Licensor" shall mean Zubayr Aly, the copyright owner.
   "Software" shall mean the {{APP_NAME}} application in executable code form.
2. Grant of License.
   Personal, non-exclusive, non-transferable, limited license to install and use
   the executable code version (APK) strictly for personal, non-commercial purposes.
3. Restrictions.
   You may NOT modify, translate, reverse engineer, decompile, or disassemble.
   You may NOT distribute the source code in any manner.
...
Copyright {{CURRENT_YEAR}} Zubayr Aly
```

---

## Step 3: Standardize Release README.md
Ensure `README.md` includes:
- App Name, description, platform badge, proprietary license badge, and GitHub release badge.
- Installation instructions (`{{app-name}}-release-vx.x.x.apk` download steps).
- Screenshots table.
- Support the Developer donation links (PayPal, NayaPay, USDT).

---

## Step 4: Build & Publish Release
1. Build signed APK via Android Studio: **Build > Generate Signed Bundle / APK**.
2. Rename output APK to `{{app-name}}-release-v{{VERSION}}.apk`.
3. Create release tag on GitHub (e.g. `v1.0.0`).
4. Add release notes highlighting new features and bug fixes.
5. Attach the APK in the Assets box and publish.
