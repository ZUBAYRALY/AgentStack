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

## 3. Universal Security & Boundary Standards

### 3.1 Secrets & Credential Isolation
- **Zero Secrets in Code**: Never hardcode API keys, database credentials, passwords, or tokens in source code, commits, or client-side bundles.
- **Web**: Secrets strictly reside in backend `.env` files. Client bundles must never include private tokens (never prefix sensitive keys with `VITE_` or `NEXT_PUBLIC_`).
- **Python**: Enforce `.env` isolation via `pydantic-settings`. Ensure `.env` is listed in `.gitignore`.
- **Android**: Never store raw keys in `AndroidManifest.xml` or code. Store in `local.properties` (injected via `BuildConfig`) or retrieve securely from backend.

### 3.2 Injection Shields & Parameterized Queries
- **Zero Raw SQL String Concatenation**: Every SQL query must use parameterized statements or ORM mapping (Prisma, async SQLAlchemy 2.0, Room DAOs).
- **Strict Schema Validation**: Validate 100% of external user inputs before processing (Zod for Web, Pydantic v2 for Python, Kotlin type safety for Android).

### 3.3 Network, SSRF & Transport Security
- **HTTPS & TLS Enforcement**: All network transport must be encrypted (TLS 1.2/1.3).
- **Android Network Security**: Enforce `android:usesCleartextTraffic="false"` to block unencrypted HTTP traffic.
- **SSRF Prevention**: External HTTP fetchers (Node `fetch`, Python `httpx`, Android Retrofit) must block calls to private/loopback IP ranges (`127.0.0.1`, `10.0.0.0/8`, `192.168.0.0/16`, `169.254.169.254`).

### 3.4 Data at Rest & Storage Protection
- **Password Hashing**: Passwords must always be hashed with `bcrypt` or `argon2` with appropriate work factors. Never store plain or MD5/SHA hashes.
- **Android Storage Security**: Sensitive tokens must use `EncryptedSharedPreferences` or Android Keystore. Plain `SharedPreferences` is forbidden for secrets. Set `android:allowBackup="false"` to prevent unauthorized data extraction.
- **Tenant & Workspace Isolation**: Every read/write query must enforce tenant/user ownership scoping (`WHERE user_id = :auth_user_id`).

---

## 4. Definition of Done Checklist
A task, endpoint, or UI component is marked complete **ONLY** when:
- [x] UI complete and verified responsive (desktop, tablet, mobile).
- [x] Loading, Empty, Error, and Populated data states implemented.
- [x] Backend endpoint validated with schema validation & authorization checks.
- [x] Real database persistence and centralized error handling confirmed.
- [x] Zero dummy data / Zero dead buttons.
- [x] **[done.md](./done.md)**, **[Memory.md](./Memory.md)**, and **[Phases.md](./Phases.md)** updated automatically.
