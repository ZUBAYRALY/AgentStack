<div align="center">
  <h1>⚡ AgentStack</h1>
  <p><strong>The Universal Multi-Ecosystem Autonomous AI Developer Framework</strong></p>
  <p>Production-grade engineering protocols, design intelligence, fluid animations, technical SEO, and defensive security for Web (Next.js/React), Python (FastAPI/AsyncIO), and Android (Kotlin/Jetpack Compose).</p>

  <p>
    <a href="#-quick-start"><img src="https://img.shields.io/badge/Antigravity-Ready-8A2BE2?style=for-the-badge&logo=google" alt="Antigravity Ready" /></a>
    <a href="#-quick-start"><img src="https://img.shields.io/badge/Claude%20Code-Compatible-D97706?style=for-the-badge&logo=anthropic" alt="Claude Code Compatible" /></a>
    <a href="#-quick-start"><img src="https://img.shields.io/badge/Cursor%20%26%20Windsurf-Supported-2563EB?style=for-the-badge" alt="Cursor & Windsurf" /></a>
    <a href="#-license"><img src="https://img.shields.io/badge/License-MIT-emerald?style=for-the-badge" alt="License" /></a>
  </p>
</div>

---

## 🌟 What is AgentStack?

**AgentStack** transforms standard AI coding assistants into an elite **Principal Full-Stack Architect + Staff Android Lead + Python Backend Specialist + UI/UX Designer + Technical SEO Auditor** working in sync inside your workspace.

Instead of generic prompts, hallucinations, or fragile snippets, AgentStack establishes:
- **Strict, Non-Negotiable Engineering Protocols** (Zero dummy UI, honest 4-state lifecycle, UDF, async-first).
- **Persistent Self-Healing Memory** (`Memory.md`, `done.md`, `Phases.md`) updated automatically without prompt reminders.
- **Multi-Ecosystem Skills Suite** spanning modern Web, Python, Android, Motion, Design, and SEO.

---

## ✨ Core Pillars & Capabilities

### 1. 🚦 Gated Onboarding & Adoption (`/project`)
- **Stage 1 (Brainstorming Sandbox)**: Refine specs, identify personas, and select tech stacks in `project.md`. The AI is strictly barred from writing premature code.
- **Stage 2 (Kickoff Trigger)**: Upon your confirmation, specs are automatically propagated across `PRD.md`, `Architecture.md`, `Phases.md`, and `Memory.md` to begin execution.
- **Existing Project Adoption**: Drop `.agent/` into any active codebase and run `/project` — the AI autonomously audits routes, models, packages, and marks finished tasks in `done.md`.

### 2. 🌐 WebStack (`webstack`)
- **Tech Stack**: Next.js, React 18+, TypeScript, Tailwind CSS, Node.js/Express, Prisma ORM, PostgreSQL.
- **Honest States Mandate**: Every component explicitly handles `Loading`, `Empty`, `Error (with Retry)`, and `Content`. Zero dummy metrics or simulated data.
- **End-to-End Persistence**: Success is never reported unless changes pass through API -> Service -> Database -> UI.

### 3. 🐍 Modern Python & FastAPI (`python`)
- **Tech Stack**: Python 3.11+, FastAPI, Pydantic v2, AsyncIO, SQLAlchemy 2.0 (async), Alembic, Pytest.
- **Clean Layered Architecture**: Strict separation between `Routers` (HTTP/Pydantic), `Services` (Business logic & transactions), and `Repositories` (SQLAlchemy).
- **Strict Typing & Async-First**: Fully annotated signatures (PEP 484) and non-blocking I/O across every endpoint.

### 4. 🤖 Expert Android & Jetpack Compose (`droid`)
- **Tech Stack**: Kotlin, Jetpack Compose, Material 3, Clean Architecture, Coroutines, StateFlow, Room, Retrofit, Hilt.
- **Unidirectional Data Flow (UDF)**: Single immutable `UiState` down, events up via typed lambdas.
- **Zero-Jank Budget**: 60-120fps smooth performance, stable keys in `LazyColumn`, lifecycle-aware state collection (`collectAsStateWithLifecycle`), and Baseline Profiles.

### 5. 🎯 UI/UX Design Intelligence (`ui-ux-pro-max`)
- **67+ UI Styles**: Minimal, Clean Dark, Glassmorphism, Brutalism, Neo-Brutalism, Modern SaaS.
- **96+ Accessible Color Palettes**: Contrast-compliant tokens for light and OLED dark modes.
- **57+ Google Font Pairings**: Curated typography scales across different industry verticals.
- **CLI Query Engine**: Integrated Python search CLI for automated design token lookup.

### 6. 🪄 Tactile Spring Micro-Interactions (`motion`)
- Powered by `motion/react` (Motion 12).
- **Spring Physics**: Natural tactile feedback on clickables (`whileHover={{ scale: 1.02 }}`, `whileTap={{ scale: 0.98 }}`).
- **Smooth Exits**: Modal, toast, and drawer exit animations orchestrated via `<AnimatePresence>`.
- **Layout Morphing**: Sliding indicators and tabs with `layoutId` and full `prefers-reduced-motion` compliance.

### 7. 🔍 Universal Technical SEO & AEO (`seo`)
- Powered by the Claude-SEO engine with **24 specialized sub-skills**.
- **Automated Validation**: Semantic HTML enforcement, single `<h1>`, Schema.org JSON-LD generation, XML sitemaps, OpenGraph metadata, and Core Web Vitals optimization.
- **AI Search Ready (GEO/AEO)**: Optimized for AI Overviews, ChatGPT Search, and Perplexity retrieval.

### 8. 🛡️ Defensive Security by Design
- **Zero Raw Injection**: 100% Parameterized queries across Prisma and SQLAlchemy.
- **Tenant Scoping**: All database reads/writes strictly verified against tenant and user context.
- **XSS & SSRF Hardening**: Raw innerHTML strictly prohibited; crawlers restricted from private IP spaces.

### 9. 🧠 Immortal Persistent Memory
- **[Memory.md](.agent/workflows/Memory.md)**: Real-time active focus, server ports, and runtime context.
- **[done.md](.agent/workflows/done.md)**: Cumulative, immutable audit log of verified endpoints, models, and UI views.
- **[Phases.md](.agent/workflows/Phases.md)**: Structured 7-phase build checklist updated automatically upon task completion.

---

## 📂 Repository Architecture

```
.
├── .agent/
│   ├── skills/
│   │   ├── droid/                # Expert Android (Jetpack Compose, M3, Room, Hilt)
│   │   ├── motion/               # Tactile Micro-Interactions (Springs, Gestures, Exits)
│   │   ├── python/               # Modern Python (FastAPI, AsyncIO, SQLAlchemy 2.0)
│   │   ├── seo/                  # Technical SEO Suite (24 Sub-skills, Schemas, GEO)
│   │   ├── ui-ux-pro-max/        # Design Intelligence (67+ Styles, 96 Palettes, Fonts)
│   │   └── webstack/             # Full-Stack Web (Next.js, React, Node, Express, Prisma)
│   └── workflows/
│       ├── project.md            # /project Gated Ideation & Adoption Protocol
│       ├── webstack.md           # Master Full-Stack Protocol
│       ├── webstack-frontend.md  # Web Frontend Standards & Component Design
│       ├── webstack-backend.md   # Web Backend, Validation & Database Mandates
│       ├── python.md             # Python Master Protocol
│       ├── python-architecture.md# Python Clean Layered Architecture
│       ├── python-api.md         # FastAPI Endpoints & Pydantic Serialization
│       ├── droid.md              # Android Master Protocol & Performance Budgets
│       ├── droid-architecture.md # Android Clean Architecture, MVVM/MVI, Room, Hilt
│       ├── droid-ui.md           # Jetpack Compose UI & Material 3 Guidelines
│       ├── baseline-profile.md   # Baseline Profiles & Benchmark Optimization
│       ├── Rules.md              # Universal Non-Negotiable Boundaries
│       ├── Architecture.md       # Full-Stack System Flow & Directory Layout
│       ├── Design.md             # OLED Dark & Light Theme System Tokens
│       ├── PRD.md                # Modular Product Requirements Document
│       ├── Phases.md             # 7-Phase Development Roadmap
│       ├── Memory.md             # Real-Time Context & Runtime Tracker
│       └── done.md               # Cumulative Completed Tasks Audit Log
├── LICENSE                       # MIT License
├── README.md                     # Framework Overview
└── UserGuide.md                  # Comprehensive Step-by-Step Manual
```

---

## 🚀 Quick Start

### 1. Clone or Download
```bash
git clone https://github.com/ZUBAYRALY/AgentStack.git
```

### 2. Drop into Any Project
Copy the `.agent/` folder into your project root:
```bash
# Linux/macOS
cp -r AgentStack/.agent /path/to/your-project/

# Windows PowerShell
Copy-Item -Recurse -Force AgentStack\.agent \path\to\your-project\
```

### 3. Launch Your Coding Agent
Open the project in **Google Antigravity IDE**, **Claude Code**, or **Cursor**.

---

## 🛠️ Usage Workflows

### Starting a New Project
Type in your chat:
```bash
/project
```
> The agent starts in **Stage 1 Brainstorming Sandbox**. Discuss requirements and tech stacks safely without premature code generation. When ready, tell the agent: *"Specs finalized, start implementation!"*

### Adopting an Existing Codebase
Paste `.agent` into your existing repo and prompt:
> *"Audit this project and adopt AgentStack workflow."*
> 
> The AI scans packages, routes, database models, and components, updates `Architecture.md` and `done.md`, and positions `Phases.md` at your current milestone.

### Multi-Stack Selection
AgentStack automatically adapts based on your stack:
- **Full-Stack Web**: Leverages `webstack`, `ui-ux-pro-max`, `motion`, and `seo`.
- **Python Backend**: Leverages `python` with async FastAPI, SQLAlchemy, and Pydantic v2.
- **Android Native**: Leverages `droid` with Jetpack Compose, Material 3, and Room.

---

## 📖 Complete Documentation

For detailed guides, code templates, and workflow walk-throughs, check out the **[User Guide (UserGuide.md)](UserGuide.md)**.

---

## ❤️ Support the Developer

If you find **AgentStack** valuable for your daily development and wish to support future updates, you can buy me a coffee!

- **PayPal:** [Donate via PayPal](https://www.paypal.com/paypalme/zubayrop)
- **NayaPay:** `zubayr@nayapay`
- **USDT (Binance BEP20):** `0xeb0aa1a7b9704ef876c8c9f2cd65b8e989c25249`

---

## ⚖️ License

Distributed under the **MIT License**. Free for personal, commercial, and open-source use. See [LICENSE](LICENSE) for details.

<div align="center">
  <sub>Crafted with passion by <strong>Zubayr Aly</strong></sub>
</div>
