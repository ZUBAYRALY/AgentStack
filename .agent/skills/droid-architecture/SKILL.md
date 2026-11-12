---
name: droid-architecture
description: Android Clean Architecture, ViewModel & Data Layer Protocol
user-invocable: true
argument-hint: "[module-or-repository] [layer]"
---

# 🏛️ Droid Architecture Protocol – Clean Architecture & Data Layer

This sub-workflow defines the architectural structure, layering boundaries, ViewModel patterns, Room database integration, and networking standards for Android applications.

---

## 🏗️ 1. Architecture Overview (Unidirectional Data Flow)

Follow the official Google Android Architecture recommendations:

```
┌────────────────────────────────────────────────────────┐
│                   UI LAYER                             │
│   Composable Screens  <──>  Jetpack ViewModel          │
│   (Consumes StateFlow, emits user UI events)           │
└──────────────────────────┬─────────────────────────────┘
                           │ (Calls UseCases / Repositories)
                           ▼
┌────────────────────────────────────────────────────────┐
│                 DOMAIN LAYER (Optional)                 │
│   UseCases / Interactors (Single business responsibility)
└──────────────────────────┬─────────────────────────────┘
                           │
                           ▼
┌────────────────────────────────────────────────────────┐
│                   DATA LAYER                           │
│   Repository (Single Source of Truth)                  │
│       ├── Local Data Source: Room Database / DataStore │
│       └── Remote Data Source: Retrofit / Ktor API      │
└────────────────────────────────────────────────────────┘
```

---

## 📱 2. UI Layer & ViewModel Rules

1. **State Preservation**:
   - Manage state exclusively in `@HiltViewModel` using Kotlin coroutines and `StateFlow`:
   ```kotlin
   @HiltViewModel
   class TaskViewModel @Inject constructor(
       private val taskRepository: TaskRepository
   ) : ViewModel() {

       private val _uiState = MutableStateFlow<TaskUiState>(TaskUiState.Loading)
       val uiState: StateFlow<TaskUiState> = _uiState.asStateFlow()

       private val _eventChannel = Channel<TaskNavigationEvent>()
       val navigationEvents = _eventChannel.receiveAsFlow()
       ...
   }
   ```

2. **One-Shot Events (Navigation & Toasts)**:
   - 🚫 **Never** use `StateFlow` for one-time events (snackbars, navigation); it re-triggers on screen rotation.
   - ✅ **Always** use `Channel<T>()` and expose via `receiveAsFlow()`.

3. **No Android Framework References in ViewModels**:
   - Never pass `Context`, `View`, or Compose `Modifier` into ViewModels to avoid memory leaks.

---

## 💾 3. Data Layer & Repository (Offline-First)

1. **Single Source of Truth (SSOT)**:
   - The UI observes local Room database `Flow`:
   ```kotlin
   interface TaskRepository {
       fun getTasks(): Flow<List<TaskEntity>>
       suspend fun syncTasks(): Result<Unit>
       suspend fun insertTask(task: TaskEntity)
   }
   ```

2. **Room Database Guidelines**:
   - Use coroutine-enabled DAOs returning `Flow` for queries.
   - Use `OnConflictStrategy.REPLACE` or `UPSERT` for synchronizing network entities.
   - Isolate DB migrations cleanly.

3. **Safe Networking & Error Wrapping**:
   - All network calls must be wrapped inside `runCatching` or safe API call handlers.
   - Map HTTP and network exceptions to domain-friendly error models before exposing to ViewModels.

---

## 💉 4. Dependency Injection (Hilt)

1. Provide application dependencies through modular Hilt `@Module` objects (`DatabaseModule`, `NetworkModule`, `RepositoryModule`).
2. Keep bindings scoped correctly:
   - Database / Network Client: `@Singleton`
   - Repository: `@Singleton` or `@ViewModelScoped`
   - ViewModel: `@HiltViewModel`

---

## 🔒 5. Android Mobile Security Standards

1. **Encrypted Local Storage**:
   - Store user auth tokens and secrets using `EncryptedSharedPreferences` (Jetpack Security) or Android Keystore:
   ```kotlin
   val masterKey = MasterKey.Builder(context)
       .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
       .build()

   val sharedPreferences = EncryptedSharedPreferences.create(
       context,
       "secure_user_prefs",
       masterKey,
       EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
       EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
   )
   ```
   - 🚫 **Never** store plain API keys or tokens in standard `SharedPreferences`.

2. **Network Transport Security**:
   - Enforce HTTPS across the entire app. Set `android:usesCleartextTraffic="false"` in `AndroidManifest.xml`.
   - Provide a `network_security_config.xml` to disallow user-installed CAs unless explicitly debugging.

3. **Application Integrity & Anti-Tampering**:
   - Set `android:allowBackup="false"` to prevent adb backup extraction of private database files.
   - Set `android:exported="false"` on all Activities, Services, and BroadcastReceivers unless explicitly required for deep linking.
   - Enable R8/ProGuard code minification and resource shrinking for release APKs:
   ```kotlin
   buildTypes {
       release {
           isMinifyEnabled = true
           isShrinkResources = true
           proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
       }
   }
   ```
