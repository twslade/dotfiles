# Clipboard
Whenever you give me a shell command I need to run myself (e.g. anything requiring `sudo` interactively, an external login, or a command I should paste elsewhere), copy it to my clipboard via `printf '<command>' | xsel -ib`. Do this without being asked.

# Git
Use gh cli tool for interfacing with Github.
# graphify
- **graphify** (`~/.claude/skills/graphify/SKILL.md`) - any input to knowledge graph. Trigger: `/graphify`
When the user types `/graphify`, invoke the Skill tool with `skill: "graphify"` before doing anything else.
