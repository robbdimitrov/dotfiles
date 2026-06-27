# Dotfiles Project Guidelines

## Core Principles
- **Commit Messages**: Always format git commit messages following the Conventional Commits specification.
- **Portability**: Avoid hardcoding absolute user paths (use `~` or `$HOME` instead of `/Users/username`).
- **Dependencies**: Whenever introducing a new system-level dependency or application, ensure it is added to the `Brewfile`.
- **Shell Scripts**: Ensure all shell scripts (like `install.sh`) are kept idempotent so they can be run multiple times safely.
- **Engineering Principles**: Apply KISS, DRY, and YAGNI. Every little piece of config, alias, and function must be pulling its own weight—avoid bloat.

## Workflow
- Before suggesting complex changes, ensure the relevant tool's configuration syntax is respected (e.g. keeping Ghostty configs valid, respecting VSCode JSON structures).
- Respect the existing minimalist styling and native integration choices (e.g. using native tabs over custom ones).
