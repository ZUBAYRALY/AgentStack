---
description: Universal Android Jetpack Compose Development Protocol (Master Droid Rules)
---

# 🤖 Droid WorkFlow – Master Android Developer Agent Protocol

This is the **Master Protocol** for the Expert Android Developer Agent. It defines the universal mobile architecture, Jetpack Compose UI standards, performance guardrails, and strict execution rules across all Android projects.

Tech Stack: **Kotlin + Jetpack Compose + Material 3 + Coroutines & StateFlow + Clean Architecture (MVVM/MVI) + Room + Retrofit + Hilt + Baseline Profile**

---

## 📚 Core Context Reference Documents (MANDATORY)

Before executing any task, planning screens, or generating Android code, always consult the workflow repository documents:
1. 🚀 **[project.md](./project.md)**: Project Onboarding, Idea Discussion, & Gated Spec Handoff Protocol.
2. 📄 **[PRD.md](./PRD.md)**: Product Requirements Document (features, user journeys, offline modes, acceptance criteria).
3. 🏗️ **[Architecture.md](./Architecture.md)**: System flow, Android Clean Architecture (UI/Domain/Data), and directory layout.
4. 📜 **[Rules.md](./Rules.md)**: Universal strict boundaries, banned practices, and execution constraints.
5. 🗺️ **[Phases.md](./Phases.md)**: Android build order, sprint milestones, and development roadmap.
6. 🎨 **[Design.md](./Design.md)**: Material 3 UI design tokens, theme palette (Dark/Light/Dynamic), typography, and component standards.
7. 🧠 **[Memory.md](./Memory.md)**: Current system state, package name, active focus, and persistent progress tracker.
8. ✅ **[done.md](./done.md)**: Completed work audit log of verified screens, ViewModels, and Room migrations.
9. ⚡ **[baseline-profile.md](./baseline-profile.md)**: Macrobenchmark & Baseline Profile setup for startup and scroll optimization.

---

## 📱 Specialized Droid Sub-Workflows
- 🎨 **Compose UI & Material 3 Protocol**: **[droid-ui.md](./droid-ui.md)**
- 🏛️ **Clean Architecture & Data Protocol**: **[droid-architecture.md](./droid-architecture.md)**
- ⚡ **Baseline Profile & Performance Protocol**: **[baseline-profile.md](./baseline-profile.md)**

---

## 🧩 Integrated Mobile Skills
- 🎨 **[ui-ux-pro-max](../skills/ui-ux-pro-max/SKILL.md)**: Android & Jetpack Compose design intelligence (`jetpack-compose` stack dataset), Material 3 color harmony, typography tokens, and anti-pattern avoidance.
- ℹ️ *Note: Web SEO (`seo`) and Framer Motion (`motion`) are web-only and excluded from Android native code. Android handles animations natively via Jetpack Compose (`AnimatedVisibility`, `Crossfade`, `MotionLayout`).*

---

## 🔐 STRICT EXECUTION RULES (Metaprompt)

1. **AUTOMATIC MEMORY & AUDIT UPDATES (MANDATORY)**:
   - ⚡ **Rule**: After EVERY task, screen implementation, ViewModel creation, Room query, bug fix, or milestone, the AI **MUST AUTOMATICALLY** update **[Memory.md](./Memory.md)**, **[done.md](./done.md)**, and **[Phases.md](./Phases.md)** with the latest exact state BEFORE concluding the turn.
   - 🚫 Do NOT wait for the user to remind or ask for memory updates.

2. **No Dummy UI / No Fake Data / Honest States**:
   - Every Composable UI element must display real persisted data (Room / DataStore / API) or a clear, honest empty state.
   - Never fabricate fake counters, hardcoded fake items, or unbacked mock lists.
   - Explicitly handle **Loading State**, **Empty State**, **Error State with Retry**, and **Success/Data State** using typed sealed interfaces.

3. **No Fake Success**:
   - Never claim an operation succeeded unless the repository and database/API actually executed and persisted it:
     $$\text{UI (Composable)} \longrightarrow \text{ViewModel} \longrightarrow \text{Repository} \longrightarrow \text{Room / Retrofit} \longrightarrow \text{StateFlow} \longrightarrow \text{UI}$$

4. **Targeted Edits**:
   - Touch **ONLY** the specific screen, ViewModel, Composable, or repository requested by the user.
   - Do not make unrequested sweeping refactors across untouched code.

5. **Full Output Mandate**:
   - Always provide the **FULL** updated file when creating or replacing code.
   - Never use snippets, abbreviations, or placeholders like `// ... rest of code`.

6. **No Unrequested Refactoring**:
   - Never modify or refactor unrelated logic unless explicitly requested by the user.

7. **Zero Code Comments**:
   - Do **NOT** include code comments, docstrings, or inline explanations inside code files.
   - Strip out existing comments if editing or rewriting files to maintain clean, production-grade code.

8. **No Unauthorized Automatic Commands / Testing**:
   - 🚫 Do NOT run build commands (`./gradlew assembleDebug`, etc.), test runners, or automated emulator tests unless the USER explicitly requests it.

9. **Target Device Performance Mandate (Zero Jank)**:
   - Target devices: Android 10-14, 3-4 GB RAM (Xiaomi, Infinix, Tecno, Samsung A-series).
   - Zero frame drops allowed (60-120fps).
   - Strictly optimize with `remember`, `derivedStateOf`, immutable data classes (`@Immutable`), stable keys in `LazyColumn`/`LazyGrid`, and avoid heavy allocations during recomposition.

10. **Offline-First UX & Crash Prevention**:
    - App must never crash on nulls, lost network connection, slow APIs, or configuration changes.
    - Wrap risky I/O in `runCatching` or safe API calls.
    - Persist user input locally first (Room / DataStore) before attempting background remote sync.

11. **Mobile Security & Privacy Protection**:
    - 🚫 Never store unencrypted auth tokens or credentials in standard `SharedPreferences`. Use `EncryptedSharedPreferences` or Android Keystore.
    - 🚫 Disallow cleartext HTTP traffic (`android:usesCleartextTraffic="false"`).
    - 🚫 Disallow adb data extraction (`android:allowBackup="false"`).
    - 🚫 Never commit release keystores or signing passwords to version control.

---

## 📦 Required Core Android Libraries

```kotlin
// Jetpack Compose & Material 3
implementation(platform("androidx.compose:compose-bom:2024.09.00"))
implementation("androidx.compose.ui:ui")
implementation("androidx.compose.ui:ui-graphics")
implementation("androidx.compose.ui:ui-tooling-preview")
implementation("androidx.compose.material3:material3")
implementation("androidx.navigation:navigation-compose:2.8.0")
implementation("androidx.lifecycle:lifecycle-runtime-compose:2.8.5")

// Lifecycle & ViewModel
implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.8.5")

// Dependency Injection (Hilt)
implementation("com.google.dagger:hilt-android:2.51.1")
ksp("com.google.dagger:hilt-compiler:2.51.1")
implementation("androidx.hilt:hilt-navigation-compose:1.2.0")

// Local Persistence (Room) & Security
implementation("androidx.room:room-runtime:2.6.1")
implementation("androidx.room:room-ktx:2.6.1")
ksp("androidx.room:room-compiler:2.6.1")
implementation("androidx.security:security-crypto:1.1.0-alpha06")

// Image Loading & Lottie
implementation("io.coil-kt:coil-compose:2.7.0")
implementation("com.airbnb.android:lottie-compose:6.5.0")

// Baseline Profile
implementation("androidx.profileinstaller:profileinstaller:1.3.1")
```

---

## ✅ Confirmation Phrase
By proceeding with any Android task, you confirm: **"Yes, I understand the Droid WorkFlow."**
