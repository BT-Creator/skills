# Forgejo and Codeberg commit-message integration

## Detect

Strong signals:

- `codeberg.org`
- Forgejo branding on a self-hosted instance
- REST API base commonly ending in `/api/v1`
- A custom domain or subpath with repository path `/{owner}/{repository}`

Forgejo originated as a Gitea fork and many issue-reference conventions are compatible, but instance configuration and version can differ. Do not identify Forgejo solely from a GitHub-like repository path.

## Recommended policy

Use neutral references by default:

```text
fix(cache): avoid stale reads after eviction

Refs: #123
```

For cross-repository references, use the instance-supported form, commonly:

```text
Refs: owner/repository#123
```

Use closing or reopening keywords only after confirming the Forgejo instance recognizes them. Common compatible forms are:

```text
Closes #123
```

```text
Fixes owner/repository#123
```

```text
Reopens #123
```

## Codeberg guidance

Treat `codeberg.org` as Forgejo. Prefer neutral references unless the change fully resolves the issue and the repository's contribution guidance expects automatic closure.

## Caveats

- Actionable keyword lists may be configurable.
- A self-hosted instance may lag or diverge from Gitea-compatible behavior.
- External issue trackers may use repository-specific autolink patterns.
- When exact behavior is unknown, keep the ticket identifier in `Refs:` and avoid state-changing verbs.

## Sources

- Forgejo Documentation: https://forgejo.org/docs/
- Codeberg Documentation: https://docs.codeberg.org/
- Gitea compatibility reference, Automatically linked references: https://docs.gitea.com/usage/automatically-linked-references
