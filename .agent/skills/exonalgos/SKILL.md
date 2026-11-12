---
name: exonalgos
description: "Code migration protocol for transferring and adapting components, logic, and features from reference codebases into active projects. Triggered with /exonalgos."
user-invocable: true
argument-hint: "[component-or-page-name] [source-path]"
license: MIT
metadata:
  purpose: "Reference Code Adaptation & Feature Transfer"
---

# 🔄 ExonAlgos Code Adaptation Protocol (`/exonalgos`)

This skill defines the intelligent code migration protocol for transferring features from a reference codebase (e.g. ExonAlgos) to the active project workspace.

---

## 1. AGENT ANALYSIS (Mandatory)

1. **Identify Source**: Locate the specific component, page, or utility in the reference repository.
2. **Read Implementation**: Fully analyze the logic, dependencies, state management, and styles of the source file.
3. **Analyze Destination**: Inspect the destination directory to see where the file fits and whether any prerequisites (libraries, hooks, utils) are missing.

---

## 2. ADAPTATION LOGIC (The Core Task)

Do **NOT** blindly copy-paste. You must adapt the code:
1. **Imports**: Rewrite import paths to match the active project's directory structure (e.g., `@/components` vs `../components`).
2. **Styles**: Ensure CSS/Tailwind classes match the destination's design system tokens.
3. **Dependencies**: If the source uses a library not in the active `package.json`, flag it or substitute with an existing utility.
4. **Environment**: Update `process.env` / `import.meta.env` references to match the destination schema.

---

## 3. EXECUTION STEPS

1. Write the **COMPLETE**, adapted file. Never output partial snippets.
2. After migrating, register the new file in routing or navigation manifests if required.
3. Keep explanations concise and actionable.
