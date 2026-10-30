---
name: python
description: "Expert Python engineering skill for modern production systems. Covers FastAPI, Pydantic v2, AsyncIO, SQLAlchemy 2.0 (async), Alembic migrations, Clean Architecture (Layered/Repository pattern), Pytest testing, and strict type safety."
user-invocable: true
argument-hint: "[module-name] [endpoint-type] [architecture-layer]"
license: MIT
metadata:
  runtime: "Python 3.11+"
  frameworks: "FastAPI, Pydantic v2, SQLAlchemy 2.0"
  architecture: "Clean Architecture + Repository Pattern + AsyncIO"
  testing: "Pytest + Pytest-AsyncIO"
---

# 🐍 Python: Expert Modern Python & FastAPI Skill

This skill provides complete Python engineering intelligence for production-grade, async-safe, and cleanly structured Python backends, APIs, and microservices.

---

## 🧭 Workspace Integration & Synchronization

When working within an active project, this skill synchronizes with the workspace workflows:
- 📖 **Master Protocol**: `[python.md](../../workflows/python.md)`
- ⚡ **API & Schema Standards**: `[python-api.md](../../workflows/python-api.md)`
- 🏛️ **Architecture & Data**: `[python-architecture.md](../../workflows/python-architecture.md)`
- 🧠 **Memory & State**: `[Memory.md](../../workflows/Memory.md)`
- ✅ **Audit Log**: `[done.md](../../workflows/done.md)`
- 🗺️ **Roadmap**: `[Phases.md](../../workflows/Phases.md)`

> ⚡ **Mandatory Execution Rule**: After completing every endpoint, service, database migration, bug fix, or milestone, the AI must automatically update `Memory.md`, `done.md`, and `Phases.md`.

---

## ⚡ Core Philosophy & Guardrails

1. **Async-First & Non-Blocking**:
   - All I/O operations (database access, HTTP client calls, file reads) must be asynchronous using `async` / `await`.
   - Never use blocking synchronous libraries inside async event loops.

2. **Clean Layered Architecture**:
   - `Routers` handle HTTP request/response serialization via Pydantic.
   - `Services` encapsulate business logic and transactions.
   - `Repositories` interact with database models via SQLAlchemy.

3. **Strict Type Annotations**:
   - Fully annotate all function signatures, parameters, and return types (PEP 484).
   - Use union types (`str | None`), generic collections (`list[Item]`, `dict[str, Any]`).

4. **Zero Dummy/Simulated Logic**:
   - Persist data in real database tables or structured storage. Never return fake hardcoded responses.

---

## 🏗️ Production Code Templates

### 1. Application Entrypoint (`app/main.py`)
```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager
from app.core.config import settings
from app.api.v1.router import api_v1_router
from app.db.session import engine

@asynccontextmanager
async def lifespan(app: FastAPI):
    yield
    await engine.dispose()

app = FastAPI(
    title=settings.PROJECT_NAME,
    lifespan=lifespan,
    docs_url="/docs" if settings.DEBUG else None
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(api_v1_router, prefix="/api/v1")
```

### 2. Service Layer with Transaction Management
```python
from uuid import UUID
from app.repositories.item_repository import ItemRepository
from app.schemas.item import ItemCreate, ItemResponse
from app.models.item import ItemModel
from fastapi import HTTPException, status

class ItemService:
    def __init__(self, repository: ItemRepository) -> None:
        self.repository = repository

    async def get_item(self, item_id: UUID) -> ItemResponse:
        item = await self.repository.get_by_id(item_id)
        if not item:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Item with ID {item_id} not found"
            )
        return ItemResponse.model_validate(item)

    async def create_item(self, payload: ItemCreate) -> ItemResponse:
        entity = ItemModel(
            title=payload.title,
            description=payload.description
        )
        saved_entity = await self.repository.create(entity)
        return ItemResponse.model_validate(saved_entity)
```

### 3. Pytest Async Testing Recipe
```python
import pytest
from httpx import AsyncClient, ASGITransport
from app.main import app

@pytest.mark.asyncio
async def test_create_item_endpoint():
    async with AsyncClient(
        transport=ASGITransport(app=app),
        base_url="http://test"
    ) as client:
        response = await client.post(
            "/api/v1/items/",
            json={"title": "Test Task", "description": "Automated verification"}
        )
        assert response.status_code == 201
        data = response.json()
        assert data["title"] == "Test Task"
        assert "id" in data
```

