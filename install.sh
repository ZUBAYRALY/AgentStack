#!/usr/bin/env bash
set -euo pipefail

TAR_URL="https://github.com/ZUBAYRALY/AgentStack/archive/refs/heads/main.tar.gz"
GLOBAL_SKILLS_DIR="$HOME/.gemini/config/skills"
TARGET_PROJECT="${1:-}"
TEMP_DIR=""

cleanup() {
  if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT

echo ""
echo "========================================================"
echo "  AgentStack - Cross-Platform Skills Installer (Unix)   "
echo "========================================================"
echo ""

SCRIPT_DIR=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi

if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/.agent/skills" ]; then
  SOURCE_SKILLS_DIR="$SCRIPT_DIR/.agent/skills"
elif [ -d "./.agent/skills" ]; then
  SOURCE_SKILLS_DIR="$(pwd)/.agent/skills"
else
  echo "Downloading AgentStack skills package..."
  TEMP_DIR="$(mktemp -d)"
  curl -fsSL "$TAR_URL" | tar -xz -C "$TEMP_DIR"
  EXTRACTED_ROOT="$(find "$TEMP_DIR" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  SOURCE_SKILLS_DIR="$EXTRACTED_ROOT/.agent/skills"
  if [ ! -d "$SOURCE_SKILLS_DIR" ]; then
    echo "[ERROR] Could not locate .agent/skills in downloaded archive."
    exit 1
  fi
fi

mkdir -p "$GLOBAL_SKILLS_DIR"

# Remove any legacy uppercase duplicate folders
for legacy in Architecture Design Memory Phases PRD Rules; do
  if [ -d "$GLOBAL_SKILLS_DIR/$legacy" ]; then
    rm -rf "${GLOBAL_SKILLS_DIR:?}/$legacy"
  fi
done

echo "Installing skills globally to: $GLOBAL_SKILLS_DIR"
echo ""

count=0
for skill_path in "$SOURCE_SKILLS_DIR"/*/; do
  skill_name="$(basename "$skill_path")"
  rm -rf "${GLOBAL_SKILLS_DIR:?}/$skill_name"
  cp -R "$skill_path" "$GLOBAL_SKILLS_DIR/$skill_name"
  printf "  [OK] /%-20s -> Installed\n" "$skill_name"
  count=$((count + 1))
done

# Clean up deprecated global workflows if present
for wf_dir in "$HOME/.gemini/config/workflows" "$HOME/.gemini/config/global_workflows"; do
  if [ -d "$wf_dir" ]; then
    rm -rf "$wf_dir"
    echo "  [CLEANED] Removed deprecated folder: $wf_dir"
  fi
done

# Optional: Install into a target project workspace if provided
if [ -n "$TARGET_PROJECT" ]; then
  TARGET_SKILLS_DIR="$TARGET_PROJECT/.agent/skills"
  echo ""
  echo "Installing skills into project workspace: $TARGET_SKILLS_DIR"
  mkdir -p "$TARGET_SKILLS_DIR"
  cp -R "$SOURCE_SKILLS_DIR"/* "$TARGET_SKILLS_DIR"/
  echo "  [OK] Copied all $count skills to $TARGET_SKILLS_DIR"
fi

echo ""
echo "========================================================"
echo "  SUCCESS: $count AgentStack Skills Installed Globally!"
echo "========================================================"
echo "Global Path : $GLOBAL_SKILLS_DIR"
echo "Usage       : Open Antigravity IDE in any project and type /project, /droid, /webstack, /python, etc."
echo ""
