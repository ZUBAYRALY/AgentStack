---
name: prd
description: Product Requirements Document template defining project vision, feature modules, data flow, non-functional requirements, and scope.
user-invocable: true
argument-hint: "[project-name] [module-spec]"
---

# 📄 Product Requirements Document (PRD.md)

**Project Name**: `[Project Name / To Be Defined]`  
**Status**: `[Draft / Active / In Planning]`  
**Last Updated**: `[YYYY-MM-DD]`

---

## 1. Executive Summary & Project Vision

### 1.1 Mission & Value Proposition
`[Describe what the application does, who it serves, and what core problem it solves in 2-3 concise sentences.]`

### 1.2 Core Problem Statement
- **Problem**: `[Explain the specific pain point or inefficiency the target user faces.]`
- **Solution**: `[Explain how this application solves that problem cleanly and reliably.]`

### 1.3 Target Users & Personas
- **Primary Persona**: `[e.g., Solo Entrepreneur / Agency Owner / Internal Admin / End Customer]`
- **Key Use Cases**:
  - `[Use case 1]`
  - `[Use case 2]`
  - `[Use case 3]`

---

## 2. Core Functional Requirements & Feature Modules

### Module 1: `[Module Name / e.g., Dashboard & Analytics]`
- **Purpose**: `[Brief summary of what this module accomplishes]`
- **Key Features**:
  - `[Feature 1: Description]`
  - `[Feature 2: Description]`
  - `[Feature 3: Description]`
- **User Actions**: `[e.g., View summary metrics, filter by date range, export report]`
- **Acceptance Criteria**:
  - [ ] Real data displayed from database (zero simulated or dummy metrics).
  - [ ] Proper loading skeleton and empty state handled.

### Module 2: `[Module Name / e.g., Core Entity Management / CRUD]`
- **Purpose**: `[Brief summary of what this module accomplishes]`
- **Key Features**:
  - `[Feature 1: Description]`
  - `[Feature 2: Description]`
- **User Actions**: `[e.g., Create new entity, edit existing entity, filter/search list, delete entity]`
- **Acceptance Criteria**:
  - [ ] Validation on all input fields.
  - [ ] Immediate persistence in database with confirmed feedback toast.

### Module 3: `[Module Name / e.g., User Settings & Configuration]`
- **Purpose**: `[Brief summary of what this module accomplishes]`
- **Key Features**:
  - `[Feature 1: Profile & Preferences]`
  - `[Feature 2: API Keys / Credentials / Integrations]`
- **Acceptance Criteria**:
  - [ ] Secure storage of credentials.
  - [ ] Instant update with zero page reload required.

*(Add additional modules as needed for the specific project)*

---

## 3. Data Flow & Core Entities

| Entity / Model | Description | Key Relationships |
| :--- | :--- | :--- |
| `[Entity 1]` | `[Description of entity 1]` | `[Relationships, e.g., belongs to User]` |
| `[Entity 2]` | `[Description of entity 2]` | `[Relationships]` |
| `[Entity 3]` | `[Description of entity 3]` | `[Relationships]` |

---

## 4. Non-Functional Requirements

### 4.1 Performance & Resource Targets
- **Web**: Standard API responses < 300-500ms; frontend initial page load < 1.8s; zero layout shifts (CLS < 0.1).
- **Mobile (Android)**: Cold app startup < 1.5s; 60-120fps smooth scrolling with zero frame drops; memory footprint optimized for 3-4 GB RAM devices.
- **Python Services**: Async non-blocking I/O; sub-200ms serialization for standard JSON endpoints.

### 4.2 Security & Data Integrity
- **Credential Protection**: Zero secrets in source code or client bundles. `.env` and `local.properties` strictly ignored in version control.
- **Transport Security**: Mandatory TLS 1.2/1.3. Android enforces `android:usesCleartextTraffic="false"`.
- **Injection Shields**: 100% parameterized queries (Prisma, async SQLAlchemy, Room). Complete schema validation via Zod / Pydantic.
- **Storage Safety**: Passwords hashed with `bcrypt`/`argon2`. Mobile tokens encrypted with `EncryptedSharedPreferences`. Android backup disabled (`android:allowBackup="false"`).
- **Network Boundaries**: SSRF defense blocking private IP probing. Explicit CORS policies in production.

### 4.3 Reliability & Usability
- **Honest State Handling**: Clear, resilient states for Loading, Empty, Error (with retry trigger), and Content.
- **Multi-Device Responsiveness**: Verified seamless layouts across Mobile, Tablet, Laptop, and Desktop viewports.

---

## 5. Scope Boundaries (Out of Scope)
- `[Explicitly list what the application will NOT do in early versions to avoid scope creep.]`

---

## 6. The Reality Rule & Definition of Success
- **No Dummy Data**: All UI displays must reflect real persisted database records or honest empty states.
- **No Fake Success**: Operations are only marked successful when confirmed by backend database persistence.
- **Evidence-Based Logic**: Metrics, rankings, and calculations must be traceable to real data sources.
