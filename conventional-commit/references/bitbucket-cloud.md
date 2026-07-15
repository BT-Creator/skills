# Bitbucket Cloud commit-message integration

## Detect

Use this reference for repositories hosted on `bitbucket.org`.

Bitbucket Cloud has separate integrations for its built-in issue tracker and for Jira.

## Built-in Bitbucket issue tracker

The documented format is a command followed by an issue identifier. Keep `#` in the identifier.

Accepted identifier forms include:

- `#4711`
- `issue #4711`
- `bug #4711`
- `ticket #4711`

Neutral or link-oriented commands include `addresses`, `re`, `references`, `ref`, `refs`, and `see`.

```text
fix(search): escape reserved query characters

see #123
```

State-changing command groups include:

- Resolve: `close`, `closes`, `closed`, `closing`, `fix`, `fixed`, `fixes`, `fixing`, `resolve`, `resolves`, `resolved`, `resolving`
- Reopen: `reopen`, `reopens`, `reopening`
- Hold: `hold`, `holds`, `holding`
- Won't fix: `wontfix`
- Invalid: `invalidate`, `invalidates`, `invalidated`, `invalidating`

```text
fix(search): escape reserved query characters

fixes #123
```

The built-in tracker commands are case-insensitive.

## Jira linking

When Bitbucket Cloud is connected to Jira, an uppercase Jira key in a branch name, commit message, or pull-request title creates development links.

Recommended neutral footer:

```text
fix(search): escape reserved query characters

Refs: JRA-123
```

## Jira Smart Commits

Use Smart Commits only when an explicit Jira action is intended.

Basic form:

```text
<ISSUE-KEY> #<command> <optional arguments>
```

Common commands:

- `#comment`
- `#time`
- A workflow transition such as `#resolve` or `#close`

Examples:

```text
JRA-123 #comment handle colon and wildcard escaping
```

```text
JRA-123 #time 2h #resolve
```

A single Smart Commit command cannot span multiple lines.

## Sources

- Atlassian Support, Resolve issues automatically when users push code: https://support.atlassian.com/bitbucket-cloud/docs/resolve-issues-automatically-when-users-push-code/
- Atlassian Support, Use Bitbucket Cloud and Jira together: https://support.atlassian.com/bitbucket-cloud/docs/use-bitbucket-cloud-and-jira-together/
- Atlassian Support, Use Smart Commits: https://support.atlassian.com/bitbucket-cloud/docs/use-smart-commits/
