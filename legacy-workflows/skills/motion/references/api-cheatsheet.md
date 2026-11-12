# Motion (`motion/react`) API & Animation Cheatsheet

Reference documentation for building production web animations with **Motion** (v11+).

---

## 1. Imports Reference
```tsx
// Modern Motion v11+ (Replaces legacy "framer-motion")
import { 
  motion, 
  AnimatePresence, 
  useScroll, 
  useTransform, 
  useSpring,
  useInView,
  useReducedMotion
} from "motion/react";
```

---

## 2. Spring Physics Presets
Natural spring physics configurations:

| Use Case | Stiffness | Damping | Mass | Behavior |
| :--- | :--- | :--- | :--- | :--- |
| **Snappy UI (Buttons, Toggles)** | 400 | 30 | 1 | Crisp, rapid feedback with no overshoot |
| **Smooth Overlays (Modals, Drawers)** | 300 | 25 | 1 | Fluid, gentle entrance & exit |
| **Bouncy Accent (Badges, Notifications)** | 400 | 15 | 1 | Playful spring bounce |
| **Heavy Cards / Sheets** | 200 | 28 | 1.2 | Weighted, controlled movement |

---

## 3. Gestures & Micro-Interactions
```tsx
<motion.button
  whileHover={{ scale: 1.02 }}
  whileTap={{ scale: 0.98 }}
  whileFocus={{ ring: "2px solid #6366f1" }}
  transition={{ type: "spring", stiffness: 400, damping: 30 }}
>
  Submit
</motion.button>
```

---

## 4. Shared Element Transitions (`layoutId`)
```tsx
{items.map((item) => (
  <button key={item.id} onClick={() => setSelected(item.id)}>
    {item.title}
    {selected === item.id && (
      <motion.div
        layoutId="activeUnderline"
        className="h-1 bg-indigo-600 rounded-full"
        transition={{ type: "spring", stiffness: 500, damping: 35 }}
      />
    )}
  </button>
))}
```

---

## 5. Scroll-Driven Parallax
```tsx
const { scrollYProgress } = useScroll({
  target: containerRef,
  offset: ["start end", "end start"]
});

const y = useTransform(scrollYProgress, [0, 1], [-50, 50]);
const opacity = useTransform(scrollYProgress, [0, 0.3, 0.8, 1], [0, 1, 1, 0]);

return <motion.div style={{ y, opacity }}>Parallax Content</motion.div>;
```

