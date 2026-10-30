---
description: Python Clean Architecture, Data Layer & Repository Protocol
---

# 🏛️ Python Architecture Protocol – Clean Architecture & Data Layer

This sub-workflow establishes the architectural separation, repository design patterns, async SQLAlchemy 2.0 ORM practices, and background task processing in Python.

---

## 🏗️ 1. Layered Architecture (Separation of Concerns)

Maintain strict boundary separation:

```
┌────────────────────────────────────────────────────────┐
│                   API / ROUTER LAYER                   │
│   FastAPI Routers & Controllers                        │
│   (Parses HTTP requests, validates Pydantic schemas)   │
└──────────────────────────┬─────────────────────────────┘
                           │ Calls Service Layer
                           ▼
┌────────────────────────────────────────────────────────┐
│                 SERVICE / BUSINESS LAYER               │
│   Business logic, orchestrations, policy enforcement    │
└──────────────────────────┬─────────────────────────────┘
                           │ Calls Repository Layer
                           ▼
┌────────────────────────────────────────────────────────┐
│                 DATA / REPOSITORY LAYER                │
│   Async SQLAlchemy 2.0 / Alembic                       │
│   (CRUD operations, DB session management, queries)    │
└──────────────────────────┬─────────────────────────────┘
                           │
                           ▼
┌────────────────────────────────────────────────────────┐
│              PERSISTENCE & EXTERNAL SERVICES           │
│   PostgreSQL / SQLite / Redis / External REST APIs     │
└────────────────────────────────────────────────────────┘
```

---

## 💾 2. Repository Pattern & Async SQLAlchemy 2.0

1. **Async Repository Interface**:
   ```python
   from sqlalchemy.ext.asyncio import AsyncSession
   from sqlalchemy import select
   from uuid import UUID
   from app.models.item import ItemModel

   class ItemRepository:
       def __init__(self, session: AsyncSession) -> None:
           self.session = session

       async def get_by_id(self, item_id: UUID) -> ItemModel | None:
           result = await self.session.execute(
               select(ItemModel).where(ItemModel.id == item_id)
           )
           return result.scalar_one_or_none()

       async def list_all(self, skip: int = 0, limit: int = 50) -> list[ItemModel]:
           result = await self.session.execute(
               select(ItemModel).offset(skip).limit(limit)
           )
           return list(result.scalars().all())

       async def create(self, item: ItemModel) -> ItemModel:
           self.session.add(item)
           await self.session.flush()
           await self.session.refresh(item)
           return item
   ```

2. **SQLAlchemy 2.0 Declarative Models**:
   - Use `Mapped` and `mapped_column` type annotations:
   ```python
   from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column
   from sqlalchemy import String, DateTime, func
   from uuid import UUID, uuid4
   from datetime import datetime

   class Base(DeclarativeBase):
       pass

   class ItemModel(Base):
       __tablename__ = "items"

       id: Mapped[UUID] = mapped_column(primary_key=True, default=uuid4)
       title: Mapped[str] = mapped_column(String(120), nullable=False)
       description: Mapped[str | None] = mapped_column(String(500), nullable=True)
       created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now())
   ```

---

## ⚙️ 3. Settings & Environment Configuration

1. Manage settings via `pydantic-settings`:
   ```python
   from pydantic_settings import BaseSettings, SettingsConfigDict

   class Settings(BaseSettings):
       PROJECT_NAME: str = "Python Core Service"
       DATABASE_URL: str
       DEBUG: bool = False

       model_config = SettingsConfigDict(env_file=".env", extra="ignore")

   settings = Settings()
   ```

---

## 🔄 4. Alembic Migrations Protocol

- Keep migrations versioned in `alembic/versions/`.
- Ensure all models inherit from the common `Base` so `alembic revision --autogenerate` detects schema modifications accurately.

---

## 🔒 5. Python Security & Database Safety Standards

1. **SQL Injection Shield**:
   - 🚫 **Never** concatenate strings into SQL queries:
     `# FORBIDDEN: session.execute(text(f"SELECT * FROM items WHERE title = '{user_input}'"))`
   - ✅ **Always** use SQLAlchemy 2.0 parameterized criteria:
     `await session.execute(select(ItemModel).where(ItemModel.title == user_input))`

2. **Secure Password Hashing**:
   - Hash all passwords using `passlib.context.CryptContext` with `bcrypt`:
   ```python
   from passlib.context import CryptContext

   pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

   def hash_password(password: str) -> str:
       return pwd_context.hash(password)

   def verify_password(plain_password: str, hashed_password: str) -> bool:
       return pwd_context.verify(plain_password, hashed_password)
   ```

3. **SSRF Guard on Outbound Requests**:
   - When fetching external URLs using `httpx`, validate host against private/internal IP ranges (`127.0.0.1`, `10.0.0.0/8`, `192.168.0.0/16`, `169.254.169.254`) before sending requests.

4. **Multi-Tenant Ownership Scoping**:
   - Scope every CRUD query by authenticated `user_id` or `workspace_id`:
   ```python
   stmt = select(ItemModel).where(
       ItemModel.id == item_id,
       ItemModel.user_id == current_user.id
   )
   ```

