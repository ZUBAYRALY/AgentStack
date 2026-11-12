---
name: phases
description: Universal multi-phase project build order and development roadmap template with automatic AI progress tracking.
user-invocable: true
argument-hint: "[phase-number-or-milestone]"
---

# 🗺️ Project Build Order & Development Roadmap (Phases.md)

**Project Name**: `[Project Name]`  
**Current Active Phase**: `Phase 1 — Foundation & Project Setup`  
**Reference Specification**: `[prd](../prd/SKILL.md)` | `[architecture](../architecture/SKILL.md)` | `[webstack](../webstack/SKILL.md)` | `[droid](../droid/SKILL.md)` | `[python](../python/SKILL.md)`

---

## 🏗️ Universal Development Phases (WebStack, Droid & Python)

### Phase 1 — Foundation & Project Setup
- [ ] Initialize repository structure and configuration (`package.json` for Web, `build.gradle.kts` for Android, or `pyproject.toml` / `.venv` for Python).
- [ ] Configure frontend tooling / styling (Tailwind CSS for Web OR Material 3 & Jetpack Compose for Android).
- [ ] Configure backend runtime / entry point (FastAPI `app/main.py` OR Node.js OR mobile Application class & Hilt).
- [ ] Establish initial project documents (**[prd](../prd/SKILL.md)**, **[architecture](../architecture/SKILL.md)**, **[rules](../rules/SKILL.md)**).

### Phase 2 — Database Layer & Core Data Models
- [ ] Define data schema models and relationships (Prisma / SQL OR Room `@Entity` and `@Dao` OR Async SQLAlchemy 2.0 `Base`).
- [ ] Generate database migrations (Alembic / Prisma) and verify connection / local DB instance.
- [ ] Implement database client / repository interfaces.
- [ ] Add basic seed data or test entity verification.

### Phase 3 — Core APIs, Repositories & Services
- [ ] Create standardized request validation schemas / data contracts (Pydantic v2 schemas OR Zod).
- [ ] Build core controllers / route handlers (FastAPI `APIRouter` OR Express OR Retrofit & Android Repositories).
- [ ] Implement business logic / UseCases with strict error handling.
- [ ] Verify structured data flow (FastAPI / Web: JSON responses; Android: Flow / UiState emissions).

### Phase 4 — UI Design System & Shell
- [ ] Set up color tokens, typography, and dark/light theme engine in `design` (Web CSS / Android MaterialTheme).
- [ ] Build core application layout shell (Web: Sidebar + Header; Android: Scaffold + TopAppBar + NavigationBar).
- [ ] Build reusable UI components (Web components OR Android Composable primitives).
- [ ] Establish typed API client or HTTP interceptors.

### Phase 5 — Primary Feature Modules & User Flows
- [ ] Implement Primary Feature Module 1 UI and connect real data endpoints / ViewModels.
- [ ] Implement Primary Feature Module 2 UI and connect real data endpoints / ViewModels.
- [ ] Implement Primary Feature Module 3 UI and connect real data endpoints / ViewModels.
- [ ] Confirm full end-to-end persistence: UI → API / Repository → Database → UI.

### Phase 6 — States, Polish & Performance Optimization
- [ ] Implement Loading, Empty, Error (with retry), and Populated data states for every view.
- [ ] Responsive & device verification (Web: Desktop/Mobile; Android: 3-4GB RAM target, zero jank).
- [ ] Android specific: Set up **[baseline-profile](../baseline-profile/SKILL.md)** and verify startup/scroll benchmarks.
- [ ] Confirm zero dead buttons and zero broken interactive controls.

### Phase 7 — Final Verification & Delivery
- [ ] Verify zero console errors, zero compile warnings, and zero type mismatches.
- [ ] Audit application against **[rules](../rules/SKILL.md)**, **[webstack](../webstack/SKILL.md)**, and **[droid](../droid/SKILL.md)**.
- [ ] Final sync of **[memory](../memory/SKILL.md)** and **[done](../done/SKILL.md)**.
- [ ] Confirm project is complete and ready for deployment / release.

---

## ⚡ Automatic AI Roadmap Tracking Protocol
1. As each milestone or task is completed, the AI must mark the corresponding item `[x]` in this file.
2. If the user introduces new feature requirements, add them to the appropriate Phase or create a dedicated phase.
3. Keep the **Current Active Phase** at the top of this document synchronized with actual project progress.
