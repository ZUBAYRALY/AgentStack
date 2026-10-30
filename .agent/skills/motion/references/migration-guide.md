# Migrating from `framer-motion` to Modern `motion` (v11+)

Motion (formerly Framer Motion) was rebranded and rewritten under `motiondivision/motion`.

---

## 1. Package Replacement
```bash
# Uninstall legacy package
npm uninstall framer-motion

# Install modern package
npm install motion
```

---

## 2. Import Changes
```tsx
// ❌ Legacy (Deprecated)
import { motion, AnimatePresence } from "framer-motion";

// ✅ Modern (Motion v11+)
import { motion, AnimatePresence } from "motion/react";
```

---

## 3. Key Differences & Enhancements
1. **Bundle Size**: Up to 50% smaller tree-shaken footprint.
2. **Vanilla JS & Vue Support**: Core motion logic is now framework-agnostic.
3. **Motion MCP Support**: Compatible with official Motion MCP server (`mcp.motion.dev`).
4. **Hardware Acceleration**: Automatic GPU composition optimization for `transform` and `opacity`.

