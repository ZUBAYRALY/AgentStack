# 📖 AgentStack — Complete User Guide

Welcome to the **AgentStack** comprehensive user guide. This document details how to initialize, configure, and operate the autonomous workflow and skills framework across any web development project.

---

## 📑 Table of Contents
1. [Overview & Core Philosophy](#1-overview--core-philosophy)
2. [Installation & Setup](#2-installation--setup)
3. [Starting a Fresh Project (`/project`)](#3-starting-a-fresh-project-project)
4. [Adopting an Existing Codebase](#4-adopting-an-existing-codebase)
5. [The Multi-Disciplinary Skills Engine](#5-the-multi-disciplinary-skills-engine)
   - [UI/UX Pro Max](#uiux-pro-max-design-intelligence)
   - [Motion (Spring Animations)](#motion-tactile-micro-interactions)
   - [Claude-SEO (Technical SEO & Schemas)](#claude-seo-technical-seo--aeo)
6. [Defensive Security by Design](#6-defensive-security-by-design)
7. [Persistent Memory & Task Audit Protocol](#7-persistent-memory--task-audit-protocol)
8. [Maintenance & Updating Skills](#8-maintenance--updating-skills)

---

## 1. Overview & Core Philosophy

**AgentStack** solves the core problems developers face when using AI coding assistants:
- **No Hallucinations / Fake Data**: Elements render real database data or explicit empty states.
- **Strict Two-Stage Gating**: Prevents the AI from impulsively writing code before requirements and architecture are fully locked.
- **Autonomous Multi-Layer Standards**: Visual design, micro-interactions, technical SEO, and defensive security are applied automatically without having to prompt each one individually.
- **Self-Healing Persistent Memory**: Tracks active progress across turns, preserving context indefinitely.

---

## 2. Installation & Setup

### For a New Project:
1. Initialize a new folder or repository for your project.
2. Copy the `.agent/` folder into your project root:
   ```bash
   cp -r /path/to/AgentStack/.agent /path/to/my-new-project/
   ```
3. Open the folder in **Google Antigravity IDE**, **Claude Code**, or **Cursor**.

### For an Existing Project:
1. Paste the `.agent/` folder into your existing repository root.
2. See [Adopting an Existing Codebase](#4-adopting-an-existing-codebase) below.

---

## 3. Starting a Fresh Project (`/project`)

When starting a project from scratch, invoke the slash command:
```bash
/project
```

### Stage 1: Brainstorming & Ideation (Sandbox Mode)
- The AI will welcome you to the brainstorming session.
- You can freely discuss ideas, target audience, feature requirements, and preferred tech stacks.
- **Gating Rule**: During Stage 1, the AI is **strictly forbidden** from writing code or editing `PRD.md`, `Architecture.md`, `Phases.md`, or `Memory.md`. All notes remain isolated in `project.md`.

### Stage 2: Kickoff Trigger
When you are satisfied with the discussion, give the explicit command:
> *"Specs finalize hain, kaam shuru karo!"* or *"Let's build this!"*

The AI will automatically:
1. Populate **`PRD.md`** with user personas and modular feature requirements.
2. Configure **`Architecture.md`** with tech stack diagrams and directory structure.
3. Establish **`Phases.md`** with a 7-phase build order.
4. Update **`Memory.md`** with active focus.
5. Begin executing Phase 1 foundation code.

---

## 4. Adopting an Existing Codebase

If you drop `.agent/` into a project with existing code, simply run:
```bash
/project
```
*(Or prompt: "Scan this existing project and adopt AgentStack workflow.")*

### The Autonomous 3-Step Audit:
1. **Codebase Scan**:
   - Inspects `package.json` / `requirements.txt` to detect tech stacks (React, Next.js, Express, Prisma, Tailwind).
   - Scans database schemas to map models and relations.
   - Enumerate implemented API routes, controllers, and services.
   - Enumerates existing frontend pages and interactive views.
2. **Auto-Synchronization**:
   - Updates **`Architecture.md`** with your actual directory layout.
   - Reconstructs **`PRD.md`** based on implemented features.
   - Marks existing working endpoints and views as `[x]` in **`done.md`**.
   - Checks off finished phases in **`Phases.md`** and positions the **Current Active Phase** at your exact active milestone.
   - Sets runtime ports and active state in **`Memory.md`**.
3. **Executive Briefing**:
   - Returns a concise summary: *"Scan complete! Detected 12 pages and 18 API routes. We are currently at Phase 5. What should we build or fix next?"*

---

## 5. The Multi-Disciplinary Skills Engine

### UI/UX Pro Max (Design Intelligence)
Located in `.agent/skills/ui-ux-pro-max/`:
- Contains 67+ styles, 96 color palettes, 57 font pairings, and UX reasoning rules.
- **Autonomous Trigger**: When creating any UI, the AI queries the design database:
  ```bash
  python .agent/skills/ui-ux-pro-max/scripts/search.py "<product_type> <industry> <keywords>" --design-system
  ```
- Generates exact color tokens, Google Font pairings, and avoids layout anti-patterns.

### Motion (Tactile Micro-Interactions)
Located in `.agent/skills/motion/`:
- Powered by `motion/react`.
- **Spring Physics**: Buttons and clickables receive tactile physics feedback (`whileHover={{ scale: 1.02 }}`, `whileTap={{ scale: 0.98 }}`).
- **Smooth Exits**: Modals, drawers, and toasts use `<AnimatePresence>` for smooth exit animations.
- **Layout Animations**: Segmented controls and tab bars use `layoutId` for sliding indicators.
- **Reduced Motion**: Automatically complies with `prefers-reduced-motion`.

### Claude-SEO (Technical SEO & AEO)
Located in `.agent/skills/seo/`:
- Contains 24 sub-skills for technical SEO, schema, sitemaps, Core Web Vitals, and GEO/AEO.
- **Automatic Enforcement**:
  - Enforces semantic HTML with a single `<h1>` per page and proper `<main>`, `<header>`, `<nav>` landmarks.
  - Automatically generates optimized `<title>`, `<meta description>`, OpenGraph, and Twitter Cards.
  - Generates Schema.org JSON-LD structured data (WebSite, Organization, BreadcrumbList, Product).
  - Ensures images have descriptive `alt` tags and explicit dimensions to prevent CLS.

---

## 6. Defensive Security by Design

Governed by **`Rules.md`** and **`webstack-backend.md`**:
- **SQL / NoSQL Injection Defense**: 100% Parameterized ORM queries (Prisma/Drizzle); raw string concatenation is strictly banned.
- **XSS Defense**: `dangerouslySetInnerHTML` is prohibited unless sanitized via DOMPurify.
- **Broken Access Control**: Every read/write query strictly verifies tenant/user scoping (`where: { id, workspaceId }`).
- **HTTP Hardening**: Helmet CSP, secure headers, and strict CORS origin whitelisting.
- **SSRF Blocker**: Disallows crawlers from querying private IP ranges (`127.0.0.1`, `10.x`, `192.168.x`).
- **Secret Isolation**: All credentials and API keys are stored strictly in backend `.env` files.

---

## 7. Persistent Memory & Task Audit Protocol

AgentStack follows the **Automatic Sync Protocol**:
- After **every** feature, endpoint, bug fix, or milestone, the AI automatically updates:
  - **`Memory.md`**: Current system status, active focus, and runtime telemetry.
  - **`done.md`**: Cumulative checklist of all verified endpoints and components.
  - **`Phases.md`**: Checks off finished roadmap items.
- You never need to remind the AI to update its memory.

---

## 8. Maintenance & Updating Skills

All skills run locally in `.agent/skills/` for rock-solid stability and zero breaking changes.

To update skills in the future, simply ask the AI in chat:
- **Update UI/UX Pro Max**: Run `npx uipro-cli update`
- **Update SEO Suite**: Ask AI to pull the latest release from `AgriciDaniel/claude-seo`.
- **Update Motion**: Run `npm install motion@latest`.

---

## ❤️ Support the Developer

If you enjoy using **AgentStack** and would like to support its continued development and open-source releases, you can buy me a coffee!

- **PayPal:** [Donate via PayPal](https://www.paypal.com/paypalme/zubayrop)
- **NayaPay:** `zubayr@nayapay`
- **USDT (Binance BEP20):** `0xeb0aa1a7b9704ef876c8c9f2cd65b8e989c25249`

---

<div align="center">
  <sub>AgentStack — Built for developers who demand perfection.</sub>
</div>