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
- 🎯 **[ui-ux-pro-max Skill](../skills/ui-ux-pro-max/SKILL.md)**: AI design intelligence for styles, palettes, fonts, charts & UX guidelines.
- 🪄 **[motion Skill](../skills/motion/SKILL.md)**: Modern animation intelligence, spring physics, gestures & exit transitions.
- 🔍 **[claude-seo Skill](../skills/seo/SKILL.md)**: Universal SEO intelligence for technical SEO, schema, OpenGraph, Core Web Vitals, and audits.
- 🏗️ **[Architecture.md](./Architecture.md)**: Routing structure, layout hierarchy, and state management.
- 📜 **[Rules.md](./Rules.md)**: Strict execution constraints and boundaries.
- 🧠 **[Memory.md](./Memory.md)**: Current active pages and UI state.
- ✅ **[done.md](./done.md)**: List of already completed frontend modules.

---

## 🎨 UI & Design Consistency (Production SaaS Standard)
- **Real Data Mandate**: Every number, card, table row, and chart must render real data from the backend/database or show an explicit empty state. Zero fake/dummy metrics.
- **Design Restraint**: Modern, clean, compact typography; purposeful whitespace; elegant borders and soft shadows. Avoid tacky glows, cartoonish radii, or unnecessary AI sparkles.
- **Unified Color Palette**: Adhere strictly to the defined palette in **[Design.md](./Design.md)** with complete Dark Mode & Light Mode support.
- **Reusable Component Hierarchy**: Centralize all reusable UI components (e.g. `Button`, `DataTable`, `Badge`, `Modal`, `Drawer`, `Toast`, `StateContainer`). Do not duplicate ad-hoc styling.
- **XSS & Client Security**: Strictly avoid `dangerouslySetInnerHTML` unless sanitized with DOMPurify. Never store unencrypted sensitive credentials or private keys in client-side storage.

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

## 🔍 Automated SEO & Core Web Vitals Mandate (claude-seo)
As pages, layouts, and components are built, automatically enforce the following SEO standards:
1. **Semantic HTML & Hierarchy**:
   - Single, descriptive `<h1>` per page.
   - Sequential heading structure (`<h2>` to `<h6>`) without skipping levels.
   - Semantic landmark elements (`<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`).
2. **Metadata & OpenGraph**:
   - Page `<title>` between 50–60 characters containing key subject + brand.
   - Meta `description` between 120–155 characters summarizing the page.
   - Canonical link tag (`<link rel="canonical" href="...">`).
   - OpenGraph and Twitter Cards (`og:title`, `og:description`, `og:image`, `og:url`, `twitter:card`).
3. **Structured Data (Schema.org / JSON-LD)**:
   - Inject schema markup for `WebSite`, `Organization`, `BreadcrumbList`, `Article`, `Product`, or `FAQPage` where relevant.
4. **Image SEO & Performance**:
   - Meaningful `alt` text on every informational image (empty `alt=""` for purely decorative images).
   - Explicit `width` and `height` attributes (or CSS aspect-ratio) to prevent Cumulative Layout Shift (CLS).
   - Lazy loading (`loading="lazy"`) for all below-the-fold media.
5. **Core Web Vitals**:
   - Ensure LCP < 2.5s, CLS < 0.1, INP < 200ms.
   - Mobile touch targets minimum 48x48px with appropriate spacing.

---

## 🪄 Automated Micro-Interactions & Animation Mandate (motion)
As frontend components and interactive surfaces are created, automatically apply **Motion** (`motion/react`) standards:
1. **Physical Spring Gestures on Clickables**:
   - Interactive buttons, cards, and list items must have tactile feedback:
     ```tsx
     whileHover={{ scale: 1.02 }}
     whileTap={{ scale: 0.98 }}
     transition={{ type: "spring", stiffness: 400, damping: 25 }}
     ```
2. **Smooth Exit Transitions (`AnimatePresence`)**:
   - Every modal, slide-over drawer, dropdown, tooltip, or toast notification must be wrapped in `<AnimatePresence>` for smooth enter and exit transitions (no abrupt disappearances).
3. **Smooth Shared Layouts (`layoutId`)**:
   - Active tabs, segmented pill controls, and filter bars must use `layoutId` for smooth sliding underline/pill indicators.
4. **GPU-Accelerated Performance**:
   - Animate strictly composite properties (`transform: translate/scale/rotate`, `opacity`). Never animate raw `height`, `width`, or `margin` directly without `layout`.
5. **Accessibility Compliance (`prefers-reduced-motion`)**:
   - Respect user system preferences via `useReducedMotion()`. Fallback to instant or opacity-only transitions when reduced motion is requested.

---

## 🚫 Frontend Strict Execution Rules
1. Touch **ONLY** the targeted frontend component, page, or style file.
2. Provide the **FULL** updated file content without truncating code.
3. 🚫 **Zero code comments** or explanations inside code files.
4. 🚫 Do **NOT** execute `npm run build` or automated browser tests without explicit user instruction.
5. **AUTOMATIC SYNC**: Update **[Memory.md](./Memory.md)** and **[done.md](./done.md)** immediately after adding or modifying frontend pages.
