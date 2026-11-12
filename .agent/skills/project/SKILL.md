---
name: project
description: Project Initialization & Ideation Protocol (Brainstorming, Spec Definition & Gated Handoff)
user-invocable: true
argument-hint: "[project-name] [idea-or-brief]"
---

# 🚀 Project Onboarding & Discussion Protocol (`project.md`)

This workflow governs how the AI handles **new project onboarding**, **idea brainstorming**, and **controlled handoff** to development.

---

## 🛑 THE TWO-STAGE GATING RULE (CRITICAL)

When the user runs `/project` or introduces a new project idea, the AI **MUST** operate strictly according to these two distinct stages:

```
┌─────────────────────────────────────────────────────────────┐
│  STAGE 1: Discussion & Brainstorming (Sandbox Mode)         │
│  - Discuss project ideas, features & tech stack             │
│  - Suggest architecture & refinement                        │
│  - Keep ALL notes & draft specs inside project.md           │
│  🚫 STRICTLY FORBIDDEN: Do NOT touch PRD, Architecture,     │
│     Phases, Memory, or code files yet!                      │
└──────────────────────────────┬──────────────────────────────┘
                               │
            User explicitly says: "Kaam shuru karo",
            "Finalize specs", or "Start implementation"
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│  STAGE 2: Specification Propagation & Kickoff               │
│  - Automatically transfer specs from project.md into:       │
│    • PRD.md (Features, user flows, acceptance criteria)     │
│    • Architecture.md (Tech stack, diagrams, directories)    │
│    • Phases.md (Build milestones roadmap)                   │
│    • Memory.md (Project name, active focus, telemetry)      │
│  - Begin development according to webstack.md (Web),        │
│    droid.md (Android), or python.md (Python) protocols!     │
└─────────────────────────────────────────────────────────────┘
```

---

## 🎯 Stage 1: Discussion & Ideation Mode Rules

1. **Active Collaboration**:
   - Welcome the user to the new project brainstorming session.
   - Ask clarifying, high-value questions (Target audience, core MVP features, preferred tech stack, integrations).
   - Proactively suggest best practices, missing edge cases, and clean architecture recommendations.
2. **Containment in `project.md`**:
   - As ideas, features, and tech stacks are agreed upon, log and update them directly inside the **Active Project Draft** section of this file (`project.md`).
3. **No Premature File Updates**:
   - 🚫 **DO NOT** edit `PRD.md`, `Architecture.md`, `Phases.md`, `Memory.md`, or any project code while in Stage 1.
   - Even if the user asks *"yeh kaisa rahay ga?"* or shares an idea, keep the discussion in the chat and document it in `project.md` only.

---

## ⚡ Stage 2: Kickoff Trigger (When to Update Other Files)

The AI will transition from Stage 1 to Stage 2 **ONLY** when the user explicitly gives a kickoff confirmation, such as:
- *"Ab is par kaam shuru karo"*
- *"Specs finalize hain, files update kar do"*
- *"Start implementation / Project lock karo"*
- *"Let's build this"*

### Actions Taken Upon Kickoff:
1. Set the Status in `project` to `FINALIZED & ACTIVE`.
2. Populate **[prd](../prd/SKILL.md)** with the agreed mission, user personas, and feature modules.
3. Populate **[architecture](../architecture/SKILL.md)** with the selected tech stack, system diagram, and folder layout.
4. Populate **[phases](../phases/SKILL.md)** with the project-specific phase roadmap.
5. Update **[memory](../memory/SKILL.md)** with the project name, active phase, and initial state.
6. Acknowledge to the user that all project documents are synchronized and ask for approval to begin Phase 1 code implementation.

---

# 📋 Active Project Draft (Live Workspace)

*(This section is maintained during Stage 1 discussion and locked during Stage 2)*

### 1. Project Overview
- **Project Name**: `[Pending User Input]`
- **Status**: `DISCUSSING_IDEA` *(Options: `DISCUSSING_IDEA` | `FINALIZED & ACTIVE`)*
- **One-Liner / Tagline**: `[What does this project do in 1 sentence?]`
- **Target Audience / Users**: `[Who is going to use this?]`

### 2. Core Problem & Solution
- **The Problem**: `[What pain point or inefficiency exists?]`
- **Our Solution**: `[How does this software solve it?]`

### 3. Agreed Tech Stack
- **Target Platform**: `[Web (webstack.md) | Android Mobile (droid.md) | Python API/CLI (python.md) | Full-Stack]`
- **Frontend / Client**: `[e.g., React (Vite) / Next.js / Vue + TailwindCSS OR Android Kotlin + Jetpack Compose + Material 3]`
- **Backend / API / Runtime**: `[e.g., Python (FastAPI / Pydantic / AsyncIO) OR Node.js (Express / Fastify) / Ktor]`
- **Database / Local Storage**: `[e.g., PostgreSQL + Async SQLAlchemy / Alembic OR Prisma ORM OR Room DB (Android)]`
- **Architecture / State**: `[e.g., Clean Architecture (API/Service/Repo) OR MVVM/MVI + StateFlow OR Zustand/Context]`
- **Auth / Security**: `[e.g., JWT / OAuth2 / NextAuth / EncryptedSharedPreferences]`
- **Key Third-Party APIs / Tools**: `[e.g., httpx, Pydantic v2, Stripe, SendGrid, AI APIs, Coil, Retrofit, etc.]`

### 4. MVP Feature Breakdown (Agreed Must-Haves)
- **Feature 1**: `[Description & key user interactions]`
- **Feature 2**: `[Description & key user interactions]`
- **Feature 3**: `[Description & key user interactions]`
- **Feature 4**: `[Description & key user interactions]`

### 5. Nice-to-Have / Future Scope (Post-MVP)
- `[Feature ideas deferred to later sprints]`

### 6. Discussion Notes & Open Questions
- `[Any pending decisions, user preferences, or questions currently being discussed]`
