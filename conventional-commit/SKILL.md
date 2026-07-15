---
name: conventional-commits
description: Create or review Git commit messages that follow Conventional Commits 1.0.0, including provider-aware issue, ticket, work-item, review, and workflow references. Use when committing code, proposing a commit message, reviewing commit history, or adding host-specific references for GitHub, GitLab, Azure DevOps, Gerrit, Bitbucket, Gitea, Forgejo/Codeberg, or Phabricator.
---

# Conventional Commits

Write and review commit messages that follow Conventional Commits 1.0.0. Keep the header focused on the code change and place issue, ticket, work-item, or review metadata after the body.

## Required shape

```text
<type>[optional scope][!]: <description>

[optional body]

[optional provider directive or footer(s)]
```

Apply these rules:

- Use `feat` for a new feature and `fix` for a bug fix.
- Use another suitable type when appropriate: `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, or `revert`.
- Use a concise noun as the optional scope, representing the smallest meaningful code area.
- Write the description in imperative, present tense.
- Use the body for context, rationale, constraints, and important implementation details.
- Mark a breaking change with `!` in the header or a `BREAKING CHANGE:` footer.
- Keep commits atomic when possible.
- Do not use a ticket number as the scope or as a replacement for the code-focused description.

## Provider-aware workflow

Before adding a ticket or issue reference:

1. Inspect the repository remote when available, preferably with `git remote get-url --all origin`.
2. Detect the provider using the hostname and URL clues below.
3. Read the matching provider reference file before selecting syntax.
4. Determine whether the reference is for traceability only or should change ticket state.
5. Prefer a neutral reference unless the user clearly wants automatic closure or transition.
6. Keep provider-specific text after the body. Use a valid Git trailer when the provider supports one; otherwise use a final provider directive paragraph.
7. If the provider or instance behavior is ambiguous, avoid state-changing keywords and use a neutral reference.

## Provider detection

Use exact hostname matches before heuristics.

| Provider | Strong hostname or URL signals | Reference |
|---|---|---|
| Azure DevOps | `dev.azure.com`, `ssh.dev.azure.com`, `*.visualstudio.com`, path `/_git/` | `references/azure-devops.md` |
| GitHub | `github.com`, `*.ghe.com`; self-hosted GitHub Enterprise often exposes `/api/v3` | `references/github.md` |
| GitLab | `gitlab.com`; self-managed URLs often contain `/-/issues/` or `/-/merge_requests/` | `references/gitlab.md` |
| Gerrit | SSH port `29418`, `/ssh_info`, pushes to `refs/for/<branch>`, often `review.*` or `gerrit.*` | `references/gerrit.md` |
| Bitbucket Cloud | `bitbucket.org` | `references/bitbucket-cloud.md` |
| Bitbucket Data Center/Server | Custom host with `/projects/<key>/repos/<repo>` or clone path `/scm/<key>/<repo>.git` | `references/bitbucket-data-center.md` |
| Gitea | `gitea.com`; self-hosted instances often expose `/api/v1` and Gitea branding | `references/gitea.md` |
| Forgejo / Codeberg | `codeberg.org`; self-hosted instances expose Forgejo branding and commonly `/api/v1` | `references/forgejo.md` |
| Phabricator | `secure.phabricator.com`; self-hosted URLs and UI use `T123`, `D123`, Diffusion, Differential, or Maniphest | `references/phabricator.md` |

Self-hosted GitHub, GitLab, Gitea, Forgejo, Bitbucket, Gerrit, and Phabricator may use arbitrary hostnames. Do not infer the provider from a generic `/<owner>/<repo>` path alone. Use repository metadata, API paths, UI clues, configuration, or explicit user context. If still unknown, use only a neutral generic trailer such as `Refs: <ticket-id>`.

## Reference intent

### Traceability only

Use a neutral form for partial work, refactors, backports, related changes, unknown merge targets, or uncertain instance configuration.

```text
fix(auth): prevent duplicate callback processing

Refs: #123
```

### Automatic closure or transition

Use a state-changing provider keyword only when all of these are true:

- The change fully resolves the tracked item.
- The provider documents the keyword for the relevant integration.
- The commit or pull request will reach the branch on which automation is evaluated.

```text
fix(auth): prevent duplicate callback processing

Closes #123
```

Do not assume that `Fixes`, `Closes`, or `Resolves` behaves identically across providers.

## Special cases

- Preserve an existing Gerrit `Change-Id:` when amending a commit. Do not invent or manually alter it unless explicitly required.
- Treat Jira Smart Commit commands as state-changing automation. Use them only when Jira integration is known and the user intends the action.
- Treat GitLab, Gitea, Forgejo, and Phabricator self-hosted keyword behavior as configurable.
- Distinguish Azure Repos work-item syntax from GitHub repositories connected to Azure Boards.
- Repeat a closing directive for each item when provider documentation requires it; do not assume one keyword applies to a comma-separated list.

## Output

Return only the finished commit message, ready to copy. Do not add explanations, markdown fences, alternatives, or commentary unless the user explicitly asks for analysis or review.

For general examples and edge cases, read `references/commit-examples.md`.
