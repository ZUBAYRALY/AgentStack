---
name: motion
description: "Modern animation intelligence and micro-interaction protocol powered by Motion (motiondivision/motion). Covers spring physics, layout animations (layoutId), gestures (whileHover, whileTap), AnimatePresence exit animations, scroll-driven triggers, and WCAG reduced motion compliance."
user-invocable: true
argument-hint: "[component-type] [animation-style]"
license: MIT
metadata:
  library: "motion (formerly Framer Motion)"
  repository: "https://github.com/motiondivision/motion"
  package: "motion"
  import_react: "motion/react"
---

# 🪄 Motion: Modern Animation & Micro-Interactions Skill

This skill provides expert animation engineering for React, Next.js, and modern JavaScript applications using **Motion** (`motion/react`).

---

## ⚡ Core Philosophy & Best Practices

1. **Purposeful Micro-Interactions**: Never animate just for decoration. Animations must provide visual feedback, orientation, or convey state changes.
2. **Spring Physics Over Easing Curves**: Default to spring physics for natural, physical UI movements:
   - Snappy UI (buttons, toggles): `type: "spring", stiffness: 400, damping: 30`
   - Smooth Panels (drawers, modals): `type: "spring", stiffness: 300, damping: 25`
   - Gentle Floats / Reveals: `type: "spring", stiffness: 100, damping: 20`
3. **Accessibility First (`prefers-reduced-motion`)**:
   Always respect user accessibility preferences. Use `useReducedMotion()` or CSS `@media (prefers-reduced-motion: reduce)` to disable heavy transforms while preserving essential state changes.
4. **Performance (60-120fps)**:
   Animate **ONLY** GPU-accelerated composite properties (`transform: translate/scale/rotate`, `opacity`). Avoid animating `height`, `width`, `top`, or `margin` directly; use `layout` instead.

---

## 📦 Package & Imports Reference

```bash
# Modern installation (v11+)
npm install motion
```

```tsx
// React imports
import { motion, AnimatePresence, useScroll, useTransform, useSpring } from "motion/react";
```

---

## 🎨 Essential Animation Patterns

### 1. Interactive Buttons & Clickables
```tsx
<motion.button
  whileHover={{ scale: 1.02, transition: { duration: 0.15 } }}
  whileTap={{ scale: 0.98 }}
  className="btn-primary"
>
  Click Me
</motion.button>
```

### 2. Modal / Dialog Entrance & Exit
```tsx
<AnimatePresence mode="wait">
  {isOpen && (
    <motion.div
      key="backdrop"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      className="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center"
    >
      <motion.div
        key="modal-card"
        initial={{ opacity: 0, scale: 0.95, y: 15 }}
        animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.95, y: 15 }}
        transition={{ type: "spring", stiffness: 350, damping: 25 }}
        className="bg-slate-900 border border-slate-800 rounded-xl p-6 w-full max-w-lg"
      >
        <ModalContent />
      </motion.div>
    </motion.div>
  )}
</AnimatePresence>
```

### 3. Shared Element Transitions (`layoutId` for Tabs / Active Pills)
```tsx
<div className="flex gap-2 bg-slate-900/80 p-1 rounded-lg border border-slate-800">
  {tabs.map((tab) => (
    <button
      key={tab.id}
      onClick={() => setActiveTab(tab.id)}
      className="relative px-4 py-2 text-sm font-medium rounded-md transition-colors"
    >
      {activeTab === tab.id && (
        <motion.div
          layoutId="activeTabPill"
          className="absolute inset-0 bg-emerald-600 rounded-md shadow-sm"
          transition={{ type: "spring", stiffness: 500, damping: 35 }}
        />
      )}
      <span className="relative z-10 text-white">{tab.label}</span>
    </button>
  ))}
</div>
```

### 4. Staggered List / Grid Reveals
```tsx
const containerVariants = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: { staggerChildren: 0.08, delayChildren: 0.1 }
  }
};

const itemVariants = {
  hidden: { opacity: 0, y: 15 },
  visible: { 
    opacity: 1, 
    y: 0,
    transition: { type: "spring", stiffness: 300, damping: 25 }
  }
};

<motion.ul variants={containerVariants} initial="hidden" animate="visible" className="grid grid-cols-3 gap-4">
  {items.map((item) => (
    <motion.li key={item.id} variants={itemVariants} className="card">
      <CardContent item={item} />
    </motion.li>
  ))}
</motion.ul>
```

### 5. Scroll-Triggered In-View Animations
```tsx
<motion.section
  initial={{ opacity: 0, y: 30 }}
  whileInView={{ opacity: 1, y: 0 }}
  viewport={{ once: true, margin: "-100px" }}
  transition={{ duration: 0.6, ease: [0.16, 1, 0.3, 1] }}
>
  <SectionContent />
</motion.section>
```

### 6. Dynamic Slide-Over Drawer
```tsx
<AnimatePresence>
  {isDrawerOpen && (
    <motion.aside
      initial={{ x: "100%" }}
      animate={{ x: 0 }}
      exit={{ x: "100%" }}
      transition={{ type: "spring", stiffness: 300, damping: 30 }}
      className="fixed right-0 top-0 h-full w-96 bg-slate-900 border-l border-slate-800 z-50 shadow-2xl"
    >
      <DrawerContent />
    </motion.aside>
  )}
</AnimatePresence>
```

---

## 🚫 Animation Anti-Patterns (What to Avoid)
- 🚫 Never animate layout-triggering properties (`width`, `height`, `left`, `margin`) directly — always use `layout` or `transform`.
- 🚫 Avoid infinite bouncing or spinning animations on non-loading elements.
- 🚫 Never drop `<AnimatePresence>` when animating unmounting components.
- 🚫 Avoid excessive spring overshoot on text or forms (keep damping >= 25).
