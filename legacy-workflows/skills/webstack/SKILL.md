---
name: webstack
description: "Universal Full-Stack Web Development skill for modern production applications. Covers Next.js, React, TypeScript, Tailwind CSS, Node.js/Express backend, Prisma ORM, PostgreSQL, REST/SSE APIs, and zero-dummy-data honest state handling."
user-invocable: true
argument-hint: "[feature-name] [module-type] [frontend-or-backend]"
license: MIT
metadata:
  frameworks: "Next.js, React 18+, Node.js, Express/Fastify"
  styling: "Tailwind CSS + Dark/Light Theme Engine"
  orm: "Prisma / Drizzle ORM + PostgreSQL"
  validation: "Zod / TypeScript strict"
---

# 🌐 WebStack: Master Full-Stack Web Development Skill

This skill provides comprehensive full-stack web engineering intelligence for building high-performance, type-safe, and production-grade web applications with modern frontend and backend architectures.

---

## 🧭 Workspace Integration & Synchronization

When working within an active project, this skill synchronizes with the workspace workflows:
- 📖 **Master Protocol**: `[webstack.md](../../workflows/webstack.md)`
- 🎨 **Frontend Protocol**: `[webstack-frontend.md](../../workflows/webstack-frontend.md)`
- ⚙️ **Backend Protocol**: `[webstack-backend.md](../../workflows/webstack-backend.md)`
- 🚀 **Project Onboarding**: `[project.md](../../workflows/project.md)`
- 📄 **Requirements**: `[PRD.md](../../workflows/PRD.md)`
- 🏗️ **Architecture**: `[Architecture.md](../../workflows/Architecture.md)`
- 📜 **Strict Rules**: `[Rules.md](../../workflows/Rules.md)`
- 🗺️ **Roadmap**: `[Phases.md](../../workflows/Phases.md)`
- 🎨 **Design System**: `[Design.md](../../workflows/Design.md)`
- 🧠 **Memory & State**: `[Memory.md](../../workflows/Memory.md)`
- ✅ **Audit Log**: `[done.md](../../workflows/done.md)`

### 🧩 Companion Skills for WebStack
- 🎨 **[ui-ux-pro-max](../ui-ux-pro-max/SKILL.md)**: Color palettes, UI styles, font pairings, and responsive patterns.
- 🪄 **[motion](../motion/SKILL.md)**: Smooth spring animations, micro-interactions, and layout transitions (`motion/react`).
- 🔍 **[seo](../seo/SKILL.md)**: Technical SEO audits, Schema.org markup, XML sitemaps, and Core Web Vitals optimization.

> ⚡ **Mandatory Execution Rule**: After completing every endpoint, component, database model, bug fix, or milestone, the AI must automatically update `Memory.md`, `done.md`, and `Phases.md`.

---

## ⚡ Core Philosophy & Guardrails

1. **No Dummy UI / No Fake Data / Honest States**:
   - Every UI element must perform a real action, display real persisted database data, or show a clear, honest empty state.
   - Never fabricate fake metrics, simulated rows, dummy charts, or fake notifications.
   - Explicitly handle all 4 core states: **Loading**, **Empty**, **Error (with actionable retry)**, and **Populated Content**.

2. **No Fake Success (End-to-End Persistence)**:
   - Never report success unless the backend actually executed and persisted the change:
     $$\text{UI (Client)} \longrightarrow \text{API Route} \longrightarrow \text{Service Layer} \longrightarrow \text{Prisma / Database} \longrightarrow \text{Persisted Result} \longrightarrow \text{UI}$$

3. **Targeted Edits Only**:
   - Touch **ONLY** the specific file, component, or endpoint requested by the user.
   - Never perform sweeping unrequested refactors.

4. **Zero Code Comments & Full Code Mandate**:
   - Do **NOT** include code comments, docstrings, or inline explanations inside code files.
   - Always output the **FULL** updated file when creating or replacing code.

5. **Direct Access Protocol**:
   - Application must load cleanly and directly without auth traps or infinite redirect loops during active development.

---

## 🏗️ Production Code Templates

### 1. Frontend Typed API Client (`frontend/src/api/client.ts`)
```typescript
interface ApiResponse<T> {
  success: boolean;
  data: T;
  message?: string;
}

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || "http://localhost:5000/api";

export async function apiClient<T>(
  endpoint: string,
  options: RequestInit = {}
): Promise<T> {
  const url = `${API_BASE_URL}${endpoint.startsWith("/") ? endpoint : `/${endpoint}`}`;
  const response = await fetch(url, {
    ...options,
    headers: {
      "Content-Type": "application/json",
      ...options.headers,
    },
  });

  if (!response.ok) {
    const errorBody = await response.json().catch(() => null);
    throw new Error(errorBody?.message || `HTTP error! status: ${response.status}`);
  }

  const json: ApiResponse<T> = await response.json();
  return json.data;
}
```

### 2. State-Resilient React Component (`frontend/src/pages/ItemsPage.tsx`)
```tsx
import React, { useState, useEffect } from "react";
import { apiClient } from "../api/client";

interface Item {
  id: string;
  name: string;
  status: string;
  createdAt: string;
}

export const ItemsPage: React.FC = () => {
  const [items, setItems] = useState<Item[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  const fetchItems = async () => {
    setLoading(true);
    setError(null);
    try {
      const data = await apiClient<Item[]>("/items");
      setItems(data);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load items");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchItems();
  }, []);

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-600" />
      </div>
    );
  }

  if (error) {
    return (
      <div className="p-6 bg-rose-50 dark:bg-rose-950/30 border border-rose-200 dark:border-rose-900 rounded-lg text-center">
        <p className="text-rose-600 dark:text-rose-400 font-medium mb-3">{error}</p>
        <button
          onClick={fetchItems}
          className="px-4 py-2 bg-rose-600 hover:bg-rose-700 text-white rounded-md text-sm font-medium transition-colors"
        >
          Retry
        </button>
      </div>
    );
  }

  if (items.length === 0) {
    return (
      <div className="p-12 text-center border-2 border-dashed border-slate-200 dark:border-slate-800 rounded-lg">
        <h3 className="text-slate-900 dark:text-slate-100 font-medium text-lg mb-1">No items found</h3>
        <p className="text-slate-500 dark:text-slate-400 text-sm mb-4">Get started by creating your first item.</p>
        <button
          onClick={fetchItems}
          className="px-4 py-2 bg-indigo-600 hover:bg-indigo-700 text-white rounded-md text-sm font-medium transition-colors"
        >
          Refresh Data
        </button>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <div className="flex justify-between items-center">
        <h1 className="text-2xl font-bold text-slate-900 dark:text-white">Items</h1>
        <button
          onClick={fetchItems}
          className="px-3 py-1.5 text-xs bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 rounded hover:bg-slate-200 dark:hover:bg-slate-700 transition-colors"
        >
          Refresh
        </button>
      </div>
      <div className="overflow-x-auto border border-slate-200 dark:border-slate-800 rounded-lg">
        <table className="w-full text-left text-sm">
          <thead className="bg-slate-50 dark:bg-slate-900/50 text-slate-500 border-b border-slate-200 dark:border-slate-800">
            <tr>
              <th className="px-4 py-3 font-medium">Name</th>
              <th className="px-4 py-3 font-medium">Status</th>
              <th className="px-4 py-3 font-medium">Date</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-200 dark:divide-slate-800">
            {items.map((item) => (
              <tr key={item.id} className="hover:bg-slate-50 dark:hover:bg-slate-900/30">
                <td className="px-4 py-3 font-medium text-slate-900 dark:text-slate-100">{item.name}</td>
                <td className="px-4 py-3">
                  <span className="px-2 py-0.5 text-xs rounded-full bg-emerald-100 dark:bg-emerald-950/50 text-emerald-700 dark:text-emerald-400">
                    {item.status}
                  </span>
                </td>
                <td className="px-4 py-3 text-slate-500 text-xs">{new Date(item.createdAt).toLocaleDateString()}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};
```

### 3. Backend Controller & Validation with Prisma (`backend/src/controllers/item.controller.ts`)
```typescript
import { Request, Response, NextFunction } from "express";
import { z } from "zod";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const createItemSchema = z.object({
  name: z.string().min(2, "Name must be at least 2 characters").max(100),
  status: z.enum(["active", "pending", "archived"]).default("active"),
});

export async function getItems(req: Request, res: Response, next: NextFunction): Promise<void> {
  try {
    const items = await prisma.item.findMany({
      orderBy: { createdAt: "desc" },
      take: 50,
    });
    res.json({ success: true, data: items });
  } catch (error) {
    next(error);
  }
}

export async function createItem(req: Request, res: Response, next: NextFunction): Promise<void> {
  try {
    const validatedData = createItemSchema.parse(req.body);
    const newItem = await prisma.item.create({
      data: validatedData,
    });
    res.status(201).json({ success: true, data: newItem, message: "Item created successfully" });
  } catch (error) {
    next(error);
  }
}
```

