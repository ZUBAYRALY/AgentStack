# 📜 Non-Negotiable Rules & Execution Boundaries (Rules.md)

This document establishes the universal, non-negotiable rules and execution boundaries for AI coding agents operating across this repository.

---

## 1. Non-Negotiable Core Rules

### 1.1 Automatic Persistent Memory Sync (Mandatory)
- ⚡ **Rule**: The AI must **AUTOMATICALLY** update **[Memory.md](./Memory.md)**, **[done.md](./done.md)**, and **[Phases.md](./Phases.md)** after completing any code change, feature addition, bug fix, or milestone.
- 🚫 **Never** wait for the user to request or remind about memory synchronization.

### 1.2 No Dummy UI & No Fake Data
- Every visible UI element must:
  - Perform a real implemented backend action,
  - Display real persisted database data,
  - Or display a clear `Empty State` / `Not Connected` state with actionable triggers.
- 🚫 **NEVER** fabricate dummy metrics, fake database rows, fake charts, or simulated notifications.

### 1.3 No Fake Success
- AI and backend must **NEVER** report success unless the backend actually executed and persisted the change:
  $$\text{UI} \longrightarrow \text{API} \longrightarrow \text{Service} \longrightarrow \text{Database/Storage} \longrightarrow \text{Persisted Result} \longrightarrow \text{UI}$$

### 1.4 AI & API Budget Guard (Safe Defaults)
- Default to free or locally configured models and zero-cost APIs unless explicitly configured otherwise by the user.
- Strictly adhere to a $0 unauthorized paid spend policy. Never trigger paid API usage without explicit user consent.

### 1.5 The Reality Rule
- Implement real validation, real duplicate checking, and real integrity constraints.
- System outputs and score calculations must be evidence-based and traceable to actual data.

---

## 2. Strict Execution Protocols (Metaprompt)

### 2.1 Targeted Edits Only
- Touch **ONLY** the specific file, component, or endpoint requested by the user.
- Do not make unrequested sweeping refactors across untouched components.

### 2.2 Full Output Mandate
- Always provide the **FULL** updated file. No snippets, no placeholders, no `// ... rest of code`.

### 2.3 Zero Code Comments
- Do **NOT** include code comments, docstrings, or inline explanations inside code files.
- Strip out any existing comments if editing or rewriting files.

### 2.4 No Unauthorized Commands / Testing
- 🚫 Do **NOT** run automatic build commands (`npm run build`, `pytest`, etc.) unless the user explicitly requests it.
- 🚫 Do **NOT** trigger automatic browser testing or subagents unless explicitly requested.

### 2.5 Direct Access Protocol
- Maintain direct dashboard load without artificial authentication traps or login loops during development.

---

## 3. Defensive Security & Vulnerability Prevention Standards
1. **Injection Prevention (SQL & NoSQL)**:
   - 100% of database interactions must use parameterized ORM queries (e.g., Prisma, Drizzle, SQLAlchemy).
   - Never use raw string interpolation or concatenation in database queries.
2. **Cross-Site Scripting (XSS) Prevention**:
   - Never use `dangerouslySetInnerHTML` with unsanitized user input.
   - Ensure all rich-text content is sanitized using strict allow-lists (e.g., DOMPurify) before rendering.
3. **Broken Access Control & Multi-Tenant Scoping**:
   - Every read, update, or delete database query must explicitly enforce user or workspace ownership (`where: { id, workspaceId }`).
   - Never rely solely on client-provided IDs without verifying server-side ownership.
4. **Security Headers & CORS**:
   - Enforce secure HTTP headers using Helmet (Content-Security-Policy, X-Frame-Options: DENY, X-Content-Type-Options: nosniff).
   - Restrict CORS origins strictly to authorized frontend domains.
5. **SSRF & Private IP Blocking**:
   - All outgoing scrapers, crawlers, or webhook dispatchers must strictly block private IP ranges (`127.0.0.1`, `localhost`, `10.x`, `192.168.x`, `169.254.x.x`).
6. **Secret Management & Environment Isolation**:
   - Never expose API keys, database connection strings, or JWT secrets in client bundles or public commits.
   - Access credentials strictly through backend environment variables (`.env`).
7. **Dependency Auditing**:
   - Keep all installed third-party libraries updated and run `npm audit` to verify zero high or critical CVE vulnerabilities.

---

## 4. Definition of Done Checklist
A task, endpoint, or UI component is marked complete **ONLY** when:
- [x] UI complete and verified responsive (desktop, tablet, mobile).
- [x] Loading, Empty, Error, and Populated data states implemented.
- [x] Backend endpoint validated with schema validation & authorization checks.
- [x] Real database persistence and centralized error handling confirmed.
- [x] Zero dummy data / Zero dead buttons.
- [x] SEO & Metadata verified (Semantic HTML, Title/Description, OpenGraph, Alt tags, Schema markup).
- [x] Defensive Security verified (No raw SQL, sanitized inputs, tenant-scoped queries, secrets isolated).
- [x] **[done.md](./done.md)**, **[Memory.md](./Memory.md)**, and **[Phases.md](./Phases.md)** updated automatically.
