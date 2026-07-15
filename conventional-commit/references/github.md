# GitHub commit-message integration

## Detect

Strong signals:

- `github.com`
- `*.ghe.com`
- GitHub Enterprise Server on a custom hostname, often with REST API base `/api/v3`

A generic `/{owner}/{repository}` path is not sufficient to distinguish GitHub Enterprise Server from GitLab, Gitea, or Forgejo.

## Neutral references

GitHub recognizes issue and pull-request references such as:

- `#123`
- `owner/repository#123`
- `GH-123`
- a commit SHA
- configured external autolink identifiers

Recommended neutral footer:

```text
fix(api): prevent duplicate webhook delivery

Refs: #123
```

Cross-repository reference:

```text
fix(api): prevent duplicate webhook delivery

Refs: owner/platform#123
```

## Closing keywords

GitHub supports these keyword families:

- `close`, `closes`, `closed`
- `fix`, `fixes`, `fixed`
- `resolve`, `resolves`, `resolved`

Example:

```text
fix(api): prevent duplicate webhook delivery

Closes #123
```

Cross-repository example:

```text
fix(api): prevent duplicate webhook delivery

Fixes owner/platform#123
```

Important behavior:

- The issue closes when the commit or pull request reaches the repository's default branch.
- A closing keyword in a commit message can close the issue, but GitHub may not show the pull request as a linked pull request unless the PR itself is linked.
- Keywords may be uppercase and may be followed by a colon.
- Repeat the full closing syntax for every issue.
- Custom external autolinks are repository-specific and may link identifiers without changing their state.

## Sources

- GitHub Docs, Linking a pull request to an issue: https://docs.github.com/issues/tracking-your-work-with-issues/using-issues/linking-a-pull-request-to-an-issue
- GitHub Docs, Using keywords in issues and pull requests: https://docs.github.com/get-started/writing-on-github/working-with-advanced-formatting/using-keywords-in-issues-and-pull-requests
- GitHub Docs, Autolinked references and URLs: https://docs.github.com/get-started/writing-on-github/working-with-advanced-formatting/autolinked-references-and-urls
