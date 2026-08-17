# Global rules

Safe to publish. This file is tracked in a **public** repo (`twslade/dotfiles`), so it
contains no addresses, emails, employer names or domains. Those live in
`~/.claude/CLAUDE.local.md`, which is gitignored.

@~/.claude/CLAUDE.local.md

---

# 0 · CONTEXT — personal or work? Decide first.

Almost every specific rule lives in one of two knowledge bases, and **each carries its
own `CLAUDE.md` which loads automatically when you are inside it.**

| | Personal / home | Work |
|---|---|---|
| **Knowledge base** | `~/knowledge-base/` | `~/knowledge-base-work/` |
| **Rules** | `~/knowledge-base/CLAUDE.md` | `~/knowledge-base-work/CLAUDE.md` |
| **Code** | `~/git/media-stack`, `~/git/water-bot`, `~/git/flashcard-game`, dotfiles | `~/git/elevar*`, `~/git/remix-cloudflare-workers.*` |
| **Task tracker** | Home Assistant `todo.projects` | Linear |
| **Subjects** | house, yard, HVAC, water, sensors, vehicles, personal finance, health | attribution, pipelines, PRs, releases, epics, partner calls |

🔴 **Directory name beats git remote.** Several work worktrees report the *dotfiles*
remote because they sit inside it. An `elevar` prefix means WORK regardless.

## 🔴 Start the session in the right directory
`CLAUDE.md` is only loaded from the working directory and its parents. Running from `~`
loads **this file only** and none of the context-specific rules.

**So: `cd ~/knowledge-base && claude` for home work, `cd ~/knowledge-base-work && claude`
for work.** If a session starts at `~` and turns out to be about one of them, read that
knowledge base's `CLAUDE.md` before doing anything substantive.

⚠ **One topic per session.** A 234-prompt, 12-day session covering six unrelated topics
caused three real failures: facts established on day one were summarised away, a
deleted config file went unnoticed for two days, and a fact already on file had to be
re-supplied by hand. Start a new session when the topic changes — cross-session memory
carries the facts.

⚠ **If the context is genuinely ambiguous, ask. One sentence.** The two sides have
different trackers, tone rules and privacy expectations. Guessing wrong puts personal
data in a work tool or the reverse.

---

# Communication
Be **extremely concise**. Sacrifice grammar for concision. No AI fluff. No em dashes.
No clever framing ("change the calculus", "your hunch was right"). Do not restate my
question before answering it.

⚠ **Tell me when I am wrong, and when you are.** I have corrected you more than once and
it improved the outcome every time. Flag uncertainty rather than smoothing it over.
State the confidence level of a measurement, not just the number.

# Clipboard
Whenever you give me a shell command **I** need to run (interactive `sudo`, an external
login, anything to paste elsewhere), copy it with `printf '<command>' | wl-copy`.
Do this without being asked.

# Shell on this machine — every one of these has bitten
🔴 **zsh, and `nomatch` aborts the whole command.** An unmatched glob is a hard error,
not an empty result. `ls README*` and `grep --include=*.yaml` both died this way.
**Quote every glob**: `--include='*.yaml'`, or append `2>/dev/null || true`.

🔴 **`grep` is `ugrep`.** Flag parsing differs — `-m1 -E`, never `-mE1`.

🔴 **Never inline a heredoc containing an apostrophe inside a single-quoted `ssh`
command.** `it's` and `Let's` each closed the outer quote and produced a parse error.
**Write the script to a file, `scp` it, run it.** Applies to python, commit messages
and YAML bodies alike.

⚠ **`python3` is mise-managed**, currently 3.14.x. Its `pip` works; the system python is
PEP 668 externally-managed. `PyYAML` is installed for it — `~/knowledge-base/bin/kb-index`
needs it.

⚠ Prefer `python3` over shell pipelines for parsing JSON or doing arithmetic.

# Git and GitHub
Use the `gh` CLI. Commit or push only when asked. On a shared repo, branch first.

🔴 **Before committing, check the target repo's visibility.** `twslade/dotfiles` is
**public**. Everything else personal is private. Never commit an identifier, address or
credential to a public repo — and never assume a file is already committed just because
it exists in the working tree.

# Scheduling
**ALWAYS ASSIGN A TIME, never a bare date.** Check both calendars for conflicts before
proposing one; details in `CLAUDE.local.md`.
