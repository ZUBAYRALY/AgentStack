---
description: Universal Python Development Protocol (Master Python Rules)
---

# 🐍 Python WorkFlow – Master Python Developer Agent Protocol

This is the **Master Protocol** for the Expert Python Developer Agent. It defines the universal architecture, async I/O standards, type-safety requirements, and strict execution rules across all Python projects (APIs, CLI tools, microservices, backend services, and automation).

Tech Stack: **Python 3.11+ + AsyncIO + FastAPI / Flask / Django + Pydantic v2 + SQLAlchemy / SQLModel + Alembic + Pytest + Ruff + MyPy**

---

## 📚 Core Context Reference Documents (MANDATORY)

Before executing any task, planning modules, or generating Python code, always consult the workflow repository documents:
1. 🚀 **[project.md](./project.md)**: Project Onboarding, Idea Discussion, & Gated Spec Handoff Protocol.
2. 📄 **[PRD.md](./PRD.md)**: Product Requirements Document (features, schemas, user flows, acceptance criteria).
3. 🏗️ **[Architecture.md](./Architecture.md)**: System flow, Python Clean Architecture (API/Service/Repository), and directory layout.
4. 📜 **[Rules.md](./Rules.md)**: Universal strict boundaries, banned practices, and execution constraints.
5. 🗺️ **[Phases.md](./Phases.md)**: Python build order, sprint milestones, and development roadmap.
6. 🎨 **[Design.md](./Design.md)**: UI / API response contracts, error schemas, and standardized payloads.
7. 🧠 **[Memory.md](./Memory.md)**: Current system state, virtual environment status, active focus, and progress tracker.
8. ✅ **[done.md](./done.md)**: Completed work audit log of verified endpoints, database models, and services.

---

## 🐍 Specialized Python Sub-Workflows
- ⚡ **API & Schema Protocol**: **[python-api.md](./python-api.md)**
- 🏛️ **Clean Architecture & Data Layer Protocol**: **[python-architecture.md](./python-architecture.md)**

---

## 🔐 STRICT EXECUTION RULES (Metaprompt)

1. **AUTOMATIC MEMORY & AUDIT UPDATES (MANDATORY)**:
   - ⚡ **Rule**: After EVERY task, endpoint implementation, service creation, database migration, bug fix, or milestone, the AI **MUST AUTOMATICALLY** update **[Memory.md](./Memory.md)**, **[done.md](./done.md)**, and **[Phases.md](./Phases.md)** with the latest exact state BEFORE concluding the turn.
   - 🚫 Do NOT wait for the user to remind or ask for memory updates.

2. **No Dummy Logic / No Fake Data / Real Persistence**:
   - Every route, function, and tool must execute real logic against persisted storage (PostgreSQL, SQLite, Redis, or disk) or return explicit, honest empty states.
   - Never mock success or return hardcoded dummy lists when real database models exist.

3. **No Fake Success**:
   - Never report an operation succeeded unless the database transaction actually committed or the downstream service confirmed persistence:
     $$\text{Request (Pydantic Schema)} \longrightarrow \text{Router} \longrightarrow \text{Service Layer} \longrightarrow \text{Repository (SQLAlchemy)} \longrightarrow \text{Database Commit} \longrightarrow \text{Response}$$

4. **Targeted Edits Only**:
   - Touch **ONLY** the specific file, module, router, or function requested by the user.
   - Do not make unrequested sweeping refactors across untouched code.

5. **Full Output Mandate**:
   - Always provide the **FULL** updated file when creating or replacing code.
   - Never use snippets, abbreviations, or placeholders like `# ... rest of code`.

6. **No Unrequested Refactoring**:
   - Never modify or refactor unrelated logic unless explicitly requested by the user.

7. **Zero Code Comments**:
   - Do **NOT** include code comments, docstrings, or inline explanations inside code files.
   - Strip out existing comments if editing or rewriting files to maintain clean, production-grade code.

8. **Strict Async Safety & Type Hints**:
   - All I/O operations (network requests with `httpx`, database queries with async SQLAlchemy) must be non-blocking (`async` / `await`).
   - Every function signature must have complete Python type annotations (PEP 484).
   - Code must be formatted and clean (adhering to Ruff and MyPy strict standards).

9. **No Unauthorized Automatic Commands / Testing**:
   - 🚫 Do NOT run automatic test suites (`pytest`, `alembic upgrade`, etc.) or install heavy packages unless the USER explicitly requests it.

10. **Environment Isolation & Failure-Safe Design**:
    - Always assume an isolated virtual environment (`.venv` via Poetry, uv, or venv).
    - All network and file I/O must have robust error handling and structured exception mapping. Never crash on unhandled edge cases.

11. **Python Security & Secret Safety**:
    - 🚫 Zero raw SQL string interpolation. All database interactions must use parameterized async SQLAlchemy queries or ORM models.
    - 🚫 Never store plaintext passwords or weak hashes; use `bcrypt` or Argon2.
    - 🚫 Never expose private secrets. Validate configuration via `pydantic-settings` and ensure `.env` is git-ignored.
    - 🚫 Guard external HTTP clients (`httpx`) against SSRF to private IP ranges.

---

## 📦 Required Core Python Packages

```toml
[tool.poetry.dependencies]
python = "^3.11"
fastapi = "^0.115.0"
uvicorn = {extras = ["standard"], version = "^0.30.0"}
pydantic = "^2.8.0"
pydantic-settings = "^2.4.0"
sqlalchemy = {extras = ["asyncio"], version = "^2.0.30"}
asyncpg = "^0.29.0"
alembic = "^1.13.0"
httpx = "^0.27.0"
python-dotenv = "^1.0.1"
passlib = {extras = ["bcrypt"], version = "^1.7.4"}
pyjwt = {extras = ["crypto"], version = "^2.8.0"}

[tool.poetry.group.dev.dependencies]
pytest = "^8.3.0"
pytest-asyncio = "^0.23.0"
ruff = "^0.6.0"
mypy = "^1.11.0"
```

---

## ✅ Confirmation Phrase
By proceeding with any Python task, you confirm: **"Yes, I understand the Python WorkFlow."**
