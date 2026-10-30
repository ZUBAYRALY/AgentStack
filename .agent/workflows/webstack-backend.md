---
description: Universal Backend Web Development Protocol
---

# ⚙️ Backend Web Development Protocol

**Project Tech Stack**: `[Configure: e.g., Node.js (Express / Fastify / NestJS) or Python (FastAPI / Django) + PostgreSQL / MySQL / MongoDB + Prisma / Drizzle / TypeORM]`

---

## 📚 Essential Documents
Before building or modifying backend code, always review:
- 📄 **[PRD.md](./PRD.md)**: Functional requirements, data specifications, and business logic.
- 🏗️ **[Architecture.md](./Architecture.md)**: API route contracts, database schema models, and service layer flow.
- 📜 **[Rules.md](./Rules.md)**: Strict execution constraints and security standards.
- 🧠 **[Memory.md](./Memory.md)**: Active endpoints, database status, and configuration.
- ✅ **[done.md](./done.md)**: List of already completed backend endpoints & models.

---

## ⚙️ Architecture & Execution Principles
- **Robust Input Validation**: Validate 100% of incoming request payloads, query params, and route parameters using a schema validator (e.g., Zod, Joi, or Pydantic). Never trust unvalidated input.
- **Centralized Error Handling**:
  - Wrap controllers/endpoints in standardized error handlers.
  - Return consistent, predictable JSON response envelopes:
    - Success: `{ "success": true, "data": ... }`
    - Failure: `{ "success": false, "error": "Human-readable message" }`
  - Never crash the process on runtime exceptions.
- **Data Integrity & Persistence**:
  - Always enforce database-level constraints (foreign keys, uniqueness, not-null constraints).
  - Use database transactions for multi-step mutations.
  - Select only needed columns/fields; prevent N+1 query patterns.
- **Security & Guardrails**:
  - Store all sensitive credentials, API keys, and connection strings strictly in backend environment variables (`.env`). Never leak secrets to client bundles.
  - Implement parameterized ORM queries (Prisma / Drizzle); never concatenate raw SQL strings.
  - Protect authentication cookies with `httpOnly: true`, `secure: true`, and `sameSite: "lax"`.
  - Block SSRF by preventing external HTTP fetchers from calling private/loopback IP ranges (`127.0.0.1`, `10.0.0.0/8`, `192.168.0.0/16`, `169.254.169.254`).
  - Implement rate limiting and explicit origin CORS policies in production.
  - Scope all queries by authenticated tenant / `userId`.

---

## ⚡ Performance & Reliability Mandate
- **Fast Response Times**: Optimize standard REST/GraphQL endpoints to respond in under 300-500ms.
- **Idempotency**: Ensure mutations that may be retried (e.g., payment, email sending, job dispatch) are strictly idempotent.
- **Clean Logging**: Provide structured console logging for errors and critical milestones. Never log sensitive credentials, passwords, or auth tokens.

---

## 🚫 Backend Strict Execution Rules
1. Touch **ONLY** the targeted endpoint, controller, service, or model file.
2. Provide the **FULL** updated file content without truncating code.
3. 🚫 **Zero code comments** or explanations inside code files.
4. 🚫 Do **NOT** execute database migrations or build scripts without explicit user permission.
5. **AUTOMATIC SYNC**: Update **[Memory.md](./Memory.md)** and **[done.md](./done.md)** immediately after adding or modifying backend endpoints or database schemas.
