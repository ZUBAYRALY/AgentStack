---
name: droid
description: "Expert Android engineering skill for modern production applications. Covers Jetpack Compose, Material 3, Clean Architecture (MVVM/MVI), Kotlin Coroutines & StateFlow, Room local persistence, Retrofit API integration, Hilt dependency injection, Baseline Profiles, and zero-jank performance optimization."
user-invocable: true
argument-hint: "[feature-name] [screen-type] [architecture-layer]"
license: MIT
metadata:
  framework: "Android Jetpack Compose"
  language: "Kotlin"
  architecture: "Clean Architecture + UDF + MVVM/MVI"
  performance: "Baseline Profile + Macrobenchmark"
---

# 🤖 Droid: Expert Android & Jetpack Compose Skill

This skill provides end-to-end Android engineering intelligence for production-ready, crash-free, and high-performance Android applications built with **Kotlin** and **Jetpack Compose**.

---

## 🧭 Workspace Integration & Synchronization

When working within an active project, this skill synchronizes with the workspace skills:
- 📖 **Master Protocol**: `[droid](SKILL.md)`
- 🎨 **Compose & UI Standards**: `[droid-ui](../droid-ui/SKILL.md)`
- 🏛️ **Architecture & Data**: `[droid-architecture](../droid-architecture/SKILL.md)`
- ⚡ **Baseline Profile Setup**: `[baseline-profile](../baseline-profile/SKILL.md)`
- 🚀 **Project Onboarding**: `[project](../project/SKILL.md)`
- 📄 **Requirements**: `[prd](../prd/SKILL.md)`
- 🏗️ **Architecture**: `[architecture](../architecture/SKILL.md)`
- 📜 **Strict Rules**: `[rules](../rules/SKILL.md)`
- 🎨 **Design System**: `[design](../design/SKILL.md)`
- 🧠 **Memory & State**: `[memory](../memory/SKILL.md)`
- ✅ **Audit Log**: `[done](../done/SKILL.md)`
- 🗺️ **Roadmap**: `[phases](../phases/SKILL.md)`

### 🧩 Companion Skills for Android
- 🎨 **[ui-ux-pro-max](../ui-ux-pro-max/SKILL.md)**: Jetpack Compose stack dataset (`jetpack-compose.csv`), Material 3 design tokens, typography scale, and layout guidelines.
- ℹ️ *Note: Web SEO (`seo`) and Framer Motion (`motion`) are web-only and excluded from Android native applications.*

> ⚡ **Mandatory Execution Rule**: After completing every screen, ViewModel, Room query, bug fix, or milestone, the AI must automatically update `Memory.md`, `done.md`, and `Phases.md`.

---

## ⚡ Core Philosophy & Architecture Guardrails

1. **Unidirectional Data Flow (UDF)**:
   - State flows down from ViewModel to Composables as a single immutable `UiState`.
   - Events flow up from Composables to ViewModel as callbacks `onEvent: (UiEvent) -> Unit`.
   $$\text{ViewModel (StateFlow)} \xrightarrow{\quad \text{State} \quad} \text{Composable (UI)} \xrightarrow{\quad \text{Event} \quad} \text{ViewModel}$$

2. **Single Source of Truth (SSOT)**:
   - The UI observes local Room database `Flow`.
   - Network responses write directly to the local database, which automatically updates the UI.

3. **Zero Jank Budget**:
   - Target devices: Android 10-14, 3-4 GB RAM (Xiaomi, Infinix, Tecno, Samsung A-series).
   - Zero frame drops (60-120fps).
   - Never perform heavy computations or object allocations during recomposition.

4. **Honest States (No Dummy Data)**:
   - Handle all 4 essential states explicitly: `Loading`, `Empty`, `Error (with Retry)`, and `Content`.

---

## 📱 Jetpack Compose Golden Rules

| Category | Guideline | Best Practice | Anti-Pattern |
| :--- | :--- | :--- | :--- |
| **Composables** | Stateless by default | Hoist state to caller; pass `uiState` and lambdas | Storing mutable state inside reusable child composables |
| **UI State** | Model with sealed interface | `sealed interface ScreenUiState` | Multiple scattered `Boolean` flags (`isLoading`, `isError`, etc.) |
| **Collection** | Lifecycle-aware | `collectAsStateWithLifecycle()` | `collectAsState()` (can leak coroutines in background) |
| **One-Off Events** | Single emission | `Channel<UiNavEvent>()` + `receiveAsFlow()` | Using `StateFlow` for navigation or snackbars (re-fires on rotate) |
| **Lists** | Virtualized with stable keys | `LazyColumn(items, key = { it.id }, contentType = { ... })` | Missing `key` or wrapping `Column` in `.verticalScroll()` |
| **Optimization** | Expensive calculations | `remember(keys)` or `derivedStateOf` | Recalculating filters or sorting on every recomposition |
| **Theming** | Material 3 Tokens | `MaterialTheme.colorScheme` & `MaterialTheme.typography` | Hardcoded hex colors and arbitrary font sizes (`14.sp`) |
| **Images** | Coil Image Loading | `AsyncImage` with crossfade and placeholders | Synchronous Bitmap loading or unscaled assets |

---

## 🏗️ Production Code Templates

### 1. Unified Screen UI State & ViewModel
```kotlin
// UiState.kt
sealed interface TaskUiState {
    data object Loading : TaskUiState
    data object Empty : TaskUiState
    data class Success(val tasks: List<TaskItem>) : TaskUiState
    data class Error(val message: String) : TaskUiState
}

sealed interface TaskUiEvent {
    data class ToggleComplete(val id: String) : TaskUiEvent
    data class DeleteTask(val id: String) : TaskUiEvent
    data object Refresh : TaskUiEvent
}

sealed interface TaskNavEvent {
    data class NavigateToDetail(val taskId: String) : TaskNavEvent
}

// TaskViewModel.kt
@HiltViewModel
class TaskViewModel @Inject constructor(
    private val taskRepository: TaskRepository
) : ViewModel() {

    private val _navEvents = Channel<TaskNavEvent>()
    val navEvents = _navEvents.receiveAsFlow()

    val uiState: StateFlow<TaskUiState> = taskRepository.getTasks()
        .map { tasks ->
            if (tasks.isEmpty()) TaskUiState.Empty else TaskUiState.Success(tasks)
        }
        .catch { emit(TaskUiState.Error(it.localizedMessage ?: "Unknown error")) }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = TaskUiState.Loading
        )

    fun onEvent(event: TaskUiEvent) {
        viewModelScope.launch {
            when (event) {
                is TaskUiEvent.ToggleComplete -> taskRepository.toggleTask(event.id)
                is TaskUiEvent.DeleteTask -> taskRepository.deleteTask(event.id)
                is TaskUiEvent.Refresh -> taskRepository.syncFromRemote()
            }
        }
    }

    fun onTaskClicked(taskId: String) {
        viewModelScope.launch {
            _navEvents.send(TaskNavEvent.NavigateToDetail(taskId))
        }
    }
}
```

### 2. Composable Screen Shell (Stateless Pattern)
```kotlin
@Composable
fun TaskScreen(
    viewModel: TaskViewModel = hiltViewModel(),
    onNavigateToDetail: (String) -> Unit
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    ObserveAsEvents(viewModel.navEvents) { event ->
        when (event) {
            is TaskNavEvent.NavigateToDetail -> onNavigateToDetail(event.taskId)
        }
    }

    TaskContent(
        uiState = uiState,
        onEvent = viewModel::onEvent,
        onTaskClick = viewModel::onTaskClicked
    )
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TaskContent(
    uiState: TaskUiState,
    onEvent: (TaskUiEvent) -> Unit,
    onTaskClick: (String) -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(stringResource(R.string.tasks_title)) },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.surface
                )
            )
        }
    ) { innerPadding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(innerPadding)
        ) {
            when (uiState) {
                is TaskUiState.Loading -> {
                    CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
                }
                is TaskUiState.Empty -> {
                    EmptyStateView(
                        message = stringResource(R.string.no_tasks_found),
                        onAction = { onEvent(TaskUiEvent.Refresh) }
                    )
                }
                is TaskUiState.Error -> {
                    ErrorStateView(
                        errorMessage = uiState.message,
                        onRetry = { onEvent(TaskUiEvent.Refresh) }
                    )
                }
                is TaskUiState.Success -> {
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        contentPadding = PaddingValues(16.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        items(
                            items = uiState.tasks,
                            key = { it.id }
                        ) { task ->
                            TaskRow(
                                task = task,
                                onClick = { onTaskClick(task.id) },
                                onToggle = { onEvent(TaskUiEvent.ToggleComplete(task.id)) }
                            )
                        }
                    }
                }
            }
        }
    }
}
```

### 3. Room Database & Offline-First Repository
```kotlin
// TaskEntity.kt
@Entity(tableName = "tasks")
data class TaskEntity(
    @PrimaryKey val id: String,
    val title: String,
    val isCompleted: Boolean,
    val updatedAt: Long = System.currentTimeMillis()
)

// TaskDao.kt
@Dao
interface TaskDao {
    @Query("SELECT * FROM tasks ORDER BY updatedAt DESC")
    fun observeAllTasks(): Flow<List<TaskEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun upsertAll(tasks: List<TaskEntity>)

    @Query("UPDATE tasks SET isCompleted = NOT isCompleted WHERE id = :id")
    suspend fun toggleCompleted(id: String)

    @Query("DELETE FROM tasks WHERE id = :id")
    suspend fun deleteById(id: String)
}

// TaskRepositoryImpl.kt
class TaskRepositoryImpl @Inject constructor(
    private val taskDao: TaskDao,
    private val apiService: TaskApiService
) : TaskRepository {

    override fun getTasks(): Flow<List<TaskItem>> {
        return taskDao.observeAllTasks().map { entities ->
            entities.map { it.toDomainModel() }
        }
    }

    override suspend fun syncFromRemote(): Result<Unit> = runCatching {
        val remoteTasks = apiService.fetchTasks()
        taskDao.upsertAll(remoteTasks.map { it.toEntity() })
    }

    override suspend fun toggleTask(id: String) {
        taskDao.toggleCompleted(id)
    }

    override suspend fun deleteTask(id: String) {
        taskDao.deleteById(id)
    }
}
```

---

## 🚀 Performance Benchmarking (Baseline Profile)

For optimal Android app startup speed (up to 30-40% faster) and stutter-free scroll performance:
1. Ensure the `:baselineprofile` test module exists as documented in `[baseline-profile](../baseline-profile/SKILL.md)`.
2. Generate baseline profiles using `./gradlew :app:generateBaselineProfile`.
3. Check `Macrobenchmark` startup and scroll metrics before and after changes.

