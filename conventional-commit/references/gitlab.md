# GitLab commit-message integration

## Detect

Strong signals:

- `gitlab.com`
- Self-managed URLs with `/-/issues/` or `/-/merge_requests/`
- A custom GitLab hostname or a relative installation path such as `/gitlab`

## Neutral references

Common GitLab references include:

- Same project: `#123`
- Explicit GitLab form: `GL-123`
- Another project in the same group: `project#123`
- A full issue URL for unambiguous cross-project references

Recommended neutral footer:

```text
fix(worker): retry idempotent jobs on timeout

Ref #123
```

Cross-project example:

```text
feat(billing): add invoice export endpoint

Ref payments#77
```

## Automatic issue closing

GitLab closes referenced issues when text matching its closing pattern reaches the default branch, either through a direct commit or a merged merge request.

Example:

```text
fix(worker): retry idempotent jobs on timeout

Closes #123
```

Important behavior:

- Self-managed administrators can customize the closing pattern.
- A project can disable automatic closure of referenced issues on the default branch.
- Use a neutral reference when the instance's closing pattern is unknown.
- Crosslinks may also be created from branch names and merge-request descriptions.

## Jira integration

When GitLab's Jira integration is configured, uppercase Jira keys can create links. Jira closure can be configured with trigger words and workflow transition IDs.

Neutral Jira reference:

```text
fix(worker): retry idempotent jobs on timeout

Refs: PROJECT-123
```

Use `Resolves PROJECT-123`, `Closes PROJECT-123`, or `Fixes PROJECT-123` only when the Jira integration and intended transition are known.

## Sources

- GitLab Docs, Crosslinking issues: https://docs.gitlab.com/user/project/issues/crosslinking_issues/
- GitLab Docs, Manage issues: https://docs.gitlab.com/user/project/issues/managing_issues/
- GitLab Docs, Issue closing pattern: https://docs.gitlab.com/administration/issue_closing_pattern/
- GitLab Docs, Jira issue management: https://docs.gitlab.com/integration/jira/issues/
