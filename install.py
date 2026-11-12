#!/usr/bin/env python3
import os
import shutil
import sys
from pathlib import Path

def main() -> int:
    script_dir = Path(__file__).resolve().parent
    source_skills_dir = script_dir / ".agent" / "skills"

    if not source_skills_dir.is_dir():
        print(f"[ERROR] Source skills directory not found: {source_skills_dir}")
        return 1

    global_skills_dir = Path.home() / ".gemini" / "config" / "skills"
    global_skills_dir.mkdir(parents=True, exist_ok=True)

    print("\n========================================================")
    print(f"  AgentStack - Universal Python Installer ({sys.platform})")
    print("========================================================\n")
    print(f"Installing skills globally to: {global_skills_dir}\n")

    skills = sorted([d for d in source_skills_dir.iterdir() if d.is_dir()], key=lambda p: p.name)
    count = 0

    for skill in skills:
        dest = global_skills_dir / skill.name
        if dest.exists():
            shutil.rmtree(dest)
        shutil.copytree(skill, dest)
        print(f"  [OK] /{skill.name:<20} -> Installed")
        count += 1

    if len(sys.argv) > 1:
        target_project = Path(sys.argv[1]).resolve()
        target_skills_dir = target_project / ".agent" / "skills"
        target_skills_dir.mkdir(parents=True, exist_ok=True)
        print(f"\nInstalling skills into project workspace: {target_skills_dir}")
        for skill in skills:
            dest = target_skills_dir / skill.name
            if dest.exists():
                shutil.rmtree(dest)
            shutil.copytree(skill, dest)
        print(f"  [OK] Copied all {count} skills to {target_skills_dir}")

    print("\n========================================================")
    print(f"  SUCCESS: {count} AgentStack Skills Installed Globally!")
    print("========================================================")
    print(f"Global Path : {global_skills_dir}")
    print("Usage       : Open Antigravity IDE in any project and type /project, /droid, /webstack, /python, etc.\n")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
