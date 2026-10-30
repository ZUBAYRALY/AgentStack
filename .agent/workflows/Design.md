# 🎨 Design System & UI Specification (Design.md)

**Project Name**: `[Project Name]`  
**Theme**: Deep OLED Dark Mode & Clean Modern Light Mode (SaaS Standard)

---

## 1. Core Design Principles

### Integrated Design Skills
- 🎨 **[ui-ux-pro-max](../skills/ui-ux-pro-max/SKILL.md)**: Comprehensive design intelligence across 13 tech stacks (including `html-tailwind`, `nextjs`, `react`, and `jetpack-compose` for Android).
- 🪄 **[motion](../skills/motion/SKILL.md)**: Web animation intelligence, spring physics, and gesture feedback (`motion/react` for Web).

### What to Build
- **Clean Information Hierarchy**: High readability, distinct font weights, and predictable layout structures.
- **Restrained Color Palette**: Professional dark and crisp light themes with subtle semantic accents.
- **High-Density Data Display**: Compact tables, clear metric indicators, and clean list layouts.
- **Purposeful Whitespace**: Well-proportioned padding and margins that prevent clutter without wasting viewport space.
- **Accessible State Handling**: Always provide visible Empty, Loading, Error, and Populated data states.
- **Smooth Micro-Interactions**: Subtle button hover transitions, modal fades, and drawer slides (Framer Motion / CSS transitions).

### What to Avoid
- 🚫 Excessive neon glows, loud multi-color gradients, or intense glassmorphism blur.
- 🚫 Oversized, cartoonish border radii or novelty styling.
- 🚫 Decorative fake charts, fake progress bars, or simulated live feeds.
- 🚫 Low-contrast text that harms readability in dark or light mode.

---

## 2. Color Tokens & Semantic Palette

### Surfaces & Backgrounds
| Token / Area | Light Mode | Dark Mode | Usage |
| :--- | :--- | :--- | :--- |
| **Application Base** | `bg-slate-50` (`#f8fafc`) | `bg-slate-950` (`#020617`) | Main page backdrop |
| **Card / Container** | `bg-white` (`#ffffff`) | `bg-slate-900` (`#0f172a`) | Content cards & panels |
| **Sub-Surface / Header** | `bg-slate-100` (`#f1f5f9`) | `bg-slate-800/80` | Table headers & secondary bars |
| **Structural Borders** | `border-slate-200` | `border-slate-800` | Card borders, table dividers |
| **Hover Row Highlight** | `hover:bg-slate-50` | `hover:bg-slate-800/50` | Table row hover states |

### Typography & Text Contrast
| Token | Light Mode | Dark Mode | Usage |
| :--- | :--- | :--- | :--- |
| **Primary Headings** | `text-slate-900` | `text-slate-100` / `text-white` | Page titles, key metric numbers |
| **Body / Labels** | `text-slate-700` | `text-slate-300` | Standard body content & form labels |
| **Muted / Subtitles** | `text-slate-500` | `text-slate-400` | Timestamps, secondary descriptions |

### Primary Accents & Interactive
- **Primary Brand Color**: `bg-indigo-600 hover:bg-indigo-500` (or `emerald-600` depending on project preference)
- **Accent Text**: `text-indigo-600 dark:text-indigo-400`
- **Focus Rings**: `focus:ring-2 focus:ring-indigo-500/30 focus:outline-none`

### Semantic Status Indicators
- **Success / Completed / Active**: Emerald (`text-emerald-500`, `bg-emerald-50 dark:bg-emerald-950/40`, `border-emerald-200 dark:border-emerald-800`)
- **Warning / Pending / In Progress**: Amber (`text-amber-500`, `bg-amber-50 dark:bg-amber-950/40`, `border-amber-200 dark:border-amber-800`)
- **Danger / Failed / Bounced**: Rose (`text-rose-500`, `bg-rose-50 dark:bg-rose-950/40`, `border-rose-200 dark:border-rose-800`)
- **Neutral / Draft / Info**: Sky or Slate (`text-slate-500`, `bg-slate-100 dark:bg-slate-800`)

---

## 3. Reusable UI Component Library

Centralize components in `frontend/src/components/`:
- **Data Display**: `DataTable`, `Pagination`, `MetricCard`, `Badge`, `ActivityFeed`, `Timeline`.
- **Interactive Controls**: `Button`, `IconButton`, `Input`, `SearchInput`, `Select`, `Dropdown`, `Tabs`, `FilterBar`.
- **Feedback & Overlays**: `Modal`, `Drawer`, `ConfirmationDialog`, `ToastNotification`, `Tooltip`.
- **State Handlers**: `StateContainer` (unified Loading, Empty, Error, and Offline states).

---

## 4. Standard Page Layout Patterns

1. **Application Shell**:
   - Collapsible desktop sidebar (`w-64`) with smooth transition to mobile slide-over drawer.
   - Fixed top navigation header with workspace selector, search/command shortcut (`Ctrl + K`), and dark/light theme toggle.
2. **Actionable Dashboard**:
   - Header with dynamic greetings, active context, and primary action button.
   - Metric cards row displaying real KPIs.
   - Main content grid with interactive data tables and secondary activity panel.
3. **Detail & Audit Views**:
   - Multi-tab views with tabbed navigation for overview, history, settings, and logs.

---

## 5. Responsive Verification Standards
- **Mobile (<640px)**: 100% full-width cards, stackable metric columns, slide-over navigation.
- **Tablet (640-1024px)**: 2-column metric grids, horizontally scrollable data tables.
- **Desktop (>1024px)**: Multi-column dashboard layouts, fixed sidebars, zero unintended horizontal scroll.

---

## 6. Android Material 3 UI Tokens (Droid Standard)

### Material 3 Color Roles
- **Primary / OnPrimary**: `MaterialTheme.colorScheme.primary` / `onPrimary`
- **Surface / Background**: `MaterialTheme.colorScheme.surface` / `background`
- **Surface Container (Cards)**: `MaterialTheme.colorScheme.surfaceContainer` / `surfaceVariant`
- **Outlines / Dividers**: `MaterialTheme.colorScheme.outlineVariant`
- **Error**: `MaterialTheme.colorScheme.error` / `onError`

### Dynamic Color & Dark Mode
- Support dynamic theming on Android 12+ (`dynamicDarkColorScheme` / `dynamicLightColorScheme`).
- Fallback to branded deep OLED dark and clean light schemes on older Android versions.

### Android Reusable Primitives (`app/src/main/java/.../ui/components`)
- `AppTopBar`: Slot-based TopAppBar with back navigation and action icons.
- `AppBottomNavBar`: NavigationBar with icons and badges.
- `StateContainer`: Composable handling Loading skeleton, Empty with CTA, Error with Retry, and Content.
- `PrimaryButton`: FilledButton / OutlinedButton adhering to Material 3 elevation and shape tokens.
