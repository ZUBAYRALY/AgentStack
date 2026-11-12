# Legacy Workflows (`legacy-workflows/`)

This folder preserves the classic **AgentStack v1 `.agent/workflows/*.md`** files for users or environments that still use legacy workflow markdown files instead of the modern `.agent/skills/<name>/SKILL.md` system.

## Included Legacy Workflow Files (18)

- `project.md`
- `PRD.md`
- `Architecture.md`
- `Design.md`
- `Rules.md`
- `Phases.md`
- `Memory.md`
- `done.md`
- `webstack.md`, `webstack-frontend.md`, `webstack-backend.md`
- `droid.md`, `droid-ui.md`, `droid-architecture.md`, `baseline-profile.md`
- `python.md`, `python-api.md`, `python-architecture.md`

## How to Use Legacy Workflows

If you specifically need the old `.agent/workflows/` structure in a project:

```powershell
# Windows PowerShell
New-Item -ItemType Directory -Path "Path\To\YourProject\.agent\workflows" -Force
Copy-Item "legacy-workflows\*.md" -Destination "Path\To\YourProject\.agent\workflows\" -Force
```

```bash
# macOS / Linux
mkdir -p /path/to/your-project/.agent/workflows
cp legacy-workflows/*.md /path/to/your-project/.agent/workflows/
```

> **Recommended:** For modern **Google Antigravity IDE**, **Claude Code**, and **Cursor** setups, use the root 1-click installer (`install.bat` / `install.ps1` / `install.sh`), which installs all **25 modern skills** directly from `.agent/skills/`.
