---
description: Python API, FastAPI & Schema Validation Protocol
---

# ⚡ Python API Protocol – FastAPI & Schema Validation

This sub-workflow governs REST API design, Pydantic v2 schema validation, request/response models, middleware, and dependency injection in Python applications.

---

## 🏛️ 1. API Architecture & Modular Routers

1. **APIRouter Organization**:
   - Organize routes by resource under `app/api/v1/endpoints/`:
   ```python
   from fastapi import APIRouter, Depends, status
   from app.schemas.item import ItemCreate, ItemResponse
   from app.services.item_service import ItemService
   from app.api.deps import get_item_service

   router = APIRouter(prefix="/items", tags=["Items"])

   @router.post("/", response_model=ItemResponse, status_code=status.HTTP_201_CREATED)
   async def create_item(
       payload: ItemCreate,
       service: ItemService = Depends(get_item_service)
   ) -> ItemResponse:
       return await service.create(payload)
   ```

2. **Standard API Response Format**:
   - Keep success and error envelopes uniform:
   ```json
   {
     "success": true,
     "data": { ... },
     "message": "Resource created successfully"
   }
   ```

---

## 📋 2. Pydantic v2 Validation Schemas

1. **Strict Types & Separation of Concerns**:
   - Maintain separate schemas for `Create`, `Update`, and `Response` representations:
   ```python
   from pydantic import BaseModel, ConfigDict, Field
   from datetime import datetime
   from uuid import UUID

   class ItemBase(BaseModel):
       title: str = Field(..., min_length=2, max_length=120)
       description: str | None = Field(default=None, max_length=500)

   class ItemCreate(ItemBase):
       pass

   class ItemUpdate(BaseModel):
       title: str | None = Field(default=None, min_length=2, max_length=120)
       description: str | None = None

   class ItemResponse(ItemBase):
       id: UUID
       created_at: datetime
       updated_at: datetime

       model_config = ConfigDict(from_attributes=True)
   ```

2. **Zero Dummy/Simulated Responses**:
   - Endpoints must validate payloads against schemas and persist to real database tables before responding.

---

## 💉 3. Dependency Injection & Error Handling

1. **Clean Dependencies**:
   - Inject database sessions and business services via `Depends`:
   ```python
   async def get_db() -> AsyncGenerator[AsyncSession, None]:
       async with async_session_factory() as session:
           try:
               yield session
               await session.commit()
           except Exception:
               await session.rollback()
               raise
   ```

2. **Structured Error Handling**:
   - Map domain exceptions to standardized HTTP responses:
   - `400 Bad Request` for invalid business operations
   - `401 Unauthorized` / `403 Forbidden` for permissions
   - `404 Not Found` for missing database records
   - `422 Unprocessable Entity` automatically handled by Pydantic

---

## 🔒 4. Authentication, Authorization & Security Middlewares

1. **OAuth2 Bearer Token Extraction**:
   ```python
   from fastapi.security import OAuth2PasswordBearer
   from fastapi import Depends, HTTPException, status
   import jwt

   oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/api/v1/auth/login")

   async def get_current_user(token: str = Depends(oauth2_scheme)) -> UserModel:
       try:
           payload = jwt.decode(token, settings.SECRET_KEY, algorithms=["HS256"])
           user_id: str = payload.get("sub")
           if user_id is None:
               raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")
       except jwt.PyJWTError:
           raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Could not validate credentials")
       
       user = await user_repo.get_by_id(user_id)
       if not user or not user.is_active:
           raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="User inactive or not found")
       return user
   ```

2. **Strict Production CORS Middleware**:
   ```python
   # Explicit allowed origins in production (Never wildcard '*' with credentials)
   app.add_middleware(
       CORSMiddleware,
       allow_origins=settings.ALLOWED_CORS_ORIGINS, # e.g. ["https://myapp.com"]
       allow_credentials=True,
       allow_methods=["GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
       allow_headers=["Authorization", "Content-Type"],
   )
   ```

