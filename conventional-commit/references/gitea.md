# Gitea commit-message integration

## Detect

Strong signals:

- `gitea.com`
- Gitea branding on a self-hosted instance
- REST API base commonly ending in `/api/v1`
- A custom domain or subpath with repository path `/{owner}/{repository}`

Do not identify Gitea from the repository path shape alone.

## Neutral references

Gitea supports references such as:

- Same repository issue or pull request: `#123`
- Cross-repository issue or pull request: `owner/repository#123`
- Explicit pull request: `!123`
- Cross-repository explicit pull request: `owner/repository!123`

Recommended neutral footer:

```text
fix(cache): avoid stale reads after eviction

Refs: #123
```

## Actionable references

Default closing keyword families:

- `close`, `closes`, `closed`
- `fix`, `fixes`, `fixed`
- `resolve`, `resolves`, `resolved`

Default reopening keyword family:

- `reopen`, `reopens`, `reopened`

Examples:

```text
fix(cache): avoid stale reads after eviction

Closes #123
```

```text
fix(cache): restore invalidation after rollback

Reopens #123
```

Important behavior:

- Site administrators can customize actionable keyword lists.
- Actions may be triggered when commits reach the main branch or through a merged pull request.
- Pull-request descriptions can also contain actionable references.
- Use neutral syntax when self-hosted configuration is unknown.

## Optional time tracking

When enabled, Gitea can parse time after an issue reference with units such as `m`, `h`, `d`, `w`, or `mo`.

```text
fix(cache): avoid stale reads after eviction

Fixes #123 @1.5h
```

Use time directives only when repository policy expects commit-based time tracking.

## Sources

- Gitea Docs, Automatically linked references: https://docs.gitea.com/usage/automatically-linked-references
- Gitea Docs, Reverse proxies and subpaths: https://docs.gitea.com/usage/reverse-proxies
