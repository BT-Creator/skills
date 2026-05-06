---
name: conventional-commits
description: This skill should be used when creating Git commits to ensure they follow the Conventional Commits specification. It provides guidance on commit message structure, types, scopes, and best practices for writing clear, consistent, and automated-friendly commit messages. Use when committing code changes or reviewing commit history.
---

# Conventional Commits

This skill helps write and review Git commits that follow Conventional Commits 1.0.0.

## Purpose

Conventional Commits adds human- and machine-readable meaning to commit messages. It makes commit history easier to read, automate, and map to semantic versioning.

## Use This Skill

Use this skill when:
- Creating Git commits
- Reviewing commit messages in PRs
- Writing clear, structured commit messages
- Collaborating on projects with multiple contributors

## Spec Requirements

The commit message MUST follow this structure:

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit MUST be prefixed with a type, followed by a colon and a space.

- `feat` MUST be used for a new feature.
- `fix` MUST be used for a bug fix.
- Other types MAY be used, such as `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, and `revert`.
- An optional scope MAY appear after the type, in parentheses, to identify the code area.
- The description MUST immediately follow the prefix and SHOULD be a short summary of the change.
- A body MAY be added after one blank line.
- A footer MAY be added after one blank line after the body.
- Each footer line MUST use a token followed by `: ` or ` #`, for example `Refs: #123` or `Reviewed-by: Jane Doe`.
- Footer tokens MUST use `-` instead of spaces, except `BREAKING CHANGE`, and `BREAKING-CHANGE` is a valid synonym.
- Breaking changes MUST be marked either with `!` before the colon in the type/scope prefix or with a `BREAKING CHANGE:` footer.
- If `!` is used, the `BREAKING CHANGE:` footer MAY be omitted. The description SHOULD make the breaking change clear.
- With the exception of `BREAKING CHANGE`, the specification treats commit elements as case-insensitive.

## Recommendations

- Prefer imperative, present-tense descriptions.
- Keep the first line concise.
- Use the body for context and rationale, not a restatement of the diff.
- Keep commits atomic when possible.
- Use a scope noun that matches the smallest meaningful part of the codebase.
- In this repository, follow any additional ticket-tag or PR-linking conventions required by the team.

## Quick Shape

```text
<type>(<scope>): <description>

[body]

[footer]
```

For examples and edge cases, see `references/commit-examples.md`.
