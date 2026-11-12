# 📖 AgentStack — Complete User Guide

Welcome to the **AgentStack** comprehensive user guide. This document details how to initialize, configure, and operate the autonomous multi-ecosystem workflow and skills framework across Web, Python, and Android development.

---

## 📑 Table of Contents
1. [Overview & Core Philosophy](#1-overview--core-philosophy)
2. [Installation & Setup](#2-installation--setup)
3. [Starting a Fresh Project (`/project`)](#3-starting-a-fresh-project-project)
4. [Adopting an Existing Codebase](#4-adopting-an-existing-codebase)
5. [Ecosystem Protocols & Workflows](#5-ecosystem-protocols--workflows)
   - [Full-Stack Web (`webstack`)](#full-stack-web-webstack)
   - [Modern Python & FastAPI (`python`)](#modern-python--fastapi-python)
   - [Android & Jetpack Compose (`droid`)](#android--jetpack-compose-droid)
6. [The Companion Skills Engine](#6-the-companion-skills-engine)
   - [UI/UX Pro Max (Design Intelligence)](#uiux-pro-max-design-intelligence)
   - [Motion (Tactile Spring Animations)](#motion-tactile-micro-interactions)
   - [Claude-SEO (Technical SEO & AEO)](#claude-seo-technical-seo--aeo)
7. [Defensive Security by Design](#7-defensive-security-by-design)
8. [Persistent Memory & Task Audit Protocol](#8-persistent-memory--task-audit-protocol)
9. [Maintenance & Updating Skills](#9-maintenance--updating-skills)
10. [Support the Developer](#10-support-the-developer)

---

## 1. Overview & Core Philosophy

**AgentStack** solves the key frustrations developers experience with AI coding assistants:
- **No Hallucinations / Fake Data**: All UI elements connect to real database models or present explicit empty states. Hardcoded dummy metrics are strictly forbidden.
- **Strict Two-Stage Gating**: Eliminates impulsive AI coding before architectural and feature specs are fully agreed upon.
- **Multi-Ecosystem Specialization**: Dedicated architectures and conventions for Web (Next.js/React), Python (FastAPI/SQLAlchemy), and Android (Kotlin/Compose).
- **Autonomous Multi-Layer Standards**: Visual styling, tactile micro-interactions, technical SEO, and defense-in-depth security are executed automatically.
- **Self-Healing Persistent Memory**: Context and finished tasks are synchronized across every step in `Memory.md`, `done.md`, and `Phases.md`.

---

## 2. Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/ZUBAYRALY/AgentStack.git
```

### Option A: Global Command Install (Windows, macOS, Linux)
Run a single command to install all **25 skills** into your global Antigravity config (`~/.gemini/config/skills/`) so they work across every project automatically:

```powershell
# Windows (PowerShell)
New-Item -ItemType Directory -Force "$env:USERPROFILE\.gemini\config\skills" | Out-Null; Copy-Item -Recurse -Force "AgentStack\.agent\skills\*" "$env:USERPROFILE\.gemini\config\skills\"
```

```bash
# macOS & Linux (Bash / Zsh)
mkdir -p ~/.gemini/config/skills && cp -R AgentStack/.agent/skills/* ~/.gemini/config/skills/
```

### Option B: Install into a Specific Project Workspace
Copy the `.agent/` directory into your project root:

```powershell
# Windows (PowerShell)
Copy-Item -Recurse -Force "AgentStack\.agent" "D:\Path\To\MyProject\"
```

```bash
# macOS & Linux
cp -R AgentStack/.agent /path/to/my-project/
```

### Option C: Using Legacy Workflows (`legacy-workflows/`)
If you prefer the classic `.agent/workflows/*.md` + `.agent/skills/` structure from AgentStack v1, the complete v1 stack is preserved inside the **`legacy-workflows/`** directory:

```powershell
# Windows (PowerShell)
New-Item -ItemType Directory -Force "D:\Path\To\MyProject\.agent" | Out-Null; Copy-Item -Recurse -Force "AgentStack\legacy-workflows\*" "D:\Path\To\MyProject\.agent\"
```

```bash
# macOS & Linux
mkdir -p /path/to/my-project/.agent && cp -R AgentStack/legacy-workflows/* /path/to/my-project/.agent/
```

---

## 3. Starting a Fresh Project (`/project`)

When initiating a project from scratch, type:
```bash
/project
```

### Stage 1: Brainstorming & Ideation (Sandbox Mode)
- The AI initializes the brainstorming session inside `project.md`.
- Freely discuss goals, feature requirements, user personas, and target platforms.
- **Strict Gating Rule**: During Stage 1, the AI is **strictly prohibited** from generating application code or modifying core tracking files (`PRD.md`, `Architecture.md`, `Phases.md`, `Memory.md`).

### Stage 2: Kickoff Trigger
When you are ready to start coding, give the trigger:
> *"Specs finalize hain, kaam shuru karo!"* or *"Specs finalized, begin Phase 1!"*

The AI autonomously:
1. Translates requirements into modular epics in **`PRD.md`**.
2. Establishes directory structure, data models, and system flows in **`Architecture.md`**.
3. Creates a 7-phase implementation checklist in **`Phases.md`**.
4. Initializes runtime ports and focus tracking in **`Memory.md`**.
5. Begins writing foundation code for Phase 1.

---

## 4. Adopting an Existing Codebase

To bring AgentStack into an existing application, simply run `/project` or prompt:
> *"Audit this existing project and adopt AgentStack workflow."*

### Autonomous 3-Step Audit:
1. **Codebase Scan**:
   - Inspects package definitions (`package.json`, `pyproject.toml`, `requirements.txt`, `build.gradle.kts`).
   - Maps out database schemas (Prisma, SQLAlchemy, Room).
   - Enumerates implemented API endpoints, controllers, and services.
   - Discovers frontend views, navigation routes, and Composables.
2. **Auto-Synchronization**:
   - Updates **`Architecture.md`** with the detected directory layout and tech stack.
   - Reconstructs **`PRD.md`** around existing capabilities.
   - Marks verified working endpoints and views as `[x]` in **`done.md`**.
   - Identifies completed phases in **`Phases.md`** and aligns the active phase indicator.
   - Records runtime ports, server environments, and database URLs in **`Memory.md`**.
3. **Executive Briefing**:
   - Delivers a concise status report: *"Audit complete! Detected 14 routes and 8 models. Currently at Phase 4. What would you like to build or optimize next?"*

---

## 5. Ecosystem Protocols & Skills

AgentStack features specialized, production-hardened skills for major engineering environments:

### Full-Stack Web (`/webstack`)
- **Governing Skills**: `webstack`, `webstack-frontend`, `webstack-backend`.
- **Frontend Standards**:
  - React 18+ and Next.js (App Router preferred).
  - Tailwind CSS with OLED dark and crisp light theme tokens (`design`).
  - Tactile micro-interactions on all interactive elements via `motion/react`.
  - Semantic HTML landmarks (`<main>`, single `<h1>`, `<header>`, `<nav>`).
- **Backend Standards**:
  - Express.js or Fastify with TypeScript.
  - Prisma ORM or Drizzle with PostgreSQL.
  - Strict input validation via Zod schemas.
  - Zero-dummy UI: All screens bind to real backend responses with explicit handling of `Loading`, `Empty`, `Error (with Retry)`, and `Content`.

### Modern Python & FastAPI (`/python`)
- **Governing Skills**: `python`, `python-architecture`, `python-api`.
- **Async-First Execution**:
  - Python 3.11+ using native `async` / `await` for all database, HTTP, and file I/O.
  - Blocking synchronous calls inside async event loops are strictly prohibited.
- **Clean Layered Architecture**:
  - **Routers (`api/v1/`)**: HTTP routing, status codes, and Pydantic v2 serialization.
  - **Services (`services/`)**: Business logic, domain rules, and transaction boundaries.
  - **Repositories (`repositories/`)**: Async SQLAlchemy 2.0 database queries and model mapping.
- **Type Safety**: Full PEP 484 type annotations on all signatures and union types (`str | None`).

### Android & Jetpack Compose (`/droid`)
- **Governing Skills**: `droid`, `droid-architecture`, `droid-ui`, `baseline-profile`.
- **Clean Architecture + UDF**:
  - Single immutable `UiState` flows down from ViewModel to Compose screens.
  - Events flow up via typed lambda callbacks (`onEvent: (TaskUiEvent) -> Unit`).
  - One-off navigation and snackbar events use `Channel<UiNavEvent>` with `receiveAsFlow()`.
- **Performance & Zero Jank**:
  - Lifecycle-aware state collection via `collectAsStateWithLifecycle()`.
  - Stable keys for all virtualized lists (`LazyColumn(items, key = { it.id })`).
  - Baseline Profiles and Macrobenchmark automation for instantaneous app startup.
- **Persistence & Networking**:
  - Single Source of Truth (SSOT): Room database `Flow` drives the UI.
  - Retrofit + OkHttp with Coroutines for backend communication.
  - Hilt dependency injection for clean modularization.

---

## 6. The Companion & Productivity Skills Engine

### UI/UX Pro Max (`/ui-ux-pro-max`)
Located in `.agent/skills/ui-ux-pro-max/` (powered by **[nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)**):
- **67+ Curated UI Styles** (Minimal, Clean Dark, Glassmorphism, Brutalism, Flat, Modern SaaS).
- **96 Accessible Color Palettes** with WCAG contrast verification.
- **57 Google Font Pairings** tailored to SaaS, Fintech, E-Commerce, DevTools, and Mobile (`jetpack-compose` stack included).
- **Search CLI**:
  ```bash
  python .agent/skills/ui-ux-pro-max/scripts/search.py "<domain> <industry> <keywords>" --design-system
  ```

### Motion (`/motion`)
Located in `.agent/skills/motion/` (powered by **[motiondivision/motion](https://github.com/motiondivision/motion)** — `motion/react`):
- **Spring Feedback**: Tactile physics on all interactive elements (`whileHover={{ scale: 1.02 }}`, `whileTap={{ scale: 0.98 }}`).
- **Exit Orchestration**: Smooth modal, drawer, and notification exit transitions via `<AnimatePresence>`.
- **Layout Morphing**: Sliding indicators and tabs with `layoutId`.
- **Accessibility**: Strict compliance with `prefers-reduced-motion`.

### Technical SEO & GEO (`/seo`)
Located in `.agent/skills/seo/` (powered by **[AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo)**):
- Comprehensive suite with **24 specialized sub-skills**.
- **Automated Schema Generation**: WebSite, Organization, Article, BreadcrumbList, and Product JSON-LD structured data.
- **Core Web Vitals**: Image dimension constraints and layout shift (CLS) prevention.
- **GEO / AI Engine Optimization**: Structured markup designed for Google AI Overviews, ChatGPT Search, and Perplexity discovery.

### Natural Human Writing (`/human-writing`)
Located in `.agent/skills/human-writing/`:
- Eliminates robotic AI clichés, filler openings, trailing fake analysis, inflated language, and em dashes.
- Adapts naturally to technical documentation, WhatsApp/chat replies, emails, product copy, and text rewrites.

### Freelancing, Code Migration & Release Automation
- **`/freelancing` (`.agent/skills/freelancing/`)**: Profile optimizer and high-converting proposal generator for Upwork, Fiverr, and Behance.
- **`/exonalgos` (`.agent/skills/exonalgos/`)**: Intelligent component and feature adaptation protocol for migrating code across repositories.
- **`/github-release` (`.agent/skills/github-release/`)**: Closed-source Android APK release packager with proprietary EULA licensing.

---

## 7. Defensive Security by Design

Governed by `rules`, `webstack-backend`, `droid-architecture`, and `python-architecture`:
- **Injection Defense**: 100% Parameterized queries across Prisma, SQLAlchemy, and Room. String interpolation in queries is strictly prohibited.
- **Cross-Site Scripting (XSS)**: Direct assignment to `dangerouslySetInnerHTML` is prohibited unless sanitized with DOMPurify.
- **Authorization & Multi-Tenancy**: Every data mutation verifies tenant and user ownership (`where: { id, tenantId }`).
- **HTTP Hardening**: Content Security Policy (CSP), rate limiting, and private IP range blocking against SSRF attacks.
- **Secret Isolation**: Zero hardcoded secrets; environment variables reside strictly in backend `.env` files or encrypted mobile storage (`EncryptedSharedPreferences`).

---

## 8. Persistent Memory & Task Audit Protocol

AgentStack runs on the **Automatic Sync Protocol**:
- After completing every endpoint, screen, migration, bug fix, or milestone, the AI automatically updates:
  - **`memory` (`Memory.md`)**: Real-time system status, runtime telemetry, and active focus.
  - **`done` (`done.md`)**: Cumulative checklist of all verified endpoints and components.
  - **`phases` (`Phases.md`)**: Checks off finished roadmap items.
- You never need to prompt the AI to remember what it just built.

---

## 9. Maintenance & Updating Skills

All skills live directly in `.agent/skills/` for maximum portability, version stability, and zero network breakages.

To update skills in the future:
- **UI/UX Pro Max**: Run `npx uipro-cli update` or update the Python script datasets.
- **SEO Suite**: Refresh the sub-skills from `AgriciDaniel/claude-seo`.
- **Motion**: Upgrade via `npm install motion@latest`.

---

## 10. Support the Developer

If you find **AgentStack** valuable for your workflow and would like to support its ongoing open-source development, you can buy me a coffee!

- **PayPal:** [Donate via PayPal](https://www.paypal.com/paypalme/zubayrop)
- **NayaPay:** `zubayr@nayapay`
- **USDT (Binance BEP20):** `0xeb0aa1a7b9704ef876c8c9f2cd65b8e989c25249`

---

<div align="center">
  <sub>AgentStack — Built for developers who demand perfection.</sub>
</div>
