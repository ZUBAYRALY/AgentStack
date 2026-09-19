---
description: Project Initialization & Ideation Protocol (Brainstorming, Spec Definition & Gated Handoff)
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
│  - Begin development according to webstack.md protocols!    │
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
1. Set the Status in `project.md` to `FINALIZED & ACTIVE`.
2. Populate **[PRD.md](./PRD.md)** with the agreed mission, user personas, and feature modules.
3. Populate **[Architecture.md](./Architecture.md)** with the selected tech stack, system diagram, and folder layout.
4. Populate **[Phases.md](./Phases.md)** with the project-specific phase roadmap.
5. Update **[Memory.md](./Memory.md)** with the project name, active phase, and initial state.
6. Acknowledge to the user that all workflow documents are synchronized and ask for approval to begin Phase 1 code implementation.

---

## 🔍 MODE B: Existing Project Audit & Workflow Adoption Protocol

When `/project` is run in an **existing codebase** (a project you have already built or partially built), or when the user says *"Scan this existing project"* / *"Adopt workflow on this project"*:

```
┌─────────────────────────────────────────────────────────────┐
│  STEP 1: Autonomous Codebase Audit                          │
│  - Inspect package.json / requirements.txt / configs        │
│  - Scan directory structure (frontend, backend, schemas)    │
│  - Identify implemented database models & tables            │
│  - Identify implemented API routes, controllers & services  │
│  - Identify implemented frontend pages, components & routes │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│  STEP 2: Auto-Synchronize All Workflow Files                │
│  - Architecture.md: Populate with actual tech stack & tree  │
│  - PRD.md: Reconstruct active feature modules & models      │
│  - done.md: Mark all existing working endpoints & pages [x] │
│  - Phases.md: Check off completed phases [x] and set the    │
│    exact current active phase milestone                     │
│  - Memory.md: Log runtime status, active state, & focus     │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│  STEP 3: Executive Briefing & Actionable Next Steps         │
│  - Report back to user with a complete status audit:        │
│    "Project scanned successfully! Found X pages, Y APIs.    │
│     All workflow files are updated. We are at Phase Z.      │
│     What should we build or fix next?"                      │
└─────────────────────────────────────────────────────────────┘
```

### Existing Project Audit Checklist:
1. **Tech Stack Detection**:
   - Determine exact frontend (React, Next.js, Vue, Tailwind, etc.) and backend (Express, Fastify, Python, etc.).
   - Determine database engine (PostgreSQL, MySQL, MongoDB, SQLite) and ORM (Prisma, Drizzle, etc.).
2. **Feature Inventory**:
   - List every working page in `frontend/src/pages/`.
   - List every working API endpoint in `backend/src/routes/` or controllers.
3. **Synchronization**:
   - Immediately update **[Architecture.md](./Architecture.md)**, **[PRD.md](./PRD.md)**, **[done.md](./done.md)**, **[Phases.md](./Phases.md)**, and **[Memory.md](./Memory.md)**.
4. **Immediate Readiness**:
   - System is now fully primed with persistent context, ready to continue building seamlessly without breaking existing code.

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
- **Frontend**: `[e.g., React (Vite) / Next.js / Vue + TailwindCSS]`
- **Backend**: `[e.g., Node.js (Express / Fastify) / Python (FastAPI)]`
- **Database**: `[e.g., PostgreSQL / MySQL / MongoDB + Prisma ORM]`
- **Auth / Security**: `[e.g., JWT / NextAuth / Session-based / Direct Access]`
- **Key Third-Party APIs / Tools**: `[e.g., Stripe, SendGrid, AI APIs, etc.]`

### 4. MVP Feature Breakdown (Agreed Must-Haves)
- **Feature 1**: `[Description & key user interactions]`
- **Feature 2**: `[Description & key user interactions]`
- **Feature 3**: `[Description & key user interactions]`
- **Feature 4**: `[Description & key user interactions]`

### 5. Nice-to-Have / Future Scope (Post-MVP)
- `[Feature ideas deferred to later sprints]`

### 6. Discussion Notes & Open Questions
- `[Any pending decisions, user preferences, or questions currently being discussed]`
