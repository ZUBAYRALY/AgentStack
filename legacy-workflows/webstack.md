---
description: Universal Full-Stack Web Development Protocol (Master Rules)
---

# 🔐 WebStack Core Protocols

This is the **Master Protocol** for the Full-Stack Web Developer Agent. It defines the universal development framework, strict execution rules, and workflow standards across all projects.

---

## 📚 Core Context Reference Documents (MANDATORY)
Before executing any task, planning changes, or generating code, always consult the workflow repository documents:
1. 🚀 **[project.md](./project.md)**: Project Onboarding, Idea Discussion, & Gated Spec Handoff Protocol.
2. 📄 **[PRD.md](./PRD.md)**: Product Requirements Document (project purpose, features, user flows, and functional modules).
3. 🏗️ **[Architecture.md](./Architecture.md)**: System flow, tech stack, directory structure, and API architecture.
4. 📜 **[Rules.md](./Rules.md)**: Strict boundaries, banned practices, and execution constraints.
5. 🗺️ **[Phases.md](./Phases.md)**: Project build order, milestones, and development roadmap.
6. 🎨 **[Design.md](./Design.md)**: UI design tokens, theme palette (dark/light), typography, and component standards.
7. 🧠 **[Memory.md](./Memory.md)**: Current system state, active focus, and persistent progress tracker.
8. ✅ **[done.md](./done.md)**: Completed work audit log of verified features, endpoints, and models.

---

## 🔐 STRICT EXECUTION RULES (Metaprompt)

1. **AUTOMATIC MEMORY & AUDIT UPDATES (MANDATORY)**:
   - ⚡ **Rule**: After EVERY task, feature implementation, endpoint creation, bug fix, or milestone, the AI **MUST AUTOMATICALLY** update **[Memory.md](./Memory.md)**, **[done.md](./done.md)**, and **[Phases.md](./Phases.md)** with the latest exact state BEFORE concluding the turn.
   - 🚫 Do NOT wait for the user to remind or ask for memory updates.

2. **No Dummy UI / No Fake Data / Honest States**:
   - Every UI element must perform a real action, display real persisted database data, or show a clear, honest empty/disconnected state.
   - Never fabricate fake metrics, simulated rows, dummy charts, or fake notifications.
   - Clearly distinguish between Loading State, Empty State, Error State, and Populated Data State.

3. **No Fake Success**:
   - Never claim an operation succeeded unless the backend actually executed and persisted it:
     $$\text{UI} \longrightarrow \text{API} \longrightarrow \text{Service} \longrightarrow \text{Database/Storage} \longrightarrow \text{Persisted Result} \longrightarrow \text{UI}$$

4. **Targeted Edits**:
   - Touch **ONLY** the specific file, component, or endpoint requested by the user.
   - Do not make unrequested sweeping refactors across untouched code.

5. **Full Output**:
   - Always provide the **FULL** updated file when creating or replacing code.
   - Never use snippets, abbreviations, or placeholders like `// ... rest of code`.

6. **No Refactoring**:
   - Never modify or refactor unrelated logic unless explicitly requested by the user.

7. **Zero Code Comments**:
   - Do **NOT** include code comments, docstrings, or inline explanations inside code files.
   - Strip out existing comments if editing or rewriting files to maintain clean, production-grade code.

8. **No Unauthorized Automatic Commands / Testing**:
   - 🚫 Do NOT run build commands (`npm run build`, etc.), test runners, or browser automated testing subagents unless the USER explicitly requests it.

9. **Direct Access & Clean Navigation**:
   - Ensure the application loads cleanly and directly without broken redirects, auth traps, or infinite routing loops during development unless auth testing is requested.

10. **Behavioral Discipline**:
    - 🚫 No assumptions or wild guesses.
    - 🚫 Do not explain internal AI reasoning unless asked.
    - ✅ Follow user instructions and project specifications EXACTLY.

---

## 📱 Specialized Workflow Protocols
- 👉 **Frontend Specifics**: **[webstack-frontend.md](./webstack-frontend.md)**
- 👉 **Backend Specifics**: **[webstack-backend.md](./webstack-backend.md)**
- 👉 **Android Mobile Specifics**: **[droid.md](./droid.md)** (for Android Jetpack Compose projects)

---

## 🧩 Integrated Web Skills
- 🎨 **[ui-ux-pro-max](../skills/ui-ux-pro-max/SKILL.md)**: Web design systems, palettes, typography, and UX guidelines (`nextjs`, `react`, `html-tailwind`).
- 🪄 **[motion](../skills/motion/SKILL.md)**: Web animation intelligence, spring physics, and micro-interactions (`motion/react`).
- 🔍 **[seo](../skills/seo/SKILL.md)**: Technical SEO, Schema.org markup, XML sitemaps, and Core Web Vitals (Web exclusive).

---

## ✅ Confirmation
By proceeding with any task, you confirm: **"Yes, I understand the Universal WebStack WorkFlow."**