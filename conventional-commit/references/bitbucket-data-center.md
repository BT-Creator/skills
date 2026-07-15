# Bitbucket Data Center and Server commit-message integration

## Detect

Bitbucket Data Center and older Bitbucket Server installations use custom hostnames. Common URL clues include:

- Web path `/projects/<PROJECT>/repos/<repository>`
- HTTP clone path `/scm/<PROJECT>/<repository>.git`
- Bitbucket branding on a custom base URL

## Jira linking

With Jira integration enabled, including an uppercase Jira key in a commit, branch, or pull request links the development object to the Jira work item.

Recommended neutral footer:

```text
fix(queue): handle stale lock expiry

Refs: JRA-123
```

An installation may enforce Jira issue keys in commit messages. Follow repository-local hooks and contribution rules when present.

## Jira Smart Commits

Use Smart Commits only for intentional Jira comments, time logging, or workflow transitions.

Basic form:

```text
<ISSUE-KEY> #<command> <optional arguments>
```

Examples:

```text
JRA-123 #comment handle lock expiry after worker restart
```

```text
JRA-123 #time 2h #resolve
```

Important behavior:

- A single command cannot span multiple lines.
- Multiple commands may appear on one line.
- Multiple issue keys may share a command sequence where supported.
- Available transition names depend on the Jira workflow.

Do not assume GitHub-style `Fixes #123` behavior for Bitbucket Data Center unless the installation has a separate plugin or custom hook that documents it.

## Sources

- Atlassian Documentation, Jira integration for Bitbucket Data Center: https://confluence.atlassian.com/bitbucketserver/jira-integration-776639874.html
- Atlassian Documentation, Use Smart Commits: https://confluence.atlassian.com/bitbucketserver/use-smart-commits-802599018.html
- Atlassian Documentation, Specify the Bitbucket base URL: https://confluence.atlassian.com/bitbucketserver/specify-the-bitbucket-base-url-776640392.html
