---
description: How to setup and run Baseline Profile for Android application performance boost
---

# Universal Baseline Profiler Setup Workflow

When asked to setup a baseline profile for an Android application, follow these steps dynamically adapting to the current active project. Let `<PACKAGE_NAME>` be the app's `applicationId` (e.g. `com.example.app`, `com.highfy.xeeon`, etc.) and `<PROJECT_NAME>` be the project's root name or namespace. Let `<MIN_SDK>` and `<TARGET_SDK>` match the app's build settings.

## 1: Folder structure (create beside app)

<PROJECT_ROOT>/
├── app/
├── baselineprofile/         <-- NEW
│   ├── build.gradle.kts
│   └── src/main/java/<PACKAGE_PATH_OF_BASELINEPROFILE>/
│       ├── BaselineProfileGenerator.kt
│       └── StartupBenchmarks.kt
└──

*Note: `<PACKAGE_PATH_OF_BASELINEPROFILE>` is usually your `<PACKAGE_NAME>` folder path appended with `/baselineprofile`.*

## 2: baselineprofile/build.gradle.kts

Create the build file using the dynamic namespace based on `<PACKAGE_NAME>.baselineprofile`:

```kotlin
plugins {
   id("com.android.test")
   id("org.jetbrains.kotlin.android")
}

android {
   namespace = "<PACKAGE_NAME>.baselineprofile"
   compileSdk = 35 // Base this on app's compileSdk

   // Force Kotlin & Java to use JDK 17 (or base on app's Java version)
   kotlin { jvmToolchain(17) }
   compileOptions {
       sourceCompatibility = JavaVersion.VERSION_17
       targetCompatibility = JavaVersion.VERSION_17
   }

   defaultConfig {
       minSdk = 29 // Base on app's minSdk, at least 29 is recommended for UI Automator
       targetSdk = 35 // Base on app's targetSdk
       testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
   }

   buildTypes {
       create("benchmark") {
           isDebuggable = true
           signingConfig = signingConfigs.getByName("debug")
           matchingFallbacks += listOf("release")
       }
   }

   targetProjectPath = ":app"
   experimentalProperties["android.experimental.self-instrumenting"] = true
}

dependencies {
   implementation("androidx.test.ext:junit:1.2.1")
   implementation("androidx.test.espresso:espresso-core:3.5.1")
   implementation("androidx.test.uiautomator:uiautomator:2.3.0")
   implementation("androidx.benchmark:benchmark-macro-junit4:1.2.4")
}
```

## **3: BaselineProfileGenerator.kt**

```kotlin
package <PACKAGE_NAME>.baselineprofile

import androidx.benchmark.macro.junit4.BaselineProfileRule
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.platform.app.InstrumentationRegistry
import androidx.test.uiautomator.By
import androidx.test.uiautomator.Direction
import androidx.test.uiautomator.UiDevice
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class BaselineProfileGenerator {

   @get:Rule
   val baselineProfileRule = BaselineProfileRule()

   @Test
   fun generate() = baselineProfileRule.collect(
       packageName = "<PACKAGE_NAME>",
       includeInStartupProfile = true
   ) {
       pressHome()
       startActivityAndWait()

       // --- Critical user journeys ---
       // Agent should dynamically find or ask for the resource IDs for scrollable/clickable elements.
       // E.g., val row = device.findObject(By.res("<PACKAGE_NAME>:id/section_row"))
       // row?.fling(Direction.RIGHT)
       
       // device.findObject(By.res("<PACKAGE_NAME>:id/media_poster"))?.click()
       // device.waitForIdle()

       device.pressBack()
   }
}
```

## **4: StartupBenchmarks.kt**

```kotlin
package <PACKAGE_NAME>.baselineprofile

import androidx.benchmark.macro.*
import androidx.benchmark.macro.junit4.*
import androidx.test.ext.junit.runners.AndroidJUnit4
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class StartupBenchmarks {
   @get:Rule
   val benchmarkRule = MacrobenchmarkRule()

   @Test
   fun startupCompilationNone() = startup(CompilationMode.None())

   @Test
   fun startupCompilationBaselineProfiles() =
       startup(CompilationMode.Partial(BaselineProfileMode.Require))

   private fun startup(compilationMode: CompilationMode) = benchmarkRule.measureRepeated(
       packageName = "<PACKAGE_NAME>",
       metrics = listOf(StartupTimingMetric()),
       compilationMode = compilationMode,
       iterations = 10,
       startupMode = StartupMode.COLD,
       setupBlock = { pressHome() },
       measureBlock = { startActivityAndWait() }
   )
}
```

## 5: settings.gradle.kts / settings.gradle

Include the module in `settings.gradle(.kts)`:

```kotlin
include(":app")
include(":baselineprofile") // <-- ADD THIS
```

## **6: app/build.gradle.kts**

Add the benchmark config alongside release, and include the profile installer dependency:

```kotlin
buildTypes {
   // ... existing release block

   // Benchmark build type for Macrobenchmark
   create("benchmark") {
       initWith(buildTypes.getByName("release"))
       signingConfig = signingConfigs.getByName("debug")
       matchingFallbacks += listOf("release")
       proguardFiles(
           getDefaultProguardFile("proguard-android-optimize.txt"),
           "proguard-rules.pro"
       )
   }
}

dependencies {
   // Baseline-Profile installer (runtime)
   implementation("androidx.profileinstaller:profileinstaller:1.4.1") // Or use version catalog
}
```

# Actions to auto-run

When the user asks to run the profile generator, perform these steps assuming the physical device is connected:

1. Build both APKs:
```shell
./gradlew :app:assembleBenchmark
./gradlew :baselineprofile:assembleBenchmark
```

2. Install both APKs on the connected device:
```shell
adb install -r app/build/outputs/apk/benchmark/app-benchmark.apk
# Look carefully at output folders depending on your gradle plugin version
adb install -r baselineprofile/build/outputs/apk/androidTest/benchmark/baselineprofile-benchmark-androidTest.apk || adb install -r baselineprofile/build/outputs/apk/benchmark/baselineprofile-benchmark.apk
```

3. Generate the profile:
```shell
adb shell am instrument -w -e class <PACKAGE_NAME>.baselineprofile.BaselineProfileGenerator <PACKAGE_NAME>.baselineprofile/androidx.test.runner.AndroidJUnitRunner
```

4. Pull the generated profile to the source tree:
```shell
mkdir -p app/src/main/baselineProfiles
adb pull "/storage/emulated/0/Android/media/<PACKAGE_NAME>/BaselineProfileGenerator_generate-startup-prof.txt" app/src/main/baselineProfiles/baseline-prof.txt
```

5. The user can then re-build the app (`./gradlew :app:assembleRelease`) to get their AOT-compiled profile.
