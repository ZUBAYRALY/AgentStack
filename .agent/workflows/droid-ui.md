---
description: Droid UI & Jetpack Compose Development Protocol
---

# 🎨 Droid UI Protocol – Jetpack Compose & Material 3

This sub-workflow governs all UI design, layout structure, Material 3 theming, and Composable component implementations for Android.

---

## 🏛️ Core UI Principles

1. **Pure UI Composables (Stateless by Default)**:
   - Composables must render UI only.
   - Do NOT execute business logic, DB queries, or direct repository calls inside Composable functions.
   - Always hoist state: accept `uiState: UiState` and emit events `onEvent: (UiEvent) -> Unit`.

2. **Unified UI State Modeling**:
   - Model UI state as a sealed interface or data class:
   ```kotlin
   sealed interface ScreenUiState {
       data object Loading : ScreenUiState
       data object Empty : ScreenUiState
       data class Success(val items: PersistentList<ItemModel>) : ScreenUiState
       data class Error(val message: String) : ScreenUiState
   }
   ```

3. **Lifecycle-Aware Collection**:
   - In screens, collect state safely using `collectAsStateWithLifecycle()`:
   ```kotlin
   val uiState by viewModel.uiState.collectAsStateWithLifecycle()
   ```

---

## 🎨 Material 3 Theming & Components

1. **Theme Tokens Only**:
   - Never hardcode hexadecimal colors or arbitrary font sizes directly in Composables.
   - Use `MaterialTheme.colorScheme.primary`, `surface`, `onSurfaceVariant`, etc.
   - Use `MaterialTheme.typography.titleMedium`, `bodyLarge`, `labelSmall`.

2. **Standard Screen Shell**:
   - Every primary screen must use `Scaffold` with slot-based parameters:
   ```kotlin
   Scaffold(
       topBar = { TopAppBar(title = { Text(stringResource(R.string.title)) }) },
       snackbarHost = { SnackbarHost(snackbarHostState) },
       floatingActionButton = { ... }
   ) { innerPadding ->
       Box(modifier = Modifier.padding(innerPadding)) { ... }
   }
   ```

3. **System Bars & Edge-to-Edge**:
   - Support Android 14/15 edge-to-edge layouts using `WindowInsets.systemBars`.

---

## ⚡ Performance & Recomposition Rules (Zero Jank)

1. **Stable Keys in LazyColumn / LazyGrid**:
   - Always supply a unique, stable `key` and specify `contentType` for heterogeneous lists:
   ```kotlin
   LazyColumn(modifier = Modifier.fillMaxSize()) {
       items(
           items = uiState.items,
           key = { it.id },
           contentType = { it.itemType }
       ) { item ->
           ItemRow(item = item, onClick = { onEvent(UiEvent.Select(item.id)) })
       }
   }
   ```

2. **Avoid Heavy Computations in Composables**:
   - Use `remember(keys)` for expensive object creations.
   - Use `derivedStateOf` when calculating values based on frequently changing states (e.g., scroll offset):
   ```kotlin
   val showScrollToTop by remember {
       derivedStateOf { listState.firstVisibleItemIndex > 5 }
   }
   ```

3. **Flat Layout Hierarchy**:
   - Avoid deep nested trees (`Box` inside `Column` inside `Row` inside `Box`).
   - Use `Modifier.padding()` and `Arrangement.spacedBy()` instead of unnecessary wrapper containers.

4. **Image Loading**:
   - Use **Coil** `AsyncImage` with crossfade, memory cache, and clear placeholder / error fallbacks:
   ```kotlin
   AsyncImage(
       model = ImageRequest.Builder(LocalContext.current)
           .data(imageUrl)
           .crossfade(true)
           .build(),
       contentDescription = null,
       contentScale = ContentScale.Crop,
       modifier = Modifier.clip(RoundedCornerShape(8.dp))
   )
   ```

---

## 🎬 Animations & Transitions

- Use `AnimatedVisibility` with standard Material 3 enter/exit transitions (`fadeIn() + expandVertically()`).
- Use `Crossfade` or `AnimatedContent` for state-switching (Loading -> Success -> Empty).
- Target 60-120 fps on lower-end devices (3-4GB RAM).

---

## 🧩 Integrated Design Intelligence
- 🎨 **[ui-ux-pro-max](../skills/ui-ux-pro-max/SKILL.md)**: Consult the `jetpack-compose` stack dataset (`.agent/skills/ui-ux-pro-max/data/stacks/jetpack-compose.csv`) for 50+ Jetpack Compose design rules, composable purity, state hoisting, and anti-patterns.

