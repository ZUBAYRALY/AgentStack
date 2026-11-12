# ⚡ AgentStack v2.0.0 — Modern Skills Engine & Cross-Platform 1-Click Installer

AgentStack **v2.0.0** migrates all legacy `.agent/workflows/*.md` files into **25 autonomous, slash-invocable skills** under `.agent/skills/<name>/SKILL.md`, introduces **1-Click / 1-Line installers** across Windows, macOS, and Linux, and preserves all classic v1 workflow files inside `legacy-workflows/`.

---

## ✨ What's New in v2.0.0

### 1. 🧩 25 Autonomous & Slash-Invocable Skills (`.agent/skills/`)
All engineering protocols, trackers, and companion modules now support both **automatic semantic agent discovery** and **direct `/slash` commands**:
- **Core Stack Skills:** `/webstack`, `/webstack-frontend`, `/webstack-backend`, `/droid`, `/droid-ui`, `/droid-architecture`, `/baseline-profile`, `/python`, `/python-api`, `/python-architecture`
- **Project & Memory Trackers:** `/project`, `/prd`, `/architecture`, `/design`, `/rules`, `/phases`, `/memory`, `/done`
- **Design, Animation & SEO Engines:**
  - `/ui-ux-pro-max` — Integrated with [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) (67+ UI styles, 96 palettes, 13 tech stacks including `jetpack-compose`)
  - `/motion` — Powered by [motiondivision/motion](https://github.com/motiondivision/motion) (`motion/react` spring physics & layout transitions)
  - `/seo` — Powered by [AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo) (24 sub-skills & GEO)
- **Communication & Productivity Skills:** `/human-writing` (natural, cliché-free writing protocol), `/freelancing` (Upwork/Fiverr profile & proposal engine), `/exonalgos` (cross-repo code migration), `/github-release` (Android release & EULA automation)

### 2. 🚀 Cross-Platform One-Click & One-Line Installers
Install all **25 skills** globally (`~/.gemini/config/skills/`) in one step on any fresh OS:
- **Windows (1-Line PowerShell):**
  ```powershell
  irm https://raw.githubusercontent.com/ZUBAYRALY/AgentStack/main/install.ps1 | iex
  ```
- **macOS & Linux (1-Line Terminal):**
  ```bash
  curl -fsSL https://raw.githubusercontent.com/ZUBAYRALY/AgentStack/main/install.sh | bash
  ```
- **Local GUI / Script Installers:**
  - `install.bat` (Windows double-click + drag-and-drop project install)
  - `install.command` (macOS Finder double-click)
  - `install.ps1`, `install.sh`, and `install.py` (Universal Python installer)

### 3. 📦 Classic Workflows Preserved (`legacy-workflows/`)
All 18 classic v1 `.md` workflow files remain available in the [`legacy-workflows/`](./legacy-workflows) folder for users who still want the legacy `.agent/workflows/*.md` layout.
