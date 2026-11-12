---
description: Universal Frontend Web Development Protocol
---

# 🎨 Frontend Web Development Protocol

**Project Tech Stack**: `[Configure: e.g., React / Next.js / Vue + TailwindCSS + Lucide Icons + Framer Motion]`

---

## 📚 Essential Documents
Before building or modifying frontend code, always review:
- 📄 **[PRD.md](./PRD.md)**: UI requirements, target user flows, and page specifications.
- 🎨 **[Design.md](./Design.md)**: Color system, theme tokens (dark/light), typography, and component standards.
- 🏗️ **[Architecture.md](./Architecture.md)**: Routing structure, layout hierarchy, and state management.
- 📜 **[Rules.md](./Rules.md)**: Strict execution constraints and boundaries.
- 🧠 **[Memory.md](./Memory.md)**: Current active pages and UI state.
- ✅ **[done.md](./done.md)**: List of already completed frontend modules.

---

## 🧩 Integrated Frontend Skills
- 🪄 **[motion](../skills/motion/SKILL.md)**: Modern animation protocol (`motion/react`), spring physics, micro-interactions, layoutId animations, and WCAG reduced motion compliance.
- 🎨 **[ui-ux-pro-max](../skills/ui-ux-pro-max/SKILL.md)**: Design intelligence, 50 styles, 21 palettes, 50 font pairings, and stack guidelines (`nextjs`, `react`, `html-tailwind`, `shadcn`).
- 🔍 **[seo](../skills/seo/SKILL.md)**: Web-only technical SEO audit, Schema.org structured data, XML sitemaps, Open Graph meta tags, and Core Web Vitals optimization.

---

## 🎨 UI & Design Consistency (Production SaaS Standard)
- **Real Data Mandate**: Every number, card, table row, and chart must render real data from the backend/database or show an explicit empty state. Zero fake/dummy metrics.
- **Design Restraint**: Modern, clean, compact typography; purposeful whitespace; elegant borders and soft shadows. Avoid tacky glows, cartoonish radii, or unnecessary AI sparkles.
- **Unified Color Palette**: Adhere strictly to the defined palette in **[Design.md](./Design.md)** with complete Dark Mode & Light Mode support.
- **Reusable Component Hierarchy**: Centralize all reusable UI components (e.g. `Button`, `DataTable`, `Badge`, `Modal`, `Drawer`, `Toast`, `StateContainer`). Do not duplicate ad-hoc styling.

---

## ⚡ Performance & State Mandate
- **All 4 Core States Covered**:
  1. **Loading State**: Clean skeletons or spinners while data is fetching.
  2. **Empty State**: Clear, informative messaging with a call-to-action when data is empty.
  3. **Error State**: User-friendly error message with retry options.
  4. **Populated State**: Compact, responsive presentation of real data.
- **Full Responsiveness**: Verify responsive layouts across Mobile (<640px), Tablet (640-1024px), Laptop (1024-1440px), and Desktop (>1440px) with zero horizontal overflow.
- **Zero Dead Buttons**: Every button, link, or interactive element must trigger an actual handler, modal, or backend mutation.

---

## 🚫 Frontend Strict Execution Rules
1. Touch **ONLY** the targeted frontend component, page, or style file.
2. Provide the **FULL** updated file content without truncating code.
3. 🚫 **Zero code comments** or explanations inside code files.
4. 🚫 Do **NOT** execute `npm run build` or automated browser tests without explicit user instruction.
5. **AUTOMATIC SYNC**: Update **[Memory.md](./Memory.md)** and **[done.md](./done.md)** immediately after adding or modifying frontend pages.
